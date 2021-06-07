package Net::Async::Spotify::Object::Generated::PublicUser;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=head1 NAME
 
Net::Async::Spotify::Object::Generated::PublicUser - Package representing Spotify PublicUser Object
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 PARAMETERS

Those are Spotify PublicUser Object attributes:

=over 4

=item display_name

Type: String
Description: The name displayed on the user’s profile. <code class="highlighter-rouge">null</code> if not available.

=item external_urls

Type: ExternalUrlObject
Description: Known public external URLs for this user.

=item followers

Type: FollowersObject
Description: Information about the followers of this user.

=item href

Type: String
Description: A link to the Web API endpoint for this user.

=item id

Type: String
Description: The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify user ID</a> for this user.

=item images

Type: Array[ImageObject]
Description: The user’s profile image.

=item type

Type: String
Description: The object type: “user”

=item uri

Type: String
Description: The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify URI</a> for this user.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        display_name => 'String',
        external_urls => 'ExternalUrlObject',
        followers => 'FollowersObject',
        href => 'String',
        id => 'String',
        images => 'Array[ImageObject]',
        type => 'String',
        uri => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;