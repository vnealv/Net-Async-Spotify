package Net::Async::Spotify::API::Generated::Shows;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

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
see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a>
for details.

=back

=head3 path_parameter

=over 4 

=item id

Type: string | Required: required
The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify ID</a>
for the show.

=back

=head3 query_parameter

=over 4 

=item market

Type: string | Required: optional
An <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2 country code</a>.
If a country code is specified, only shows and episodes that are available in that market will be returned.<br />
If a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.<br />
<em>Note: If neither market or user country are provided, the content is considered unavailable for the client.</em><br />
Users can view the country that is associated with their account in the <a href="https://www.spotify.com/se/account/overview/">account settings</a>.

=back

and Response Objects being:

- show object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code>
OK and the response body contains a <a href="/documentation/web-api/reference/#object-showobject">show object</a>
in JSON format.<br />
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a>
and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<br />
If a show is unavailable in the given <code class="highlighter-rouge">market</code> the HTTP status code in the response header is <code class="highlighter-rouge">404</code> NOT FOUND.<a class="btn btn-sm btn-primary" href="/console/get-show/?id=38bS44xjbVVZ3No3ByF1dJ" target="_blank">Try in our Web Console</a>

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

get_a_shows_episodes - Get a Show&#39;s Episodes

Get Spotify catalog information about an show’s episodes. Optional parameters can be used to limit the number of episodes returned.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.

=back

=head3 path_parameter

=over 4 

=item id

Type: string | Required: required
The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify ID</a> for the show.

=back

=head3 query_parameter

=over 4 

=item limit

Type: integer | Required: optional
The maximum number of episodes to return. Default: 20. Minimum: 1. Maximum: 50.

=item market

Type: string | Required: optional
An <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2 country code</a>.
If a country code is specified, only shows and episodes that are available in that market will be returned.<br />
If a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.<br />
<em>Note: If neither market or user country are provided, the content is considered unavailable for the client.</em><br />
Users can view the country that is associated with their account in the <a href="https://www.spotify.com/se/account/overview/">account settings</a>.

=item offset

Type: integer | Required: optional
The index of the first episode to return. Default: 0 (the first object). Use with limit to get the next set of episodes.

=back

and Response Objects being:

- episode object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body contains an array of <a href="/documentation/web-api/reference/#object-simplifiedepisodeobject">simplified episode objects</a> (wrapped in a <a href="/documentation/web-api/reference/#object-pagingobject">paging object</a>) in JSON format.<br />
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#error-details">error object</a>.<br />
If a show is unavailable in the given <code class="highlighter-rouge">market</code> the HTTP status code in the response header is <code class="highlighter-rouge">404</code> NOT FOUND. Unavailable episodes are filtered out.<a class="btn btn-sm btn-primary" href="/console/get-show-episodes/" target="_blank">Try in our Web Console</a>

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
see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a>
for details.

=back

=head3 query_parameter

=over 4 

=item ids

Type: string | Required: required
A comma-separated list of the <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify IDs</a> for the shows. Maximum: 50 IDs.

=item market

Type: string | Required: optional
An <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2 country code</a>.
If a country code is specified, only shows and episodes that are available in that market will be returned.<br />
If a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.<br />
<em>Note: If neither market or user country are provided, the content is considered unavailable for the client.</em><br />
Users can view the country that is associated with their account in the <a href="https://www.spotify.com/se/account/overview/">account settings</a>.

=back

and Response Objects being:

- an object
- an object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code>
OK and the response body contains an object whose key is <code class="highlighter-rouge">shows</code> and whose
value is an array of <a href="/documentation/web-api/reference/#object-simplifiedshowobject">simple show object</a>
in JSON format.Objects are returned in the order requested. If an object is not found, a <code class="highlighter-rouge">null</code> value is returned in the appropriate position. If a show is unavailable in the given <code class="highlighter-rouge">market</code>, a <code class="highlighter-rouge">null</code> value is returned. Duplicate <code class="highlighter-rouge">ids</code> in the query will result in duplicate objects in the response. On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/get-several-shows/?ids=5CfCWKI5pZ28U0uOzXkDHe,5as3aKmN2k11yfDDDSrvaZ" target="_blank">Try in our Web Console</a>

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