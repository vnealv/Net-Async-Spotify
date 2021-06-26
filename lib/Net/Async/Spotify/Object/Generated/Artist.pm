package Net::Async::Spotify::Object::Generated::Artist;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::Artist - Package representing Spotify Artist Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify Artist Object attributes:

=over 4

=item external_urls

Type:ExternalUrlObject
Description:Known external URLs for this artist.

=item followers

Type:FollowersObject
Description:Information about the followers of the artist.

=item genres

Type:Array[String]
Description:A list of the genres the artist is associated with. For example: "Prog Rock" , "Post-Grunge". (If not yet classified, the array is empty.)

=item href

Type:String
Description:A link to the Web API endpoint providing full details of the artist.

=item id

Type:String
Description:The Spotify ID for the artist.

=item images

Type:Array[ImageObject]
Description:Images of the artist in various sizes, widest first.

=item name

Type:String
Description:The name of the artist.

=item popularity

Type:Integer
Description:The popularity of the artist. The value will be between 0 and 100, with 100 being the most popular. The artist’s popularity is calculated from the popularity of all the artist’s tracks.

=item type

Type:String
Description:The object type: "artist"

=item uri

Type:String
Description:The Spotify URI for the artist.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        external_urls => 'ExternalUrlObject',
        followers => 'FollowersObject',
        genres => 'Array[String]',
        href => 'String',
        id => 'String',
        images => 'Array[ImageObject]',
        name => 'String',
        popularity => 'Integer',
        type => 'String',
        uri => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
