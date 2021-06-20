package Net::Async::Spotify::API;

use strict;
use warnings;

use Future::AsyncAwait;

use Scalar::Util qw(isweak weaken);
use Module::Runtime qw(require_module);

=head1 NAME

    Net::Async::Spotify::API - Common Wrapper Package for Spotify API Classes.

=head1 DESCRIPTION

Common Wrapper class to be used in order to give you access for all available Spotify API
It will create an instance for the requested API when invoked.
also you can limit which APIs you want to be avaliable by passing them in C<apis>

=head1 SYNOPSIS

Created to give you back Generic Spotify API wrapper
Can't be used by itself, as in Net::Async::Spotify object must be passed.

    use Net::Async::Spotify;
    use Net::Async::Spotify::API;

    my $spotify = Net::Async::Spotify->new;
    my $api = Net::Async::Spotify::API->new(
        spotify => Net::Async::Spotify->new, # Required
        apis    => [qw(albums tracks)],      # optional
    );

    print ref($api->albums);
    # Net::Async::Spotify::API::Albums


=head1 METHODS

=head2 new

Initiate Spotify API Common wrapper. Accepts:

=over 4

=item spotify

C<Net::Async::Spotify> object must be passed.

=item apis

arrayref of the needed Spotify APIs to be availabe, if not passed will define all available APIs.

=back

=cut

sub new {
    my ($class, %args) = @_;
    die "Net::Async::Spotify has to be provided" unless $args{spotify} and $args{spotify}->isa('Net::Async::Spotify');
    my $apis = delete $args{apis} || [qw(albums artists browse episodes follow library markets personalization player playlists search shows tracks users)];
    my $self = bless \%args, $class;
    weaken($self->{spotify}) unless isweak($self->{spotify});
    $self->prepare_apis($apis);

    return $self;
}

sub spotify { shift->{spotify} }


sub prepare_apis {
    my ($self, $apis) = @_;

    for ( @$apis ) {
        my $api = lc $_;
        my $accessor = join '::', ref($self), $api;
        {
            no strict 'refs';
            *{$accessor} = sub {
                my $self = shift;
                # Define when called. And then cache it.
                return $self->{$api} //= do {
                    my $class = join '::', 'Net::Async::Spotify::API', ucfirst $api; 
                    require_module($class);
                    # Note its not weak anymore, since passing a copy.
                    $class->new(spotify => $self->spotify);
                };
            };
        }
    }
}

1;
