package Net::Async::Spotify::API::Generated::Users;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::API::Base);

use Future::AsyncAwait;

=encoding utf8

=head1 NAME

Net::Async::Spotify::API::Generated::Users - Package representing Spotify Users API

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#reference-index
Check C<crawl-api-doc.pl> for more information.

=head1 METHODS

=cut

=head2 get_current_users_profile

get_current_users_profile - Get Current User's Profile

Get detailed profile information about the current user (including the
current user’s username).

with Request details being:

=head3 header

=over 4

=item Authorization

Type: string | Required: required
A valid access token from the Spotify Accounts service: see the Web API Authorization Guide for details. The access token must have been issued on behalf of the current user.Reading the user’s email address requires the user-read-email scope; reading country, product subscription level and explicit content settings requires the user-read-private scope. See Using Scopes.

=back

and Response Objects being:

- user object


On success, the HTTP status code in the response header is 200 OK and the response body contains a user object in JSON format. On error, the header status code is an error code and the response body contains an error object. When requesting fields that you don’t have the user’s authorization to access, it will return error 403 Forbidden.Important! If the user-read-email scope is authorized, the returned JSON will include the email address that was entered when the user created their Spotify account. This email address is unverified; do not assume that the email address belongs to the user.Try in our Web Console

=cut

async sub get_current_users_profile {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/me';
    $request->{param}  = {
        header => {
            'Authorization' => {
                type     => 'string',
                required => 'required',
            },
        },
    };
    my $response_objs = [
        'user object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

=head2 get_users_profile

get_users_profile - Get a User's Profile

Get public profile information about a Spotify user.

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

=item user_id

Type: string | Required: required
The user’s Spotify user ID.

=back

and Response Objects being:

- user object


On success, the HTTP status code in the response header is 200 OK and the response body contains a user object in JSON format. On error, the header status code is an error code and the response body contains an error object. If a user with that user_id doesn’t exist, the status code is 404 NOT FOUND.Try in our Web Console

=cut

async sub get_users_profile {
    my ($self, %args) = @_;

    my $request->{method} = 'GET';
    $request->{uri}    = 'https://api.spotify.com/v1/users/{user_id}';
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
    };
    my $response_objs = [
        'user object',

    ];

    await $self->call_api($request, $response_objs, %args);
}

1;
