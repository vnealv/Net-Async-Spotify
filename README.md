# NAME

    C<Net::Async::Spotify> - Interaction with spotify.com API

# SYNOPSIS

    use IO::Async::Loop;
    use Future::AsyncAwait;
    use Net::Async::Spotify;

    my $loop = IO::Async::Loop->new;
    my $spotify = Net::Async::Spotify->new(
        client_id     => '5fe01282e44241328a84e7c5cc169165',
        client_secret => '6f12e202e44241328a84e7c5dd169125',
    );
    $loop->add($spotify);

    # Generate the needed Authorize hash.
    # Requesting permission for all available scopes, and without prompting user if already approved.
    my %authorize = $spotify->authorize(scope => ['scopes'], show_dialog => 'false');
    my $auth_uri   = $authorize{uri};
    my $auth_state = $authorize{state};

    # Obtain Authorization code from callback request.
    my $auth_code = '...'; # from `code` path parameter.

    # Get the needed Access Token
    await $spotify->obtain_token(
        code         => $auth_code,
        auto_refresh => 1,
    );

    # You can now request any API call
    await $spotify->api->player->start_a_users_playback();

    # Token will be auto refreshed before it's expiry.
    $loop->run;

# DESCRIPTION

`Net::Async::Spotify` Provides an interface for interacting with ["Spotify API"](https://developer.spotify.com/documentation/web-api)
It does so while being an [IO::Async::Notifier](https://metacpan.org/pod/IO%3A%3AAsync%3A%3ANotifier) instance, with a [Net::Async::HTTP](https://metacpan.org/pod/Net%3A%3AAsync%3A%3AHTTP) child to reach Spotify API, running on an [IO::Async::Loop](https://metacpan.org/pod/IO%3A%3AAsync%3A%3ALoop).
Where all listed Spotify API calls and their response objects are auto-generated and defined here from documentation page. For easier maintainability.

# CONSTRUCTOR

## new

    $spotify = Net::Async::Spotify->new( %args )

Constructs a new `Net::Async::Spotify` Object, in which is actually an [IO::Async::Notifier](https://metacpan.org/pod/IO%3A%3AAsync%3A%3ANotifier) instance.
Takes a number of named arguments at construction time, which can be grouped like so:

### App Params

More details about them can be found in ["Spotify App Settings page"](https://developer.spotify.com/documentation/general/guides/app-settings/)

- client\_id => STRING

    Spotify App Client ID. ["client\_id"](#client_id)

- client\_secret => STRING

    Spotify App Client Secret. ["client\_secret"](#client_secret)

- redirect\_uri => STRING

    Spotify App callback URI. ["redirect\_uri"](#redirect_uri)

- base\_uri => STRING

    Spotify base\_uri default is set to [https://accounts.spotify.com/](https://accounts.spotify.com/). ["base\_uri"](#base_uri)

### Token Params

Used for ["token"](#token).
It's parameter can be passed here too, however not needed as they can be obtained.
When not passed then they should be obtained by calling ["obtain\_token"](#obtain_token)

- access\_token => STRING

    Spotify User's ["Access Token"](https://datatracker.ietf.org/doc/html/rfc6749#section-1.4)

- refresh\_token => STRING

    Spotify User's ["Refresh Token"](https://datatracker.ietf.org/doc/html/rfc6749#section-1.5)

- token\_type => STRING

    Spotify ["Access Token type"](https://datatracker.ietf.org/doc/html/rfc6749#section-7.1)

### API param

used for ["API"](#api). It is used to create only selected Spotify APIs instead of all.
When not passed it will load all available ["Spotify APIs"](https://developer.spotify.com/documentation/web-api/reference/#reference-index)

- apis => ArrayRef

    a List of limited APIs to be loaded. Passed to [Net::Async::Spotify::API](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AAPI) when being created.

# METHODS

## token

[Net::Async::Spotify::Token](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AToken) Object, holding Spotify Token information.

## API

Returns an instance of [Net::Async::Spotify::API](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AAPI) which includes all needed Spotify API Classes as methods.
To be used to access and call any loaded Spotify API

    $spotify->api->->player->transfer_a_users_playback(
        device_ids => '...',
        play => 'true'
    )->get;

Note that the response from any API call, belongs to [Net::Async::Spotify::Object](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AObject) group class.
For both, API calls and their response objects are being collected and auto generated from ["Spotify doc page"](https://developer.spotify.com/documentation/web-api/reference), check &lt;/"crawl-api-doc.pl">.

## authorize

Returns an [URI](https://metacpan.org/pod/URI) object with it being the needed Spotify Authorization request along with the needed parameters set.
also return random hexadecimal number as the state attached to this request.
Pretty much the things needed for ["Spotify Obtaining Authorization"](https://developer.spotify.com/documentation/general/guides/authorization-guide/#obtaining-authorization)
Accepts limited named parameters

- client\_id

    Spotify ClientID, set to class ["client\_id"](#client_id) if not passed.

- response\_type

    set as `code` for default. Since Authorization Code Flow is used.

- redirect\_uri

    URI string that will be used as Authorization callback URL. Set to main app ["redirect\_url"](#redirect_url) if not peresnt.

- state

    Used as linking mechanism between this generated Authorize Request, and the incoming callback code response.
    will be set to a random hexadecimal number. For more info see ["Cross-Site Request Forgery"](https://datatracker.ietf.org/doc/html/rfc6749#section-10.12)
    Optional and defaulted to a random 8 digit hexadecimal string, using [Math::Random::Secure::irand](https://metacpan.org/pod/Math%3A%3ARandom%3A%3ASecure%3A%3Airand)

- scope

    Sets permissions to be requested. Accepts array of scopes or scopes categories.
    e.g. scope => \[app\_remote\_control', 'user-follow-read', 'spotify\_connect'\]
    for more info ["Spotify Scopes"](https://developer.spotify.com/documentation/general/guides/scopes/), also [Net::Async::Spotify::Scope](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AScope).

- show\_dialog

    optional param can be passed set to either true|false
    Whether or not to force the user to approve the app again if they've already done so.
    `false` (default) from Spotify API itself.

    $spotify->authorize(
        scope => [
            'user-read-playback-state',
            'user-read-currently-playing',
            'playlists',
        ],
    );

Returns a `Hash` containing `uri` as the Authorization URL needed, and `state` as the value that is used in it ["state"](#state)

## obtain\_token

Method used to obtain access and refresh token from passed Authorization code.
[https://developer.spotify.com/documentation/general/guides/authorization-guide/](https://developer.spotify.com/documentation/general/guides/authorization-guide/) especifically Step 2 & 4 in Authorization Code Flow.
Support for other methods can be easily added, however not needed at the moment.
Accepts limited parameters, and based on them will decide whether to get new token from Authorization code
or from a previously obtained refresh token.
Note that it does not check for ["state"](#state) value as this step should be handled by caller.

- code

    representing Spotify Authorization Code, if passed, `grant_type` parameter will be set to authorization\_code.
    and the request will be for a new Spotify Token pair.

- redirect\_uri

    optional, must be matching the one used to obtain code. Only used when ["code"](#code) parameter is present

- auto\_refresh

    if set it will start `IO::Async::Timer::Periodic` in order to refresh access token before it expires.
    Accessed from ["Token Timer"](#token-timer)

## http

Accessor to underlying [Net::Async::HTTP](https://metacpan.org/pod/Net%3A%3AAsync%3A%3AHTTP) object, which is used to perform requests.

## token\_timer

An instance of [IO::Async::Timer::Periodic](https://metacpan.org/pod/IO%3A%3AAsync%3A%3ATimer%3A%3APeriodic) which is set to be called before `46` seconds
of curret Token expiry time
Can be started by ["auto\_refresh"](#auto_refresh) option

## client\_id

Accessor for Spotify App Client ID

## client\_secret

Accessor for Spotify App Client Secret

## redirect\_uri

Accessor for Spotify App defined redirect URL

## base\_uri

Accessor for Spotify Base URI

# spotify-cli.pl

Located at `bin/spotify-cli.pl`, This will be installed with the package, where it gives us a CLI for Spotify API.
Have some predefined commands, while it supports all API calls. Can run in various modes, one of them being `interactive`.
Currently it is just a simple CLI tool with minimal functionality.
Serves as implementation example for this library.

    # For full information
    spotify-cli.pl -h

Independent CLI library will be implemented using [Tickit](https://metacpan.org/pod/Tickit)

# crawl-api-doc.pl

Located at `scripts/spotify-cli.pl`, this script is mainly used for ease of implementation and maintability.
It will parse ["Spotify API Documentation page"](https://developer.spotify.com/documentation/web-api/reference) and utilizes a [Template](https://metacpan.org/pod/Template)
in order to create corresponding Classes for every Spotify API type and call, along with Responce Objects.
these 4 templates are what currently availabe and can be extended:

- SpotifyAPI\_main\_pm.tt2

    Located at `scripts/SpotifyAPI_main_pm.tt2` | Template for all [Net::Async::Spotify::API::\*](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AAPI%3A%3A%2A)
    Main base class for custom functionality. One time generation.

- SpotifyAPI\_pm.tt2

    Located at `scripts/SpotifyAPI_pm.tt2` | Template for all [Net::Async::Spotify::API::Generated::\*](https://metacpan.org/pod/Net%3A%3AAsync%3A%3ASpotify%3A%3AAPI%3A%3AGenerated%3A%3A%2A)
    Class for all available Spotify API calls defined as methods. Updated on Spotify API new releases.

- SpotifyObj\_main\_pm.tt2

    Located at `scripts/SpotifyObj_main_pm.tt2` | Template for all <Net::Async::Spotify::Object::\*>
    Main base class for custom functionality. One time generation.

- SpotifyObj\_pm.tt2

    Located at `scripts/SpotifyObj_pm.tt2` | Template for all <Net::Async::Spotify::Object::Generated::\*>
    Class for all available Spotify Response Objects, where fields are set to be methods. Updated on Spotify API new releases.

It accepts a couple of options to determines what you want to do.

    # To generate all of the above.
    perl scripts/crawl-api-doc.pl -e -o -i

    # Can be also used to explore API, combined with jq
    perl scripts/crawl-api-doc.pl -j | jq .

    # For more details and optionns
    perl scripts/crawl-api-doc.pl -h

Note that when Spotify releases changes on their API, all what it takes to update this package is:

    - Spotify to update their documentation page.
    - run this script and release changes.
