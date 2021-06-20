package Net::Async::Spotify::Token;

use strict;
use warnings;

use Log::Any qw($log);
use Time::Moment;

=head1 DESCRIPTION

=head1 SYN

=head1 PARAMETERS

=over 4

=item access_token

Spotify App User access_token

=item refresh_token

Spotify App User refresh_token

=item token_scope

Spotify App User token allowed scope list

=back

=cut

sub new {
    my ( $class, %args ) = @_;

    my $self = bless \%args, $class;

    $self->access_token($self->{access_token}) if exists $self->{access_token};
    $self->scope($self->{scope}) if exists $self->{scope};

    return $self;
}

sub renew {
    my ( $self, $args ) = @_;
    for my $key ( keys %$args ) {
        $self->$key($args->{$key}) if $self->can($key);
    }
}

sub access_token {
    my ( $self, $token ) = @_;
    if ( defined $token ) {
        $self->{access_token} = $token;
        $self->{updated_at} = Time::Moment->now;
    }

    # By design we will allow a Token object to exists without an access_token
    # Mainly because we want to use its default expires_in field.
    # so just warn if tried to ues empty access_token
    $log->warn('Attempting to use a not yet set access_token') unless defined $self->{access_token};

    return $self->{access_token};
}

sub updated_at { shift->{updated_at} }

sub refresh_token {
    my ( $self, $token ) = @_;

    $self->{refresh_token} = $token if defined $token;

    return $self->{refresh_token};
}

sub token_type {
    my ( $self, $type ) = @_;

    $self->{token_type} = $type if defined $type;
    # Set it to default if not set.
    return $self->{token_type} //= 'Bearer';
}

sub expires_in {
    my ( $self, $expiry ) = @_;

    $self->{expires_in} = $expiry if defined $expiry;
    # Set it to default if not set
    return $self->{expires_in} //= 3600;
} 

sub scope {
    my ( $self, $scopes ) = @_;

    if ( defined $scopes ) {
        $self->{scope} = ref($scopes) eq 'ARRAY' ? $scopes : [ split ' ', $scopes ];
    }

    return $self->{scope};
}

sub header_string {
    my $self = shift;
    return join ' ', $self->token_type, $self->access_token;
}

1;
