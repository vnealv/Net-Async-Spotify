package Net::Async::Spotify::API::Generated::Shows;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=encoding utf8

=head1 NAME

Net::Async::Spotify::API::Generated::Shows - Package representing Spotify Shows API

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.

=head1 METHODS

=cut

=head2 get_a_show

get_a_show - Get a Show

Get Spotify catalog information for a single show identified by its
unique Spotify ID.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service:
see the Web API Authorization Guide
for details.

=back

=head3 path_parameter

=over 4

=item id

Type: string | Required: required
The Spotify ID
for the show.

=back

=head3 query_parameter

=over 4

=item market

Type: string | Required: optional
An ISO 3166-1 alpha-2 country code.
If a country code is specified, only shows and episodes that are available in that market will be returned.
If a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.
Note: If neither market or user country are provided, the content is considered unavailable for the client.
Users can view the country that is associated with their account in the account settings.

=back

and Response Objects being:

- show object


On success, the HTTP status code in the response header is 200
OK and the response body contains a show object
in JSON format.
On error, the header status code is an error code
and the response body contains an error object.
If a show is unavailable in the given market the HTTP status code in the response header is 404 NOT FOUND.Try in our Web Console

=cut

async sub get_a_show {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/shows/{id}';
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
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'show object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_a_shows_episodes

get_a_shows_episodes - Get a Show's Episodes

Get Spotify catalog information about an show’s episodes. Optional parameters can be used to limit the number of episodes returned.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details.

=back

=head3 path_parameter

=over 4

=item id

Type: string | Required: required
The Spotify ID for the show.

=back

=head3 query_parameter

=over 4

=item limit

Type: integer | Required: optional
The maximum number of episodes to return. Default: 20. Minimum: 1. Maximum: 50.

=item market

Type: string | Required: optional
An ISO 3166-1 alpha-2 country code.
If a country code is specified, only shows and episodes that are available in that market will be returned.
If a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.
Note: If neither market or user country are provided, the content is considered unavailable for the client.
Users can view the country that is associated with their account in the account settings.

=item offset

Type: integer | Required: optional
The index of the first episode to return. Default: 0 (the first object). Use with limit to get the next set of episodes.

=back

and Response Objects being:

- episode object


On success, the HTTP status code in the response header is 200 OK and the response body contains an array of simplified episode objects (wrapped in a paging object) in JSON format.
On error, the header status code is an error code and the response body contains an error object.
If a show is unavailable in the given market the HTTP status code in the response header is 404 NOT FOUND. Unavailable episodes are filtered out.Try in our Web Console

=cut

async sub get_a_shows_episodes {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/shows/{id}/episodes';
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
        'episode object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_multiple_shows

get_multiple_shows - Get Multiple Shows

Get Spotify catalog information for several shows based on their Spotify IDs.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service:
see the Web API Authorization Guide
for details.

=back

=head3 query_parameter

=over 4

=item ids

Type: string | Required: required
A comma-separated list of the Spotify IDs for the shows. Maximum: 50 IDs.

=item market

Type: string | Required: optional
An ISO 3166-1 alpha-2 country code.
If a country code is specified, only shows and episodes that are available in that market will be returned.
If a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.
Note: If neither market or user country are provided, the content is considered unavailable for the client.
Users can view the country that is associated with their account in the account settings.

=back

and Response Objects being:

- an object
- an object


On success, the HTTP status code in the response header is 200
OK and the response body contains an object whose key is shows and whose
value is an array of simple show object
in JSON format.Objects are returned in the order requested. If an object is not found, a null value is returned in the appropriate position. If a show is unavailable in the given market, a null value is returned. Duplicate ids in the query will result in duplicate objects in the response. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_multiple_shows {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/shows';
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
            'market' => {
                type     => 'string',
                required => 'optional',
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
