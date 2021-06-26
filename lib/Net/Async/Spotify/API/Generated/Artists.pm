package Net::Async::Spotify::API::Generated::Artists;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=encoding utf8

=head1 NAME

Net::Async::Spotify::API::Generated::Artists - Package representing Spotify Artists API

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.

=head1 METHODS

=cut

=head2 get_an_artist

get_an_artist - Get an Artist

Get Spotify catalog information for a single artist identified by their unique Spotify ID.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials.

=back

=head3 path_parameter

=over 4

=item id

Type: string | Required: required
The Spotify ID of the artist.

=back

and Response Objects being:

- artist object


On success, the HTTP status code in the response header is 200 OK and the response body contains an artist object in JSON format. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_an_artist {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/artists/{id}';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'id' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'artist object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_an_artists_albums

get_an_artists_albums - Get an Artist's Albums

Get Spotify catalog information about an artist’s albums.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials.

=back

=head3 path_parameter

=over 4

=item id

Type: string | Required: required
The Spotify ID for the artist.

=back

=head3 query_parameter

=over 4

=item include_groups

Type: string | Required: optional
A comma-separated list of keywords that will be used to filter the response. If not supplied, all album types will be returned. Valid values are:- album- single- appears_on- compilationFor example: include_groups=album,single.

=item limit

Type: integer | Required: optional
The number of album objects to return. Default: 20. Minimum: 1. Maximum: 50. For example: limit=2

=item market

Type: string | Required: optional
Synonym for country. An ISO 3166-1 alpha-2 country code or the string from_token.Supply this parameter to limit the response to one particular geographical market. For example, for albums available in Sweden: market=SE.If not given, results will be returned for all markets and you are likely to get duplicate results per album, one for each market in which the album is available!

=item offset

Type: integer | Required: optional
The index of the first album to return. Default: 0 (i.e., the first album). Use with limit to get the next set of albums.

=back

and Response Objects being:

- album object


On success, the HTTP status code in the response header is 200 OK and the response body contains an array of simplified album objects (wrapped in a paging object) in JSON format. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_an_artists_albums {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/artists/{id}/albums';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'id' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'include_groups' => {
                type     => 'string',
                required => 'optional',
            },
            'limit' => {
                type     => 'integer',
                required => 'optional',
            },
            'market' => {
                type     => 'string',
                required => 'optional',
            },
            'offset' => {
                type     => 'integer',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'album object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_an_artists_related_artists

get_an_artists_related_artists - Get an Artist's Related Artists

Get Spotify catalog information about artists similar to a given artist. Similarity is based on analysis of the Spotify community’s listening history.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials.

=back

=head3 path_parameter

=over 4

=item id

Type: string | Required: required
The Spotify ID for the artist

=back

and Response Objects being:

- an object


On success, the HTTP status code in the response header is 200 OK and the response body contains an object whose key is "artists" and whose value is an array of up to 20 artist objects in JSON format. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_an_artists_related_artists {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/artists/{id}/related-artists';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'id' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'an object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_an_artists_top_tracks

get_an_artists_top_tracks - Get an Artist's Top Tracks

Get Spotify catalog information about an artist’s top tracks by country.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials.

=back

=head3 path_parameter

=over 4

=item id

Type: string | Required: required
The Spotify ID for the artist

=back

=head3 query_parameter

=over 4

=item market

Type: string | Required: required
An ISO 3166-1 alpha-2 country code or the string from_token. Synonym for country.

=back

and Response Objects being:

- an object


On success, the HTTP status code in the response header is 200 OK and the response body contains an object whose key is "tracks" and whose value is an array of up to 10 track objects in JSON format. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_an_artists_top_tracks {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/artists/{id}/top-tracks';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'id' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'market' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'an object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_multiple_artists

get_multiple_artists - Get Multiple Artists

Get Spotify catalog information for several artists based on their Spotify IDs.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials.

=back

=head3 query_parameter

=over 4

=item ids

Type: string | Required: required
A comma-separated list of the Spotify IDs for the artists. Maximum: 50 IDs.

=back

and Response Objects being:

- an object
- an object


On success, the HTTP status code in the response header is 200 OK and the response body contains an object whose key is "artists" and whose value is an array of artist objects in JSON format.Objects are returned in the order requested. If an object is not found, a null value is returned in the appropriate position. Duplicate ids in the query will result in duplicate objects in the response. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_multiple_artists {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/artists';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'ids' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'an object',
        'an object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

1;
