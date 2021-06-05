package Net::Async::Spotify;

use strict;
use warnings;

# VERSION

# ABSTRACT: Interaction with the spotify.com API 

use parent qw(IO::Async::Notifier);

use Future::AsyncAwait;
use Syntax::Keyword::Try;
use Log::Any qw($log);
use Net::Async::HTTP;
use IO::Async::Timer::Periodic;
use URI;
use URI::QueryParam;
use MIME::Base64 qw(encode_base64 encode_base64url);
use Math::Random::Secure qw(irand);
use JSON::MaybeUTF8 qw(:v1);
use curry;

use Net::Async::Spotify::Scope qw(:all);

sub configure_unknown {
    my ($self, %args) = @_;
    for my $k (grep exists $args{$_}, qw(client_id client_secret redirect_uri access_token refresh_token base_uri)) {
        $self->{$k} = $args{$k};
    }
}

sub _add_to_loop {
    my $self = shift;
    $self->add_child(
        $self->{http} = Net::Async::HTTP->new(
            fail_on_error            => 1,
            close_after_request      => 0,
            max_connections_per_host => 2,
            pipeline                 => 1,
            max_in_flight            => 4,
            decode_content           => 1,
            stall_timeout            => 15,
            user_agent               => 'Mozilla/4.0 (perl; Net::Async::Spotify; VNEALV@cpan.org)',
        ));
    $self->add_child(
        $self->{token_timer} = IO::Async::Timer::Periodic->new(
            interval => $self->token_expiry - 46,
            on_tick  => $self->$curry::weak(sub {
                my $self = shift;
                $self->obtain_token()->retain;
            }),
        )
    );
}

=head1 PARAMETERS

=over 4

=item base_uri
Spotify base_uri default https://accounts.spotify.com/

=item client_id
Spotify App Client ID

=item client_secret
Spotify App Client Secret

=item redirect_uri
Spotify App callback URI

=item access_token
Spotify App User access_token

=item refresh_token
Spotify App User refresh_token

=item token_scope
Spotify App User token allowed scope list

=back

=cut

sub base_uri { shift->{base_uri} //= URI->new('https://accounts.spotify.com/') }

sub http     { shift->{http} }
sub token_timer { shift->{token_timer} }

sub client_id     { shift->{client_id} }
sub client_secret { shift->{client_secret} }
sub redirect_uri  { shift->{redirect_uri} //= URI->new('http://localhost/callback') }

sub access_token  { shift->{access_token} }
sub refresh_token { shift->{refresh_token} }
sub token_scope   { shift->{token_scope} }
sub token_type    { shift->{token_type} }
sub token_expiry  { shift->{token_expiry} //= 3600 }

=head1 METHODS

=head2 authorize

Returns URI object with it being the needed Spotify Authorization request along with the needed parameters set.
also return random hexadecimal number as the state attached to this request.
https://developer.spotify.com/documentation/general/guides/authorization-guide/ Step 1 in Authorization Code Flow.
Accepts limited named parameters

=over 4

=item client_id
Spotify ClientID, set to class client_id if not passed.

=item response_type
set as `code` for default. Since Authorization Code Flow is used.

=item redirect_uri
URI string that will be used as Authorization callback URL. Set to main app redirect_url if not peresnt.

=item state
Used as linking mechanism between this generated Authorize Request, and the incoming callback code response.
will be set to a random hexadecimal number.

=item scope
Sets permissions to be requested. Accepts array of scopes or scopes categories.
e.g. scope => [app_remote_control', 'user-follow-read', 'spotify_connect']

=item show_dialog
optional param can be passed set to either true|false

=back

=cut

sub authorize {
    my ($self, %args) = @_;
    my $allowed_params = join '|', qw(client_id response_type redirect_uri state scope show_dialog);

    $args{client_id} //= $self->client_id;
    $args{response_type} //= 'code';
    $args{redirect_uri} //= $self->redirect_uri->as_string;
    $args{state} //= sprintf '%08x', irand(2**32);
    $args{scope} = join ' ', map {  Net::Async::Spotify::Scope->$_ } $args{scope}->@* if exists $args{scope};

    # Don't leak any extra params
    delete $args{$_} for grep { !/$allowed_params/ } keys %args;

    my $auth_uri = URI->new($self->base_uri . 'authorize');
    $auth_uri->query_param($_, $args{$_}) for keys %args;
    return (uri => $auth_uri, state => $args{state});
    # request has to be viewed on browser and accepted.
    #
    # my $r = await $self->http->do_request(uri => $auth_uri, method => 'GET');
    # $log->warnf('rr %s', $r->content);
    # Once accepted redirect_url will be called with authorization code passed.
}

=head2 obtain_token

Method used to obtain access and refresh token from passed Authorization code.
https://developer.spotify.com/documentation/general/guides/authorization-guide/ Step 2 & 4 in Authorization Code Flow.
Accepts limited parameters, and based on them will decide whether to get new token from Authorization code
or from a previously obtained refresh token.

=over 4

=item code
representing Spotify Authorization Code, if passed, `grant_type` parameter will be set to authorization_code.
and the request will be for a new Spotify Token pair.

=item redirect_uri
optional, must be matching the one used to obtain code. Only used when `code` parameter is present

=item auto_refresh
if set it will start C<IO::Async::Timer::Periodic> in order to refresh access token before it expires.

=back

=cut

async sub obtain_token {
    my ($self, %args) = @_;
    my $allowed_params = join '|', qw(client_id client_secret grant_type redirect_uri code refresh_token);
    my $auto_refresh = delete $args{auto_refresh} || 0;

    if ( exists $args{code}) {
        $args{grant_type} = 'authorization_code';
        $args{redirect_uri} //= $self->redirect_uri->as_string;
    } else {
        $args{grant_type} = 'refresh_token';
        $args{refresh_token} = $self->refresh_token;
    }

    # We can also pass client_id & client_secret in body param
    # Instead of base64 encoded Authorization header
    $args{client_id} = $self->client_id;
    $args{client_secret} = $self->client_secret;

    # Don't leak any extra params
    delete $args{$_} for grep { !/$allowed_params/ } keys %args;

    my $result;
    try {
        $result = await $self->http->do_request(
            method => 'POST',
            uri => URI->new($self->base_uri . join '/', 'api', 'token'),
            content_type => 'application/x-www-form-urlencoded',
            content => [%args],
            headers => {
                Authorization => "Basic ". encode_base64(join(':', $self->client_id, $self->client_secret), ''),
            },
        );
        $result = decode_json_utf8($result->decoded_content);
    } catch ($e) {
        $log->errorf('Error obtaining Access token | %s', $e);
        return;
    }

    $self->{access_token} = $result->{access_token};
    $self->{refresh_token} = $result->{refresh_token} if exists $result->{refresh_token};
    $self->{token_scope} = [ split ' ', $result->{scope} ];
    $self->{token_type} = $result->{token_type};
    $self->{token_expiry} = $result->{expires_in};

    $log->debugf('RESULT: %s', $result);
    if ($auto_refresh) {
        $log->infof('Enabling auto token refresh...');
        $self->token_timer->start;
    }

}

1;
