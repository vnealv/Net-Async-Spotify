package Net::Async::Spotify::Object::Generated::TrackRestriction;

use strict;
use warnings;

# VERSION

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::TrackRestriction - Package representing Spotify TrackRestriction Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify TrackRestriction Object attributes:

=over 4

=item reason

Type: String
Description: The reason for the restriction. Supported values:

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        reason => 'String',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
