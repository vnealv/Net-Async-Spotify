package Net::Async::Spotify::Object::Generated::Show;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::Show - Package representing Spotify Show Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify Show Object attributes:

=over 4

=item available_markets

Type:Array[String]
Description:A list of the countries in which the show can be played, identified by their ISO 3166-1 alpha-2 code.

=item copyrights

Type:Array[CopyrightObject]
Description:The copyright statements of the show.

=item description

Type:String
Description:A description of the show. HTML tags are stripped away from this field, use html_description field in case HTML tags are needed.

=item episodes

Type:Array[SimplifiedEpisodeObject]
Description:A list of the show’s episodes.

=item explicit

Type:Boolean
Description:Whether or not the show has explicit content (true = yes it does; false = no it does not OR unknown).

=item external_urls

Type:ExternalUrlObject
Description:External URLs for this show.

=item href

Type:String
Description:A link to the Web API endpoint providing full details of the show.

=item html_description

Type:String
Description:A description of the show. This field may contain HTML tags.

=item id

Type:String
Description:The Spotify ID for the show.

=item images

Type:Array[ImageObject]
Description:The cover art for the show in various sizes, widest first.

=item is_externally_hosted

Type:Boolean
Description:True if all of the show’s episodes are hosted outside of Spotify’s CDN. This field might be null in some cases.

=item languages

Type:Array[String]
Description:A list of the languages used in the show, identified by their ISO 639 code.

=item media_type

Type:String
Description:The media type of the show.

=item name

Type:String
Description:The name of the episode.

=item publisher

Type:String
Description:The publisher of the show.

=item type

Type:String
Description:The object type: “show”.

=item uri

Type:String
Description:The Spotify URI for the show.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        available_markets => 'Array[String]',
        copyrights => 'Array[CopyrightObject]',
        description => 'String',
        episodes => 'Array[SimplifiedEpisodeObject]',
        explicit => 'Boolean',
        external_urls => 'ExternalUrlObject',
        href => 'String',
        html_description => 'String',
        id => 'String',
        images => 'Array[ImageObject]',
        is_externally_hosted => 'Boolean',
        languages => 'Array[String]',
        media_type => 'String',
        name => 'String',
        publisher => 'String',
        type => 'String',
        uri => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
