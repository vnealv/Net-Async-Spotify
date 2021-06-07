package Net::Async::Spotify::Object::Generated::Context;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=head1 NAME
 
Net::Async::Spotify::Object::Generated::Context - Package representing Spotify Context Object
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 PARAMETERS

Those are Spotify Context Object attributes:

=over 4

=item external_urls

Type: ExternalUrlObject
Description: External URLs for this context.

=item href

Type: String
Description: A link to the Web API endpoint providing full details of the track.

=item type

Type: String
Description: The object type, e.g. “artist”, “playlist”, “album”, “show”.

=item uri

Type: String
Description: The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify URI</a> for the context.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        external_urls => 'ExternalUrlObject',
        href => 'String',
        type => 'String',
        uri => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
