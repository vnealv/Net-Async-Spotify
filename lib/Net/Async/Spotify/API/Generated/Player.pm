package Net::Async::Spotify::API::Generated::Player;

use strict;
use warnings;

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=head1 NAME
 
Net::Async::Spotify::API::Generated::Player - Package representing Spotify Player API
 
=head1 DESCRIPTION
 
Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.
 
=head1 METHODS

=cut


=head2 add_to_queue

add_to_queue - Add an item to queue

Add an item to the end of the user’s current playback queue.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If
not supplied, the user’s currently active device is the target.

=item uri

Type: string | Required: required
The uri of the item to add to the queue. Must be a track or an episode uri.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/post-queue/" target="_blank">Try in our Web Console</a>

=cut

async sub add_to_queue {
    my ($self, %args) = @_;

    my $request->{method} = 'POST';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/queue';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
            'uri' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_a_users_available_devices

get_a_users_available_devices - Get a User&#39;s Available Devices

Get information about a user’s available devices.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service:
see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a>
for details.  The access token must have been issued on behalf of a user.
The access token must have the <code class="highlighter-rouge">user-read-playback-state</code> scope authorized
in order to read information.

=back

and Response Objects being:

- device object


A successful request will return a <code class="highlighter-rouge">200 OK</code> response code with a json payload that contains the device objects (see below).
When no available devices are found, the request will return a 200 OK response with an empty devices list.<a class="btn btn-sm btn-primary" href="/console/get-users-available-devices/" target="_blank">Try in our Web Console</a>

=cut

async sub get_a_users_available_devices {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/devices';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'device object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_information_about_the_users_current_playback

get_information_about_the_users_current_playback - Get Information About The User&#39;s Current Playback

Get information about the user’s current playback state, including track or episode, progress, and active device.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.

=back

=head3 query_parameter

=over 4 

=item additional_types

Type: string | Required: optional
A comma-separated list of item types that your client supports besides the default <code class="highlighter-rouge">track</code> type. Valid types are: <code class="highlighter-rouge">track</code> and <code class="highlighter-rouge">episode</code>. An unsupported type in the response is expected to be represented as <code class="highlighter-rouge">null</code> value in the <code class="highlighter-rouge">item</code> field.
<strong>Note</strong>: This parameter was introduced to allow existing clients to maintain their current behaviour and might be deprecated in the future. In addition to providing this parameter, make sure that your client properly handles cases of new

=item market

Type: string | Required: optional
An <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2 country code</a>
or the string <code class="highlighter-rouge">from_token</code>. Provide this parameter if you want to apply <a href="/documentation/general/guides/track-relinking-guide/">Track
Relinking</a>.

=back

and Response Objects being:



A successful request will return a <code class="highlighter-rouge">200 OK</code> response code with a json payload that contains information about the current playback. The information returned is for the last known state, which means an inactive device could be returned if it was the last one to execute playback.
When no available devices are found, the request will return a <code class="highlighter-rouge">200 OK</code> response but with no data populated.<a class="btn btn-sm btn-primary" href="/console/get-user-player/" target="_blank">Try in our Web Console</a>

=cut

async sub get_information_about_the_users_current_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'additional_types' => {
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

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_recently_played

get_recently_played - Get Current User&#39;s Recently Played Tracks

Get tracks from the current user’s recently played tracks.
<em>Note: Currently doesn’t support podcast episodes.</em>

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details. The access token must have been issued on behalf of a user.

=back

=head3 query_parameter

=over 4 

=item after

Type: integer | Required: optional
A Unix timestamp in milliseconds. Returns all items
after (but not including) this cursor position. If <code class="highlighter-rouge">after</code> is specified, <code class="highlighter-rouge">before</code>
must not be specified.

=item before

Type: integer | Required: optional
A Unix timestamp in milliseconds. Returns all items
before (but not including) this cursor position. If <code class="highlighter-rouge">before</code> is specified,
<code class="highlighter-rouge">after</code> must not be specified.

=item limit

Type: integer | Required: optional
The maximum number of items to return. Default: 20. Minimum: 1. Maximum: 50.

=back

and Response Objects being:

- history object


On success, the HTTP status code in the response header is <code class="highlighter-rouge">200</code> OK and the response body contains an array of <a href="#play-history-object">play history objects</a> (wrapped in a <a href="#cursor-based-paging-object">cursor-based paging object</a>) in JSON format. The play history items each contain the context the track was played from (e.g. playlist, album), the date and time the track was played, and a <a href="/documentation/web-api/reference/#object-simplifiedtrackobject">track object (simplified)</a>. On error, the header status code is an <a href="/documentation/web-api/#response-status-codes">error code</a> and the response body contains an <a href="/documentation/web-api/#response-schema">error object</a>.If private session is enabled the response will be a <code class="highlighter-rouge">204 NO CONTENT</code> with an empty payload.<a class="btn btn-sm btn-primary" href="/console/get-recently-played/" target="_blank">Try in our Web Console</a>

=cut

async sub get_recently_played {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/recently-played';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'after' => {
                type     => 'integer',
                required => 'optional',
            },
            'before' => {
                type     => 'integer',
                required => 'optional',
            },
            'limit' => {
                type     => 'integer',
                required => 'optional',
            },
        },
    };
    my $response_objs = [
        'history object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_the_users_currently_playing_track

get_the_users_currently_playing_track - Get the User&#39;s Currently Playing Track

Get the object currently being played on the user’s Spotify account.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service:
see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a>
for details. The access token must have been issued on behalf of a user. The
access token must have the <code class="highlighter-rouge">user-read-currently-playing</code> and/or <code class="highlighter-rouge">user-read-playback-state</code>
scope authorized in order to read information.

=back

=head3 query_parameter

=over 4 

=item additional_types

Type: string | Required: optional
A comma-separated list of item types that your client supports besides the default <code class="highlighter-rouge">track</code> type. Valid types are: <code class="highlighter-rouge">track</code> and <code class="highlighter-rouge">episode</code>. An unsupported type in the response is expected to be represented as <code class="highlighter-rouge">null</code> value in the <code class="highlighter-rouge">item</code> field.
<strong>Note</strong>: This parameter was introduced to allow existing clients to maintain their current behaviour and might be deprecated in the future. In addition to providing this parameter, make sure that your client properly handles cases of new types in the future by checking against the <code class="highlighter-rouge">currently_playing_type</code> field.

=item market

Type: string | Required: required
An <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2 country code</a>
or the string <code class="highlighter-rouge">from_token</code>. Provide this parameter if you want to apply <a href="/documentation/general/guides/track-relinking-guide/">Track
Relinking</a>.

=back

and Response Objects being:



A successful request will return a <code class="highlighter-rouge">200 OK</code> response code with a json payload that contains information about the currently playing track or episode and its context (see below). The information returned is for the last known state, which means an inactive device could be returned if it was the last one to execute playback.When no available devices are found, the request will return a <code class="highlighter-rouge">200 OK</code> response but with no data populated.When no track is currently playing, the request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response with no payload.If private session is enabled the response will be a <code class="highlighter-rouge">204 NO CONTENT</code> with an empty payload.<a class="btn btn-sm btn-primary" href="/console/get-users-currently-playing-track/" target="_blank">Try in our Web Console</a>

=cut

async sub get_the_users_currently_playing_track {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/currently-playing';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'additional_types' => {
                type     => 'string',
                required => 'optional',
            },
            'market' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 pause_a_users_playback

pause_a_users_playback - Pause a User&#39;s Playback

Pause playback on the user’s account.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If not supplied, the user’s currently active device is the target.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-pause/" target="_blank">Try in our Web Console</a>

=cut

async sub pause_a_users_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/pause';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 seek_to_position_in_currently_playing_track

seek_to_position_in_currently_playing_track - Seek To Position In Currently Playing Track

Seeks to the given position in the user’s currently playing track.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If
not supplied, the user’s currently active device is the target.

=item position_ms

Type: integer | Required: required
The position in milliseconds to seek to. Must be a
positive number. Passing in a position that is greater than the length of
the track will cause the player to start playing the next song.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-seek/" target="_blank">Try in our Web Console</a>

=cut

async sub seek_to_position_in_currently_playing_track {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/seek';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
            'position_ms' => {
                type     => 'integer',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 set_repeat_mode_on_users_playback

set_repeat_mode_on_users_playback - Set Repeat Mode On User’s Playback

Set the repeat mode for the user’s playback. Options are repeat-track,
repeat-context, and off.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If
not supplied, the user’s currently active device is the target.

=item state

Type: string | Required: required
<strong>track</strong>, <strong>context</strong> or <strong>off</strong>.<br />
<strong>track</strong> will repeat the current track.<br />
<strong>context</strong> will repeat the current context.<br />
<strong>off</strong> will turn repeat off.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-repeat/" target="_blank">Try in our Web Console</a>

=cut

async sub set_repeat_mode_on_users_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/repeat';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
            'state' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 set_volume_for_users_playback

set_volume_for_users_playback - Set Volume For User&#39;s Playback

Set the volume for the user’s current playback device.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If not supplied, the user’s currently active device is the target.

=item volume_percent

Type: integer | Required: required
The volume to set. Must be a value from 0 to 100 inclusive.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-volume/" target="_blank">Try in our Web Console</a>

=cut

async sub set_volume_for_users_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/volume';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
            'volume_percent' => {
                type     => 'integer',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 skip_users_playback_to_next_track

skip_users_playback_to_next_track - Skip User’s Playback To Next Track

Skips to next track in the user’s queue.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If not supplied, the user’s currently active device is the target.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/post-next/" target="_blank">Try in our Web Console</a>

=cut

async sub skip_users_playback_to_next_track {
    my ($self, %args) = @_;

    my $request->{method} = 'POST';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/next';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 skip_users_playback_to_previous_track

skip_users_playback_to_previous_track - Skip User’s Playback To Previous Track

Skips to previous track in the user’s queue.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If
not supplied, the user’s currently active device is the target.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/post-previous/" target="_blank">Try in our Web Console</a>

=cut

async sub skip_users_playback_to_previous_track {
    my ($self, %args) = @_;

    my $request->{method} = 'POST';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/previous';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 start_a_users_playback

start_a_users_playback - Start/Resume a User&#39;s Playback

Start a new context or resume current playback on the user’s active device.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 json_body_parameter

=over 4 

=item context_uri

Type: string | Required: optional
string

=item offset

Type: object | Required: optional
object

=item position_ms

Type: integer | Required: optional
integer

=item uris

Type: array[string] | Required: optional
Array of URIs

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If not supplied, the user’s currently active device is the target.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-play/" target="_blank">Try in our Web Console</a>

=cut

async sub start_a_users_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/play';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        json_body_parameter => {
            'context_uri' => {
                type     => 'string',
                required => 'optional',
            },
            'offset' => {
                type     => 'object',
                required => 'optional',
            },
            'position_ms' => {
                type     => 'integer',
                required => 'optional',
            },
            'uris' => {
                type     => 'array[string]',
                required => 'optional',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 toggle_shuffle_for_users_playback

toggle_shuffle_for_users_playback - Toggle Shuffle For User’s Playback

Toggle shuffle on or off for user’s playback.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 query_parameter

=over 4 

=item device_id

Type: string | Required: optional
The id of the device this command is targeting. If
not supplied, the user’s currently active device is the target.

=item state

Type: boolean | Required: required
<strong>true</strong> : Shuffle user’s playback.<br />
<strong>false</strong> : Do not shuffle user’s playback.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-shuffle/?state=true" target="_blank">Try in our Web Console</a>

=cut

async sub toggle_shuffle_for_users_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player/shuffle';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'device_id' => {
                type     => 'string',
                required => 'optional',
            },
            'state' => {
                type     => 'boolean',
                required => 'required',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 transfer_a_users_playback

transfer_a_users_playback - Transfer a User&#39;s Playback

Transfer playback to a new device and determine if it should start playing.

with Request details being:

=head3 header

=over 4 

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the <a href="/documentation/general/guides/authorization-guide/">Web API Authorization Guide</a> for details.<br />The access token must have been issued on behalf of a user.<br />The access token must have the <code class="highlighter-rouge">user-modify-playback-state</code> scope authorized in order to control playback.

=back

=head3 json_body_parameter

=over 4 

=item device_ids

Type: array[string] | Required: required
A JSON array containing the ID of the device on which playback should be started/transferred.<br />For example:<code class="highlighter-rouge">{device_ids:[&quot;74ASZWbe4lXaubB36ztrGX&quot;]}</code><br />Note: Although an array is accepted, only a single device_id is currently supported. Supplying more than one will return <code class="highlighter-rouge">400 Bad Request</code>

=item play

Type: boolean | Required: optional
<strong>true</strong>: ensure playback happens on new device.<br /><strong>false</strong> or not provided: keep the current playback state.

=back

and Response Objects being:



A completed request will return a <code class="highlighter-rouge">204 NO CONTENT</code> response code, and then issue the command to the player. Due to the asynchronous nature of the issuance of the command, you should use the <a href="/documentation/web-api/reference/#endpoint-get-information-about-the-users-current-playback">Get Information About The User’s Current Playback </a> endpoint to check that your issued command was handled correctly by the player.If the device is not found, the request will return <code class="highlighter-rouge">404 NOT FOUND</code> response code.If the user making the request is non-premium, a <code class="highlighter-rouge">403 FORBIDDEN</code> response code will be returned.<a class="btn btn-sm btn-primary" href="/console/put-user-player" target="_blank">Try in our Web Console</a>

=cut

async sub transfer_a_users_playback {
    my ($self, %args) = @_;

    my $request->{method} = 'PUT';
    $request->{uri}    = 'https://api.spotify.com/v1/me/player';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        json_body_parameter => {
            'device_ids' => {
                type     => 'array[string]',
                required => 'required',
            },
            'play' => {
                type     => 'boolean',
                required => 'optional',
            },
        },
    };
    my $response_objs = [

    ];

    await $self->call_api($request, $response_objs, %args);
}

1;
