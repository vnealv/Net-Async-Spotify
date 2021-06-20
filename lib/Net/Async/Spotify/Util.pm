package Net::Async::Spotify::Util;

use strict;
use warnings;

use Log::Any qw($log);
use Syntax::Keyword::Try;

use Exporter 'import';
our @EXPORT_OK = qw(response_object_map);

=head1 NAME

    Net::Async::Spotify::Util - Helper class for some common functions.

=head1 DESCRIPTION

Helper class that will have some functions that are general and can be used across library.

=cut

my %uri_responses = (
    'https://api.spotify.com/v1/artists/{id}/albums' => 'Album',
    'https://api.spotify.com/v1/me/player/devices'   => 'Devices',
);

=head1 METHODS

=head2 response_object_map

Due to the unstructured response details in Spotify documentation page in regards they type of response for every request.
This method will act as a reliable mapping for Spotify API responses to their desired Objects type.

=cut

sub response_object_map {
    my ($available_types, $res_hash) = @_;
    
    my $possible_types = $res_hash->{response_objs};
    my $for_uri = $res_hash->{uri};
    $log->tracef('Got response object to map. Possible_types: %s | for_uri: %s', $possible_types, $for_uri);
    return undef if scalar(@$possible_types) == 0 and !exists $uri_responses{$for_uri};

    my $possible_name;
    unless ( exists $uri_responses{$for_uri} ) {
        my $possible_t = $possible_types->[0];
        #my $type = ($possible_t =~ /^[^\s]+/);
        my @type = split ' ', $possible_t;
        # Search for exact first, then check composite ones.
        ($possible_name) = grep { /^$type[0]$/i } @$available_types;
        ($possible_name) = grep { /$type[0]/gi } @$available_types unless defined $possible_name;
        return undef unless defined $possible_name;
    } else {
       $possible_name = $uri_responses{$for_uri}; 
    }
    my $class = join '::', 'Net::Async::Spotify::Object', $possible_name;

    return $class;

}

1;
