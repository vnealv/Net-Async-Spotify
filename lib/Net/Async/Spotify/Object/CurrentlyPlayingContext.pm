package Net::Async::Spotify::Object::CurrentlyPlayingContext;

use strict;
use warnings;

# VERSION
# AUTHORITY

use mro;
use parent qw(Net::Async::Spotify::Object::Generated::CurrentlyPlayingContext);

=encoding utf8

=head1 NAME

Net::Async::Spotify::Object::CurrentlyPlayingContext - Package representing Main Spotify CurrentlyPlayingContext Object

=head1 DESCRIPTION

Main module for an Autogenerated one L<Net::Async::Spotify::Object::Generated::CurrentlyPlayingContext>.
Will hold all extra functionality for Spotify CurrentlyPlayingContext Object

=head1 METHODS

=cut

sub to_human {
    my $self = shift;
    return join(' | ',
        $self->currently_playing_type,
        $self->item->id,
        $self->item->name,
        join(' & ', map {$_->name} $self->item->artists->@*),
        $self->item->album->name,
        $self->device->name . '( ' . $self->device->volume_percent .'% )'
    );
}

1;
