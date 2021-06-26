package Net::Async::Spotify::API::Generated::Playlists;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=encoding utf8

=head1 NAME

Net::Async::Spotify::API::Generated::Playlists - Package representing Spotify Playlists API

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.

=head1 METHODS

=cut

=head2 add_tracks_to_playlist

add_tracks_to_playlist - Add Items to a Playlist

Add one or more items to a user’s playlist.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. The access token must have been issued on behalf of the user.Adding items to the current user’s public playlists requires authorization of the playlist-modify-public scope; adding items to the current user’s private playlist (including collaborative playlists) requires the playlist-modify-private scope. See Using Scopes.

=item Content-Type

Type: string | Required: required
Required if URIs are passed in the request body, otherwise ignored. The content type of the request body: application/json

=back

=head3 json_body_parameter

=over 4

=item position

Type: integer | Required: optional
The position to insert the items, a zero-based index. For example, to insert the items in the first position: position=0 ; to insert the items in the third position: position=2. If omitted, the items will be appended to the playlist. Items are added in the order they appear in the uris array. For example: {"uris": ["spotify:track:4iV5W9uYEdYUVa79Axb7Rh","spotify:track:1301WleyT98MSxVHPZCA6M"], "position": 3}

=item uris

Type: array[string] | Required: optional
A JSON array of the Spotify URIs to add. For example: {"uris": ["spotify:track:4iV5W9uYEdYUVa79Axb7Rh","spotify:track:1301WleyT98MSxVHPZCA6M", "spotify:episode:512ojhOuo1ktJprKbVcKyQ"]}A maximum of 100 items can be added in one request. Note: if the uris parameter is present in the query string, any URIs listed here in the body will be ignored.

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

=head3 query_parameter

=over 4

=item position

Type: integer | Required: optional
The position to insert the items, a zero-based index. For example, to insert the items in the first position: position=0; to insert the items in the third position: position=2 . If omitted, the items will be appended to the playlist. Items are added in the order they are listed in the query string or request body.

=item uris

Type: string | Required: optional
A comma-separated list of Spotify URIs to add, can be track or episode URIs. For example:uris=spotify:track:4iV5W9uYEdYUVa79Axb7Rh, spotify:track:1301WleyT98MSxVHPZCA6M, spotify:episode:512ojhOuo1ktJprKbVcKyQA maximum of 100 items can be added in one request. Note: it is likely that passing a large number of item URIs as a query parameter will exceed the maximum length of the request URI. When adding a large number of items, it is recommended to pass them in the request body, see below.

=back

and Response Objects being:

- error object


On success, the HTTP status code in the response header is 201 Created. The response body contains a snapshot_id in JSON format. The snapshot_id can be used to identify your playlist version in future requests. On error, the header status code is an error code and the response body contains an error object. Trying to add an item when you do not have the user’s authorization, or when there are more than 10.000 items in the playlist, returns error 403 Forbidden.Try in our Web Console

=cut

async sub add_tracks_to_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'POST';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/tracks';
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
            'position' => {
                type     => 'integer',
                required => 'optional',
            },
            'uris' => {
                type     => 'array[string]',
                required => 'optional',
            },
        },
        path_parameter => {
            'playlist_id' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'position' => {
                type     => 'integer',
                required => 'optional',
            },
            'uris' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 change_playlist_details

change_playlist_details - Change a Playlist's Details

Change a playlist’s name and public/private state. (The user must, of
course, own the playlist.)

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. The access token must have been issued on behalf of the user.Changing a public playlist for a user requires authorization of the playlist-modify-public scope; changing a private playlist requires the playlist-modify-private scope. See Using Scopes.

=item Content-Type

Type: string | Required: required
The content type of the request body: application/json

=back

=head3 json_body_parameter

=over 4

=item collaborative

Type: boolean | Required: optional
If true , the playlist will become collaborative and other users will be able to modify the playlist in their Spotify client. Note: You can only set collaborative to true on non-public playlists.

=item description

Type: string | Required: optional
Value for playlist description as displayed in Spotify Clients and in the Web API.

=item name

Type: string | Required: optional
The new name for the playlist, for example "My New Playlist Title"

=item public

Type: boolean | Required: optional
If true the playlist will be public, if false it will be private.

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

and Response Objects being:

- error object


On success the HTTP status code in the response header is 200 OK.On error, the header status code is an error code and the response body contains an error object. Trying to change a playlist when you do not have the user’s authorization returns error 403 Forbidden.Try in our Web Console

=cut

async sub change_playlist_details {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}';
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
            'collaborative' => {
                type     => 'boolean',
                required => 'optional',
            },
            'description' => {
                type     => 'string',
                required => 'optional',
            },
            'name' => {
                type     => 'string',
                required => 'optional',
            },
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

=head2 create_playlist

create_playlist - Create a Playlist

Create a playlist for a Spotify user. (The playlist will be empty until
you add tracks.)

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. The access token must have been issued on behalf of the user. Creating a public playlist for a user requires authorization of the playlist-modify-public scope; creating a private playlist requires the playlist-modify-private scope. See Using Scopes.

=item Content-Type

Type: string | Required: optional
The content type of the request body: application/json

=back

=head3 json_body_parameter

=over 4

=item collaborative

Type: boolean | Required: optional
Defaults to false . If true the playlist will be collaborative. Note that to create a collaborative playlist you must also set public to false . To create collaborative playlists you must have granted playlist-modify-private and playlist-modify-public scopes .

=item description

Type: string | Required: optional
value for playlist description as displayed in Spotify Clients and in the Web API.

=item name

Type: string | Required: required
The name for the new playlist, for example "Your Coolest Playlist" . This name does not need to be unique; a user may have several playlists with the same name.

=item public

Type: boolean | Required: optional
Defaults to true . If true the playlist will be public, if false it will be private. To be able to create private playlists, the user must have granted the playlist-modify-private scope

=back

=head3 path_parameter

=over 4

=item user_id

Type: string | Required: required
The user’s Spotify user ID.

=back

and Response Objects being:

- playlist object
- error object


On success, the response body contains the created playlist object
in JSON format and the HTTP status code in the response header is 200 OK or
201 Created. There is also a Location response header giving the Web API
endpoint for the new playlist.On error, the header status code is an error code and the response body contains an error object. Trying to create a playlist when you do not have the user’s authorization returns error 403 Forbidden.Try in our Web Console

=cut

async sub create_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'POST';
    $request->{uri}    = 'https://api.spotify.com/v1/users/{user_id}/playlists';
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
            'collaborative' => {
                type     => 'boolean',
                required => 'optional',
            },
            'description' => {
                type     => 'string',
                required => 'optional',
            },
            'name' => {
                type     => 'string',
                required => 'required',
            },
            'public' => {
                type     => 'boolean',
                required => 'optional',
            },
        },
        path_parameter => {
            'user_id' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'playlist object',
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_a_list_of_current_users_playlists

get_a_list_of_current_users_playlists - Get a List of Current User's Playlists

Get a list of the playlists owned or followed by the current Spotify
user.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details.Private playlists are only retrievable for the current user and requires the playlist-read-private scope to have been authorized by the user. Note that this scope alone will not return collaborative playlists, even though they are always private.Collaborative playlists are only retrievable for the current user and requires the playlist-read-collaborative scope to have been authorized by the user.

=back

=head3 query_parameter

=over 4

=item limit

Type: integer | Required: optional
‘The maximum number of playlists to return. Default:
20. Minimum: 1. Maximum: 50.’

=item offset

Type: integer | Required: optional
‘The index of the first playlist to return. Default:
0 (the first object). Maximum offset: 100.000. Use with limit to get the
next set of playlists.’

=back

and Response Objects being:

- playlist object


On success, the HTTP status code in the response header is 200 OK and the response body contains an array of simplified playlist objects (wrapped in a paging object) in JSON format. On error, the header status code is an error code and the response body contains an error object. Please note that the access token has to be tied to a user.Try in our Web Console

=cut

async sub get_a_list_of_current_users_playlists {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/playlists';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'limit' => {
                type     => 'integer',
                required => 'optional',
            },
            'offset' => {
                type     => 'integer',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'playlist object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_list_users_playlists

get_list_users_playlists - Get a List of a User's Playlists

Get a list of the playlists owned or followed by a Spotify user.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details.Private playlists are only retrievable for the current user and requires the playlist-read-private scope to have been authorized by the user. Note that this scope alone will not return collaborative playlists, even though they are always private.Collaborative playlists are only retrievable for the current user and requires the playlist-read-collaborative scope to have been authorized by the user.

=back

=head3 path_parameter

=over 4

=item user_id

Type: string | Required: required
The user’s Spotify user ID.

=back

=head3 query_parameter

=over 4

=item limit

Type: integer | Required: optional
The maximum number of playlists to return. Default:
20. Minimum: 1. Maximum: 50.

=item offset

Type: integer | Required: optional
The index of the first playlist to return. Default:
0 (the first object). Maximum offset: 100.000. Use with limit to get the
next set of playlists.

=back

and Response Objects being:

- playlist object


On success, the HTTP status code in the response header is 200 OK and the response body contains an array of simplified playlist objects (wrapped in a paging object) in JSON format. On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_list_users_playlists {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/users/{user_id}/playlists';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        path_parameter => {
            'user_id' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'limit' => {
                type     => 'integer',
                required => 'optional',
            },
            'offset' => {
                type     => 'integer',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'playlist object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_playlist

get_playlist - Get a Playlist

Get a playlist owned by a Spotify user.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service:
see the Web API Authorization Guide
for details. Both Public and Private playlists belonging to any user are retrievable
on provision of a valid access token.

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

=head3 query_parameter

=over 4

=item additional_types

Type: string | Required: optional
A comma-separated list of item types that your client supports besides the default track type. Valid types are: track and episode.
Note: This parameter was introduced to allow existing clients to maintain their current behaviour and might be deprecated in the future.
In addition to providing this parameter, make sure that your client properly handles cases of new types in the future by checking against the type field of each object.

=item fields

Type: string | Required: optional
Filters for the query: a comma-separated list of the
fields to return. If omitted, all fields are returned. For example, to get
just the playlist’’s description and URI: fields=description,uri. A dot
separator can be used to specify non-reoccurring fields, while parentheses
can be used to specify reoccurring fields within objects. For example, to
get just the added date and user ID of the adder: fields=tracks.items(added_at,added_by.id).
Use multiple parentheses to drill down into nested objects, for example: fields=tracks.items(track(name,href,album(name,href))).
Fields can be excluded by prefixing them with an exclamation mark, for example:
fields=tracks.items(track(name,href,album(!name,href)))

=item market

Type: string | Required: optional
An ISO 3166-1 alpha-2 country code
or the string from_token. Provide this parameter if you want to apply Track
Relinking.
For episodes, if a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.
Note: If neither market or user country are provided, the episode is considered unavailable for the client.

=back

and Response Objects being:

- playlist object


On success, the response body contains a playlist object in JSON format and the HTTP status code in the response header is 200 OK. If an episode is unavailable in the given market, its information will not be included in the response. On error, the header status code is an error code and the response body contains an error object. Requesting playlists that you do not have the user’s authorization to access returns error 403 Forbidden.Try in our Web Console

=cut

async sub get_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}';
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
            'additional_types' => {
                type     => 'string',
                required => 'optional',
            },
            'fields' => {
                type     => 'string',
                required => 'optional',
            },
            'market' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'playlist object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_playlist_cover

get_playlist_cover - Get a Playlist Cover Image

Get the current image associated with a specific playlist.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. The access token must have been issued on behalf of the user.This access token must be issued on behalf of the user.  Current playlist image for both Public and Private playlists of any user are retrievable on provision of a valid access token.

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

and Response Objects being:

- image object


On success, the response body contains a list of image objects in JSON format and the HTTP status code in the response header is 200 OK On error, the header status code is an error code and the response body contains an error object.Try in our Web Console

=cut

async sub get_playlist_cover {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/images';
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
        'image object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_playlists_tracks

get_playlists_tracks - Get a Playlist's Items

Get full details of the items of a playlist owned by a Spotify user.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. Both Public and Private playlists belonging to any user are retrievable on provision of a valid access token.

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

=head3 query_parameter

=over 4

=item additional_types

Type: string | Required: optional
A comma-separated list of item types that your client supports besides the default track type. Valid types are: track and episode.
Note: This parameter was introduced to allow existing clients to maintain their current behaviour and might be deprecated in the future.
In addition to providing this parameter, make sure that your client properly handles cases of new types in the future by checking against the type field of each object.

=item fields

Type: string | Required: optional
Filters for the query: a comma-separated list of the
fields to return. If omitted, all fields are returned. For example, to get
just the total number of items and the request limit:fields=total,limitA
dot separator can be used to specify non-reoccurring fields, while parentheses
can be used to specify reoccurring fields within objects. For example, to
get just the added date and user ID of the adder:fields=items(added_at,added_by.id)Use
multiple parentheses to drill down into nested objects, for example:fields=items(track(name,href,album(name,href)))Fields
can be excluded by prefixing them with an exclamation mark, for example:fields=items.track.album(!external_urls,images)

=item limit

Type: integer | Required: optional
The maximum number of items to return. Default: 100.
Minimum: 1. Maximum: 100.

=item market

Type: string | Required: required
An ISO 3166-1 alpha-2 country code
or the string from_token. Provide this parameter if you want to apply Track
Relinking.
For episodes, if a valid user access token is specified in the request header, the country associated with
the user account will take priority over this parameter.
Note: If neither market or user country are provided, the episode is considered unavailable for the client.

=item offset

Type: integer | Required: optional
The index of the first item to return. Default: 0
(the first object).

=back

and Response Objects being:

- track object


On success, the response body contains an array of track objects and episode objects (depends on the additional_types parameter), wrapped in a paging object in JSON format and the HTTP status code in the response header is 200 OK. If an episode is unavailable in the given market, its information will not be included in the response. On error, the header status code is an error code and the response body contains an error object. Requesting playlists that you do not have the user’s authorization to access returns error 403 Forbidden.Try in our Web Console

=cut

async sub get_playlists_tracks {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/tracks';
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
            'additional_types' => {
                type     => 'string',
                required => 'optional',
            },
            'fields' => {
                type     => 'string',
                required => 'optional',
            },
            'limit' => {
                type     => 'integer',
                required => 'optional',
            },
            'market' => {
                type     => 'string',
                required => 'required',
            },
            'offset' => {
                type     => 'integer',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'track object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 remove_tracks_playlist

remove_tracks_playlist - Remove Items from a Playlist

Remove one or more items from a user’s playlist.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide
for details. The access token must have been issued on behalf of the user. Removing items from a user’s public playlist requires authorization of the playlist-modify-public scope; removing items from a private playlist requires the playlist-modify-private scope. See Using Scopes.

=item Content-Type

Type: string | Required: required
The content type of the request body: application/json

=back

=head3 json_body_parameter

=over 4

=item snapshot_id

Type: string | Required: optional
The playlist’s snapshot ID against which you want to make the changes.
The API will validate that the specified items exist and in the specified positions and make the changes,
even if more recent changes have been made to the playlist.

=item tracks

Type: array[string] | Required: required
An array of objects containing Spotify URIs of the tracks or episodes to remove.
For example: { "tracks": [{ "uri": "spotify:track:4iV5W9uYEdYUVa79Axb7Rh" },{ "uri": "spotify:track:1301WleyT98MSxVHPZCA6M" }] }. A maximum of 100 objects can be sent at once.

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID

=back

and Response Objects being:

- error object


On success, the response body contains a snapshot_id in JSON format
and the HTTP status code in the response header is 200 OK. The snapshot_id
can be used to identify your playlist version in future requests.On error, the header status code is an error code and the response body contains an error object.
Trying to remove an item when you do not have the user’s authorization returns error 403 Forbidden.
Attempting to use several different ways to remove items returns 400 Bad Request.
Other client errors returning 400 Bad Request include specifying invalid positions.Notes### Frequently Asked Questions:
   Is it possible to delete a playlist?
No, it isn’t. The reason there is no endpoint for this is explained in our Working With Playlists Guide in the section Following and Unfollowing a Playlist.


   Can I use X-HTTP-Method-Override or similar to send a DELETE request overriding the HTTP verb?
Not at the moment, the delete operation needs to be specified through a DELETE request.Try in our Web Console

=cut

async sub remove_tracks_playlist {
    my ($self, %args) = @_;

    my $request->{method} = 'DELETE';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/tracks';
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
            'snapshot_id' => {
                type     => 'string',
                required => 'optional',
            },
            'tracks' => {
                type     => 'array[string]',
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

=head2 reorder_or_replace_playlists_tracks

reorder_or_replace_playlists_tracks - Reorder or Replace a Playlist's Items

Either reorder or replace items in a playlist depending on the request’s parameters.
To reorder items, include range_start, insert_before, range_length and snapshot_id in the request’s body.
To replace items, include uris as either a query parameter or in the request’s body.
Replacing items in a playlist will overwrite its existing items. This operation can be used for replacing or clearing items in a playlist.

Note: Replace and reorder are mutually exclusive operations which share the same endpoint, but have different parameters.
These operations can’t be applied together in a single request.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service:
see the Web API Authorization Guide for details.
The access token must have been issued on behalf of the user.
Reordering or replacing items in the current user’s public playlists requires authorization of the playlist-modify-public scope;
reordering or replacing items in the current user’s private playlist (including collaborative playlists) requires the playlist-modify-private scope.
See Using Scopes.

=item Content-Type

Type: string | Required: optional
Required if URIs are passed in the request body, otherwise ignored. The content type of the request body: application/json

=back

=head3 json_body_parameter

=over 4

=item insert_before

Type: integer | Required: optional
The position where the items should be inserted.To reorder the items to the end of the playlist, simply set insert_before to the position after the last item.Examples:To reorder the first item to the last position in a playlist with 10 items, set range_start to 0, and insert_before to 10.To reorder the last item in a playlist with 10 items to the start of the playlist, set range_start to 9, and insert_before to 0.

=item range_length

Type: integer | Required: optional
The amount of items to be reordered. Defaults to 1 if not set.The range of items to be reordered begins from the range_start position, and includes the range_length subsequent items.Example:To move the items at index 9-10 to the start of the playlist, range_start is set to 9, and range_length is set to 2.

=item range_start

Type: integer | Required: optional
The position of the first item to be reordered.

=item snapshot_id

Type: string | Required: optional
The playlist’s snapshot ID against which you want to make the changes.

=item uris

Type: array[string] | Required: optional


=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

=head3 query_parameter

=over 4

=item uris

Type: string | Required: optional
A comma-separated list of Spotify URIs to set, can be track or episode URIs. For example: uris=spotify:track:4iV5W9uYEdYUVa79Axb7Rh,spotify:track:1301WleyT98MSxVHPZCA6M,spotify:episode:512ojhOuo1ktJprKbVcKyQA maximum of 100 items can be set in one request.

=back

and Response Objects being:

- error object


On a successful reorder operation, the response body contains a snapshot_id in JSON format
and the HTTP status code in the response header is 200 OK. The snapshot_id
can be used to identify your playlist version in future requests.On a successful replace operation, the HTTP status code in the response header is 201
Created.On error, the header status code is an error code,
the response body contains an error object,
and the existing playlist is unmodified.
Trying to set an item when you do not have the user’s authorization returns error 403 Forbidden.Try in our Web Console

=cut

async sub reorder_or_replace_playlists_tracks {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/tracks';
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
            'insert_before' => {
                type     => 'integer',
                required => 'optional',
            },
            'range_length' => {
                type     => 'integer',
                required => 'optional',
            },
            'range_start' => {
                type     => 'integer',
                required => 'optional',
            },
            'snapshot_id' => {
                type     => 'string',
                required => 'optional',
            },
            'uris' => {
                type     => 'array[string]',
                required => 'optional',
            },
        },
        path_parameter => {
            'playlist_id' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'uris' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'error object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 upload_custom_playlist_cover

upload_custom_playlist_cover - Upload a Custom Playlist Cover Image

Replace the image used to represent a specific playlist.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. The access token must have been issued on behalf of the user.This access token must be tied to the user who owns the playlist, and must have the scope ugc-image-upload granted. In addition, the token must also contain playlist-modify-public and/or playlist-modify-private, depending the public status of the playlist you want to update . See Using Scopes.

=item Content-Type

Type: string | Required: required
The content type of the request body: image/jpeg

=back

=head3 path_parameter

=over 4

=item playlist_id

Type: string | Required: required
The Spotify ID
for the playlist.

=back

and Response Objects being:



If you get status code 429, it means that you have sent too many requests.
If this happens, have a look in the Retry-After header, where you will see a number displayed.
This is the amount of seconds that you need to wait, before you can retry sending your requests.NotesThe request should contain a Base64 encoded JPEG image data, maximum payload size is 256 KB.Rate Limiting: If you get status code 429, it means that you have sent too many requests.
If this happens, have a look in the Retry-After header, where you will see a number displayed. This is the amount of seconds that you need to wait, before you can retry sending your requests.Try in our Web Console

=cut

async sub upload_custom_playlist_cover {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/playlists/{playlist_id}/images';
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
        path_parameter => {
            'playlist_id' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

1;
