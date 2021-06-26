package Net::Async::Spotify::Object::Generated::Recommendations;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::Recommendations - Package representing Spotify Recommendations Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify Recommendations Object attributes:

=over 4

=item seeds

Type:Array[RecommendationSeedObject]
Description:An array of recommendation seed objects.

=item tracks

Type:Array[SimplifiedTrackObject]
Description:An array of track object (simplified) ordered according to the parameters supplied.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        seeds => 'Array[RecommendationSeedObject]',
        tracks => 'Array[SimplifiedTrackObject]',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
