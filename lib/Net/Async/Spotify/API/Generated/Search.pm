package Net::Async::Spotify::API::Generated::Search;

use strict;
use warnings;

# VERSION

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


<strong>On success</strong>:
  <li>In the response <em><strong>header</strong></em> the HTTP status code is <code class="highlighter-rouge">200</code> OK.</li>
  <li>For each type provided in the <code class="highlighter-rouge">type</code> parameter, the response <em><strong>body</strong></em> contains an array of 
<a href="/documentation/web-api/reference/#object-artistobject">artist objects</a> / 
<a href="/documentation/web-api/reference/#object-simplifiedalbumobject">simplified album objects</a> / 
<a href="/documentation/web-api/reference/#object-trackobject">track objects</a> / 
<a href="/documentation/web-api/reference/#object-simplifiedshowobject">simplified show objects</a> / 
<a href="/documentation/web-api/reference/#object-simplifiedepisodeobject">simplified episode objects</a> 
wrapped in a <a href="/documentation/web-api/reference/#object-pagingobject">paging object</a> in JSON.</li>
<strong>On error</strong>:
  <li>The <em><strong>header</strong></em> status code is an <a href="/documentation/web-api/#response-status-codes">error code</a>.</li>
  <li>The response <em><strong>body</strong></em> contains an <a href="/documentation/web-api/#response-schema">error object</a>.</li>
Notes<strong>Writing a Query - Guidelines</strong><strong>Encode spaces</strong> with the hex code <code class="highlighter-rouge">%20</code> or <code class="highlighter-rouge">+</code>.<strong>Keyword matching</strong>: Matching of search keywords is <em>not</em> case-sensitive. Operators, however, should be specified in uppercase.
Unless surrounded by double quotation marks, keywords are matched in any order. For example:
<code class="highlighter-rouge">q=roadhouse&amp;20blues</code> matches both “Blues Roadhouse” and “Roadhouse of the Blues”.
<code class="highlighter-rouge">q=&quot;roadhouse&amp;20blues&quot;</code> matches “My Roadhouse Blues” but not “Roadhouse of the Blues”.Searching for <strong>playlists</strong> returns results where the query keyword(s) match any part of the playlist’s name or description. Only popular public playlists are returned.<strong>Operator</strong>: The operator NOT can be used to exclude results.For example: <code class="highlighter-rouge">q=roadhouse%20NOT%20blues</code> returns items that match “roadhouse” but excludes those that also contain the keyword “blues”.<em>Note</em>: The operator must be specified in uppercase. Otherwise, they are handled as normal keywords to be matched.<strong>Field filters</strong>: By default, results are returned when a match is found in <em>any</em> field of the target object type. Searches can be made more specific by specifying an <code class="highlighter-rouge">album</code>, <code class="highlighter-rouge">artist</code> or <code class="highlighter-rouge">track</code> field filter.For example: The query <code class="highlighter-rouge">q=album:gold%20artist:abba&amp;type=album</code> returns only albums with the text “gold” in the album name and the text “abba” in the artist name.To limit the results to a particular <code class="highlighter-rouge">year</code>, use the field filter year with album, artist, and track searches.For example: <code class="highlighter-rouge">q=bob%20year:2014</code>Or with a date range. For example: <code class="highlighter-rouge">q=bob%20year:1980-2020</code>To retrieve only albums released in the last two weeks, use the field filter tag:new in album searches.To retrieve only albums with the lowest 10% popularity, use the field filter tag:hipster in album searches.
<em>Note</em>: This field filter only works with album searches.Depending on object types being searched for, other field filters, include genre (applicable to tracks and artists), <code class="highlighter-rouge">upc</code>, and <code class="highlighter-rouge">isrc</code>.
For example: <code class="highlighter-rouge">q=lil%20genre:%22southern%20hip%20hop%22&amp;type=artist</code>.
Use double quotation marks around the genre keyword string if it contains spaces.<strong>Notes</strong>
  <li>Currently, you cannot fetch sorted results.</li>
  <li>You cannot search for playlists that contain a certain track.</li>
  <li>You can search only one genre at a time.</li>
  <li>You cannot search for playlists within a user’s library.</li>
  <li>In an effort to keep the response small, but include as much information as possible, Spotify has expanded the response and intends to continue and improve the Search endpoint.</li>
  <li>
    <p>To query based on a release date query at a year level using the year scope. For example:</p>

    <p>The query</p>

    <p><code class="highlighter-rouge">https://api.spotify.com/v1/search?q=bob%20year:2014&amp;type=album</code></p>

    <p>Returns albums released in 2014 with their names or artist names containing “bob”. You can also use the tag:new field filter to get just these albums, as well as compilations and singles, released in the last 2 weeks.</p>
  </li>
<a class="btn btn-sm btn-primary" href="/console/get-search-item/?q=tania+bowra&amp;type=artist" target="_blank">Try in our Web Console</a>

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
