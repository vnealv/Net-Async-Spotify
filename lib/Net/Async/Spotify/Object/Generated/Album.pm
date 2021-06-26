package Net::Async::Spotify::Object::Generated::Album;

use strict;
use warnings;

# VERSION

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::Album - Package representing Spotify Album Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify Album Object attributes:

=over 4

=item album_type

Type: String
Description: The type of the album: album, single, or compilation.

=item artists

Type: Array[ArtistObject]
Description: The artists of the album. Each artist object includes a link in href to more detailed information about the artist.

=item available_markets

Type: Array[String]
Description: The markets in which the album is available: ISO 3166-1 alpha-2 country codes. Note that an album is considered available in a market when at least 1 of its tracks is available in that market.

=item copyrights

Type: Array[CopyrightObject]
Description: The copyright statements of the album.

=item external_ids

Type: ExternalIdObject
Description: Known external IDs for the album.

=item external_urls

Type: ExternalUrlObject
Description: Known external URLs for this album.

=item genres

Type: Array[String]
Description: A list of the genres used to classify the album. For example: “Prog Rock” , “Post-Grunge”. (If not yet classified, the array is empty.)

=item href

Type: String
Description: A link to the Web API endpoint providing full details of the album.

=item id

Type: String
Description: The Spotify ID for the album.

=item images

Type: Array[ImageObject]
Description: The cover art for the album in various sizes, widest first.

=item label

Type: String
Description: The label for the album.

=item name

Type: String
Description: The name of the album. In case of an album takedown, the value may be an empty string.

=item popularity

Type: Integer
Description: The popularity of the album. The value will be between 0 and 100, with 100 being the most popular. The popularity is calculated from the popularity of the album’s individual tracks.

=item release_date

Type: String
Description: The date the album was first released, for example “1981-12-15”. Depending on the precision, it might be shown as “1981” or “1981-12”.

=item release_date_precision

Type: String
Description: The precision with which release_date value is known: “year” , “month” , or “day”.

=item restrictions

Type: AlbumRestrictionObject
Description: Included in the response when a content restriction is applied.
See Restriction Object for more details.

=item total_tracks

Type: Integer
Description: The total number of tracks in the album.

=item tracks

Type: Array[SimplifiedTrackObject]
Description: The tracks of the album.

=item type

Type: String
Description: The object type: “album”

=item uri

Type: String
Description: The Spotify URI for the album.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        album_type => 'String',
        artists => 'Array[ArtistObject]',
        available_markets => 'Array[String]',
        copyrights => 'Array[CopyrightObject]',
        external_ids => 'ExternalIdObject',
        external_urls => 'ExternalUrlObject',
        genres => 'Array[String]',
        href => 'String',
        id => 'String',
        images => 'Array[ImageObject]',
        label => 'String',
        name => 'String',
        popularity => 'Integer',
        release_date => 'String',
        release_date_precision => 'String',
        restrictions => 'AlbumRestrictionObject',
        total_tracks => 'Integer',
        tracks => 'Array[SimplifiedTrackObject]',
        type => 'String',
        uri => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
