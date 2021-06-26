package Net::Async::Spotify::Object::Generated::CurrentlyPlayingContext;

use strict;
use warnings;

# VERSION

use mro;
use parent qw(Net::Async::Spotify::Object::Base);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::Generated::CurrentlyPlayingContext - Package representing Spotify CurrentlyPlayingContext Object

=head1 DESCRIPTION

Autogenerated module.
Based on https://developer.spotify.com/documentation/web-api/reference/#objects-index
Check C<crawl-api-doc.pl> for more information.

=head1 PARAMETERS

Those are Spotify CurrentlyPlayingContext Object attributes:

=over 4

=item actions

Type: DisallowsObject
Description: Allows to update the user interface based on which playback actions are available within the current context.

=item context

Type: ContextObject
Description: A Context Object. Can be null.

=item currently_playing_type

Type: String
Description: The object type of the currently playing item. Can be one of track, episode, ad or unknown.

=item device

Type: DeviceObject
Description: The device that is currently active.

=item is_playing

Type: Boolean
Description: If something is currently playing, return true.

=item item

Type: TrackObject | EpisodeObject
Description: The currently playing track or episode. Can be null.

=item progress_ms

Type: Integer
Description: Progress into the currently playing track or episode. Can be null.

=item repeat_state

Type: String
Description: off, track, context

=item shuffle_state

Type: String
Description: If shuffle is on or off.

=item timestamp

Type: Integer
Description: Unix Millisecond Timestamp when data was fetched.

=back

=cut

sub new {
    my ($class, %args) = @_;

    my $fields = {
        actions => 'DisallowsObject',
        context => 'ContextObject',
        currently_playing_type => 'String',
        device => 'DeviceObject',
        is_playing => 'Boolean',
        item => 'TrackObject | EpisodeObject',
        progress_ms => 'Integer',
        repeat_state => 'String',
        shuffle_state => 'String',
        timestamp => 'Integer',
    };

    my $obj = next::method($class, $fields, %args);

    return $obj;
}

1;
