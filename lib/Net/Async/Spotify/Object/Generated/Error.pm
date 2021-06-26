package Net::Async::Spotify::Object::Generated::Error;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::Error - Package representing Spotify Error Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify Error Object attributes:

=over 4

=item message

Type:String
Description:A short description of the cause of the error.

=item status

Type:Integer
Description:The HTTP status code (also returned in the response header; see Response Status Codes for more information).

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        message => 'String',
        status => 'Integer',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
