package Net::Async::Spotify::API::Generated::Search;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=encoding utf8

=head1 NAME

Net::Async::Spotify::API::Generated::Search - Package representing Spotify Search API

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.

=head1 METHODS

=cut

=head2 search

search - Search for an Item

Get Spotify Catalog information about albums, artists, playlists, tracks, shows or episodes
that match a keyword string.

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details.

=back

=head3 query_parameter

=over 4

=item include_external

Type: string | Required: optional
Possible values: audio If include_external=audio
is specified the response will include any relevant audio content that is
hosted externally. By default external content is filtered out from responses.

=item limit

Type: integer | Required: optional
Maximum number of results to return. Default:
20 Minimum: 1 Maximum: 50 Note: The limit is applied within
each type, not on the total response. For example, if the limit value
is 3 and the type is artist,album, the response contains 3 artists and 3
albums.

=item market

Type: string | Required: optional
An ISO 3166-1 alpha-2 country code
or the string from_token. If a country code is specified, only content that is playable in that market is returned.
Note: - Playlist results are not affected by the market parameter.
- If market is set to from_token, and a valid access token is specified
in the request header, only content playable in the country associated with
the user account, is returned. - Users can view the country that is associated
with their account in the account settings.
A user must grant access to the user-read-private scope prior to when the
access token is issued.

=item offset

Type: integer | Required: optional
The index of the first result to return. Default:
0 (the first result). Maximum offset (including limit): 1,000. Use
with limit to get the next page of search results.

=item q

Type: string | Required: required
Search query
keywords and optional field filters and operators. For example: q=roadhouse%20blues.

=item type

Type: string | Required: required
A comma-separated list of item types to search
across. Valid types are: album , artist, playlist, track, show and episode.
Search results include hits from all the specified item types. For
example: q=name:abacab&type=album,track returns both albums and tracks
with “abacab” included in their name.

=back

and Response Objects being:

- artist object
- error object
- target object
- on object


On success: In the response header the HTTP status code is 200 OK.
 For each type provided in the type parameter, the response body contains an array of
artist objects /
simplified album objects /
track objects /
simplified show objects /
simplified episode objects
wrapped in a paging object in JSON.On error: The header status code is an error code.
 The response body contains an error object.NotesWriting a Query - GuidelinesEncode spaces with the hex code %20 or +.Keyword matching: Matching of search keywords is not case-sensitive. Operators, however, should be specified in uppercase.
Unless surrounded by double quotation marks, keywords are matched in any order. For example:
q=roadhouse&20blues matches both “Blues Roadhouse” and “Roadhouse of the Blues”.
q="roadhouse&20blues" matches “My Roadhouse Blues” but not “Roadhouse of the Blues”.Searching for playlists returns results where the query keyword(s) match any part of the playlist’s name or description. Only popular public playlists are returned.Operator: The operator NOT can be used to exclude results.For example: q=roadhouse%20NOT%20blues returns items that match “roadhouse” but excludes those that also contain the keyword “blues”.Note: The operator must be specified in uppercase. Otherwise, they are handled as normal keywords to be matched.Field filters: By default, results are returned when a match is found in any field of the target object type. Searches can be made more specific by specifying an album, artist or track field filter.For example: The query q=album:gold%20artist:abba&type=album returns only albums with the text “gold” in the album name and the text “abba” in the artist name.To limit the results to a particular year, use the field filter year with album, artist, and track searches.For example: q=bob%20year:2014Or with a date range. For example: q=bob%20year:1980-2020To retrieve only albums released in the last two weeks, use the field filter tag:new in album searches.To retrieve only albums with the lowest 10% popularity, use the field filter tag:hipster in album searches.
Note: This field filter only works with album searches.Depending on object types being searched for, other field filters, include genre (applicable to tracks and artists), upc, and isrc.
For example: q=lil%20genre:%22southern%20hip%20hop%22&type=artist.
Use double quotation marks around the genre keyword string if it contains spaces.Notes Currently, you cannot fetch sorted results.
 You cannot search for playlists that contain a certain track.
 You can search only one genre at a time.
 You cannot search for playlists within a user’s library.
 In an effort to keep the response small, but include as much information as possible, Spotify has expanded the response and intends to continue and improve the Search endpoint.

   To query based on a release date query at a year level using the year scope. For example:   The query   https://api.spotify.com/v1/search?q=bob%20year:2014&type=album   Returns albums released in 2014 with their names or artist names containing “bob”. You can also use the tag:new field filter to get just these albums, as well as compilations and singles, released in the last 2 weeks.Try in our Web Console

=cut

async sub search {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/search';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
        query_parameter => {
            'include_external' => {
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
            'q' => {
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
        'artist object',
        'error object',
        'target object',
        'on object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

1;
