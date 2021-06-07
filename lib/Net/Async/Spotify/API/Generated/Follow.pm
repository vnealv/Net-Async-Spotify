package Net::Async::Spotify::API::Generated::Follow;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=head1 NAME
 
Net::Async::Spotify::API::Generated::Follow - Package representing Spotify Follow API
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 METHODS

=cut


=head2 check_current_user_follows

check_current_user_follows - Get Following State for Artists/Users

Check to see if the current user is following one or more artists or other Spotify users.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials. Requires the <code class="highlighter-rouge">user-follow-read</code> scope.

=back

=head3 query_parameter

=over 4 

=item ids

Type: string | Required: required
A comma-separated list of the artist or the user <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify IDs</a> to check. For example: <code class="highlighter-rouge">ids=74ASZWbe4lXaubB36ztrGX,08td7MxkoHQkXnWAYD8d6Q</code>. A maximum of 50 IDs can be sent in one request.

=item type

Type: string | Required: required
The ID type: either <code class="highlighter-rouge">artist</code> or <code class="highlighter-rouge">user</code>.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body contains a JSON array of <code class="highlighter-rouge">true</code> or <code class="highlighter-rouge">false</code> values, in the same order in which the <code class="highlighter-rouge">ids</code> were specified.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/get-following-contains/?type=user&amp;ids=exampleuser01" target="_blank">Try in our Web Console</a>

=cut

async sub check_current_user_follows {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/following/contains';
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
            'type' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 check_if_user_follows_playlist

check_if_user_follows_playlist - Check if Users Follow a Playlist

Check to see if one or more Spotify users are following a specified playlist.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials. Requires the <code class="highlighter-rouge">playlist-read-private</code> scope if a private playlist is requested.

=back

=head3 path_parameter

=over 4 

=item playlist_id

Type: string | Required: required
The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify ID</a> of the playlist.

=back

=head3 query_parameter

=over 4 

=item ids

Type: string | Required: required
A comma-separated list of <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify User IDs</a> ; the ids of the users that you want to check to see if they follow the playlist. Maximum: 5 ids.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body contains a JSON array of <code class="highlighter-rouge">true</code> or <code class="highlighter-rouge">false</code> values, in the same order in which the <code class="highlighter-rouge">ids</code> were specified.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/get-playlist-followers-contains/?ids=possan,elogain&amp;user_id=jmperezperez&amp;playlist_id=2v3iNvBX8Ay1Gt2uXtUKUT" target="_blank">Try in our Web Console</a>

=cut

async sub check_if_user_follows_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/followers/contains';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'playlist_id' => {
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
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 follow_artists_users

follow_artists_users - Follow Artists or Users

Add the current user as a follower of one or more artists or other Spotify users.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials. Requires the <code class="highlighter-rouge">user-follow-modify</code> scope.

=item Content-Type

Type: string | Required: optional
<em>Required if IDs are passed in the request body, otherwise ignored</em>. The content type of the request body: <code class="highlighter-rouge">application/json</code>

=back

=head3 json_body_parameter

=over 4 

=item ids

Type: array[string] | Required: required
A JSON array of the artist or user <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify IDs</a>.
For example: <code class="highlighter-rouge">{ids:[&quot;74ASZWbe4lXaubB36ztrGX&quot;, &quot;08td7MxkoHQkXnWAYD8d6Q&quot;]}</code>. A maximum of 50 IDs can be sent in one request. <em>Note: if the <code class="highlighter-rouge">ids</code> parameter is present in the query string, any IDs listed here in the body will be ignored.</em>

=back

=head3 query_parameter

=over 4 

=item ids

Type: string | Required: required
A comma-separated list of the artist or the user <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify IDs</a>.
For example: <code class="highlighter-rouge">ids=74ASZWbe4lXaubB36ztrGX,08td7MxkoHQkXnWAYD8d6Q</code>. A maximum of 50 IDs can be sent in one request.

=item type

Type: string | Required: required
The ID type: either <code class="highlighter-rouge">artist</code> or <code class="highlighter-rouge">user</code>.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">204</code> No Content and the response body is empty.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/put-following/?type=user&amp;ids=exampleuser01" target="_blank">Try in our Web Console</a>

=cut

async sub follow_artists_users {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/following';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
            'Content-Type' => {
                type     => 'string',
                required => 'optional',
            },
        },
        json_body_parameter => {
            'ids' => {
                type     => 'array[string]',
                required => 'required',
            },
        },
        query_parameter => {
            'ids' => {
                type     => 'string',
                required => 'required',
            },
            'type' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 follow_playlist

follow_playlist - Follow a Playlist

Add the current user as a follower of a playlist.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details. The access token must have been issued on behalf of the user.<br />Following a playlist publicly requires authorization of the <code class="highlighter-rouge">playlist-modify-public</code> scope; following a playlist privately requires the <code class="highlighter-rouge">playlist-modify-private</code> scope. See <a href="/documentation/general/guides/authorization-guide/#list-of-scopes">Using Scopes</a>.<br /><em>Note that the scopes you provide relate only to whether the current user is following the playlist publicly or privately (i.e. showing others what they are following), not whether the playlist itself is public or private.</em>

=item Content-Type

Type: string | Required: required
The content type of the request body: <code class="highlighter-rouge">application/json</code>

=back

=head3 json_body_parameter

=over 4 

=item public

Type: boolean | Required: optional
Defaults to <code class="highlighter-rouge">true</code>. If <code class="highlighter-rouge">true</code> the playlist will be included in user’s public playlists, if <code class="highlighter-rouge">false</code> it will remain private.

=back

=head3 path_parameter

=over 4 

=item playlist_id

Type: string | Required: required
The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify ID</a> of the playlist. Any playlist can be followed, regardless of its <a href="/documentation/general/guides/working-with-playlists/#public-private-and-collaborative-status">public/private status</a>, as long as you know its playlist ID.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body is empty.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/put-playlist-followers/?playlist_id=2v3iNvBX8Ay1Gt2uXtUKUT&amp;body-json=%7B%0D%0A++%22public%22%3A+true%0D%0A%7D&amp;user_id=jmperezperez" target="_blank">Try in our Web Console</a>

=cut

async sub follow_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/followers';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
            'Content-Type' => {
                type     => 'string',
                required => 'required',
            },
        },
        json_body_parameter => {
            'public' => {
                type     => 'boolean',
                required => 'optional',
            },
        },
        path_parameter => {
            'playlist_id' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_followed

get_followed - Get User&#39;s Followed Artists

Get the current user’s followed artists.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials. Requires the <code class="highlighter-rouge">user-follow-modify</code> scope.

=back

=head3 query_parameter

=over 4 

=item after

Type: string | Required: optional
The last artist ID retrieved from the previous request.

=item limit

Type: integer | Required: optional
The maximum number of items to return. Default: 20. Minimum: 1. Maximum: 50.

=item type

Type: string | Required: required
The ID type: currently only <code class="highlighter-rouge">artist</code> is supported.

=back

and Response Objects being:

- paging object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body contains an <code class="highlighter-rouge">artists</code> object.
The <code class="highlighter-rouge">artists</code> object in turn contains a <a href="/documentation/web-api/reference/#object-cursorpagingobject">cursor-based paging object</a> of <a href="/documentation/web-api/reference/#object-artistobject">Artists</a>.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/get-following/?type=artist&amp;limit=20" target="_blank">Try in our Web Console</a>

=cut

async sub get_followed {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/following';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'after' => {
                type     => 'string',
                required => 'optional',
            },
            'limit' => {
                type     => 'integer',
                required => 'optional',
            },
            'type' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'paging object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 unfollow_artists_users

unfollow_artists_users - Unfollow Artists or Users

Remove the current user as a follower of one or more artists or other Spotify users.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid user access token or your client credentials. Requires the <code class="highlighter-rouge">user-follow-modify</code> scope.

=item Content-Type

Type: string | Required: optional
<em>Required if IDs are passed in the request body, otherwise ignored</em>. The content type of the request body: <code class="highlighter-rouge">application/json</code>.

=back

=head3 json_body_parameter

=over 4 

=item ids

Type: array[string] | Required: optional
A JSON array of the artist or user <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify IDs</a>. For example: <code class="highlighter-rouge">{ids:[&quot;74ASZWbe4lXaubB36ztrGX&quot;, &quot;08td7MxkoHQkXnWAYD8d6Q&quot;]}</code>. A maximum of 50 IDs can be sent in one request. <em>Note: if the <code class="highlighter-rouge">ids</code> parameter is present in the query string, any IDs listed here in the body will be ignored.</em>

=back

=head3 query_parameter

=over 4 

=item ids

Type: string | Required: required
A comma-separated list of the artist or the user <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify IDs</a>. For example: <code class="highlighter-rouge">ids=74ASZWbe4lXaubB36ztrGX,08td7MxkoHQkXnWAYD8d6Q</code>. A maximum of 50 IDs can be sent in one request.

=item type

Type: string | Required: required
The ID type: either <code class="highlighter-rouge">artist</code> or <code class="highlighter-rouge">user</code>.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">204</code> No Content and the response body is empty.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/delete-following/?type=user&amp;ids=exampleuser01" target="_blank">Try in our Web Console</a>

=cut

async sub unfollow_artists_users {
    my ($self, %args) = @_;

    my $request->{method} = 'DELETE';
    $request->{uri}    = 'https://api.spotify.com/v1/me/following';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
            'Content-Type' => {
                type     => 'string',
                required => 'optional',
            },
        },
        json_body_parameter => {
            'ids' => {
                type     => 'array[string]',
                required => 'optional',
            },
        },
        query_parameter => {
            'ids' => {
                type     => 'string',
                required => 'required',
            },
            'type' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 unfollow_playlist

unfollow_playlist - Unfollow Playlist

Remove the current user as a follower of a playlist.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details. The access token must have been issued on behalf of the user.<br />Unfollowing a publicly followed playlist for a user requires authorization of the <code class="highlighter-rouge">playlist-modify-public</code> scope; unfollowing a privately followed playlist requires the <code class="highlighter-rouge">playlist-modify-private</code> scope. See <a href="/documentation/general/guides/authorization-guide/#list-of-scopes">Using Scopes</a>.<br /><em>Note that the scopes you provide relate only to whether the current user is following the playlist publicly or privately (i.e. showing others what they are following), not whether the playlist itself is public or private.</em>

=back

=head3 path_parameter

=over 4 

=item playlist_id

Type: string | Required: required
The <a href="/documentation/web-api/#spotify-uris-and-ids">Spotify ID</a> of the playlist that is to be no longer followed.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body is empty.
On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.<a class="btn btn-sm btn-primary" href="/console/delete-playlist-followers/?playlist_id=2v3iNvBX8Ay1Gt2uXtUKUT&amp;user_id=jmperezperez" target="_blank">Try in our Web Console</a>

=cut

async sub unfollow_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'DELETE';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/followers';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'playlist_id' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

1;
