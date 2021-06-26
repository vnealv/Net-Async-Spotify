package Net::Async::Spotify::Object::Generated::Category;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=head1 NAME
 
Net::Async::Spotify::Object::Generated::Category - Package representing Spotify Category Object
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 PARAMETERS

Those are Spotify Category Object attributes:

=over 4

=item href

Type: String
Description: A link to the Web API endpoint returning full details of the category.

=item icons

Type: Array[ImageObject]
Description: The category icon, in various sizes.

=item id

Type: String
Description: The Spotify category ID of the category.

=item name

Type: String
Description: The name of the category.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        href => 'String',
        icons => 'Array[ImageObject]',
        id => 'String',
        name => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
