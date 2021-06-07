package Net::Async::Spotify::Object::Generated::Paging;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=head1 NAME
 
Net::Async::Spotify::Object::Generated::Paging - Package representing Spotify Paging Object
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 PARAMETERS

Those are Spotify Paging Object attributes:

=over 4

=item href

Type: String
Description: A link to the Web API endpoint returning the full result of the request

=item items

Type: Array[Object]
Description: The requested data.

=item limit

Type: Integer
Description: The maximum number of items in the response (as set in the query or by default).

=item next

Type: String
Description: URL to the next page of items. ( <code class="highlighter-rouge">null</code> if none)

=item offset

Type: Integer
Description: The offset of the items returned (as set in the query or by default)

=item previous

Type: String
Description: URL to the previous page of items. ( <code class="highlighter-rouge">null</code> if none)

=item total

Type: Integer
Description: The total number of items available to return.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        href => 'String',
        items => 'Array[Object]',
        limit => 'Integer',
        next => 'String',
        offset => 'Integer',
        previous => 'String',
        total => 'Integer',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
