package Net::Async::Spotify::Object::Generated::SavedTrack;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=head1 NAME
 
Net::Async::Spotify::Object::Generated::SavedTrack - Package representing Spotify SavedTrack Object
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 PARAMETERS

Those are Spotify SavedTrack Object attributes:

=over 4

=item added_at

Type: Timestamp
Description: The date and time the track was saved.
Timestamps are returned in ISO 8601 format as Coordinated Universal Time (UTC) with a zero offset: YYYY-MM-DDTHH:MM:SSZ.
If the time is imprecise (for example, the date/time of an album release), an additional field indicates the precision; see for example, release_date in an album object.

=item track

Type: TrackObject
Description: Information about the track.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        added_at => 'Timestamp',
        track => 'TrackObject',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;