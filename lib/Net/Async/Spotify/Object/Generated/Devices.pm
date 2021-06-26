package Net::Async::Spotify::Object::Generated::Devices;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::Devices - Package representing Spotify Devices Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify Devices Object attributes:

=over 4

=item devices

Type:Array[DeviceObject]
Description:A list of 0..n Device objects

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        devices => 'Array[DeviceObject]',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
