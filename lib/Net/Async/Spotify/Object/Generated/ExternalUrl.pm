package Net::Async::Spotify::Object::Generated::ExternalUrl;

use strict;
use warnings;

# VERSION

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::ExternalUrl - Package representing Spotify ExternalUrl Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify ExternalUrl Object attributes:

=over 4

=item spotify

Type: String
Description: The Spotify URL for the object.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        spotify => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
