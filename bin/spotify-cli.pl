#!/usr/local/bin/perl

use strict;
use warnings;

use utf8;

# VERSION
# AUTHORITY

=encoding UTF8

=head1 NAME

C<spotify-cli.pl> - Script to interact with Spotify API in various ways.

=head1 SYNOPSIS

    perl bin/spotify-cli.pl -i

=head1 DESCRIPTION

This script allows you to interact with Spotify API in multiple different ways.
Providing you with a convinent way to query Spotify API by either the set of predefined commands or inline requests.

=cut

=head1 OPTIONS

=over 4

=item B<-c>, B<--client-id>=I<Spotify App Client ID>

Your registered Spotify Application Client ID
Can be set as environment variable I<client_id>

=item B<-s>, B<--client-secret>=I<Spotify APP Client Secret>

Your registered Spotify Application Client Secret
Can be set as environment variable I<client_secret>

=item B<-t>, B<--access-token>=I<Spotify Client Access Token>

Optional, if passed there will be no need to obtain token and requests can be directly called using it.
Can be set as environment variable I<access_token>

=item B<-i>, B<--interactive>

If exists it will run this script in interactive mode, where it will continuously wait for a command to perform.

=item B<-w>, B<--web-server>

If exists it will make the script run in the background as HTTP server listening to port 80 on localhost.
So it can process Spotify callback automatically and can receive commands.

=item B<-l> I<debug>, B<--log-level>=I<info>

Log level used.

=back

=cut

use Pod::Usage;
use Getopt::Long;
use IO::Async::Loop;
use IO::Async::Stream;
use Future::AsyncAwait;
use Syntax::Keyword::Try;
use Log::Any qw($log);
use Net::Async::Spotify;
use Data::Dumper;
use JSON::MaybeUTF8 qw(:v1);

GetOptions(
    'c|client-id=s'     => \(my $client_id = $ENV{client_id}),
    's|client-secret=s' => \(my $client_secret = $ENV{client_secret}),
    't|access-token=s'  => \(my $access_token = $ENV{access_token}),
    'i|interactive'     => \my $interactive,
    'w|web-server'      => \my $webserver,
    'l|log-level=s'     => \(my $log_level = 'info'),
    'h|help'            => \my $help,
);

require Log::Any::Adapter;
Log::Any::Adapter->set( qw(Stdout), log_level => $log_level );

pod2usage(
    {
        -verbose  => 99,
        -sections => "NAME|SYNOPSIS|DESCRIPTION|OPTIONS|COMMANDS",
    }
) if $help;

die 'Need Spotify Client ID and Client Secret' unless ( $client_id and $client_secret );

my $loop = IO::Async::Loop->new;
$loop->add( my $spotify = Net::Async::Spotify->new(
        client_id => $client_id,
        client_secret => $client_secret,
        access_token  => $access_token,
    )
);

my $stream = IO::Async::Stream->new(
    read_handle  => \*STDIN,
    write_handle => \*STDOUT,
    on_read => sub {
        my ( $self, $buffref, $eof ) = @_;

        while( $$buffref =~ s/^(.*\n)// ) {
            my $line = $1;
            my @cmd_array = split ' ', $line;
            my $command = $cmd_array[0];
            unless (defined $command) {
                print "\n";
                print pod2usage(
                    {
                        -verbose  => 99,
                        -sections => "COMMANDS",
                        -exitval  => 'NOEXIT',
                    }
                );
                print "Waiting for your Command!...\nCMD: ";
                return 0;
            }

            if (exists &{$command}) {
                # for a happy strict pragma
                my $method = \&{$command};
                $method->(@cmd_array)->retain;
            } else {
                generic->(@cmd_array)->retain;
            }

      }
      return 0;
   }
);
$loop->add( $stream );


my %authorize = $spotify->authorize(scope => ['scopes'], show_dialog => 'false');

$stream->write(sprintf("Your Authorize URI is:\n\n%s\n\nstate: %s\n", $authorize{uri}, $authorize{state}));

if ( $interactive ) {
    $stream->write("Please insert your `code` response in callback URL...\n");
    my ( $auth_code ) = await $stream->read_until( "\n" );
    chomp $auth_code;

    $stream->write("Please insert your `state` response in callback URL...\n");
    my ( $auth_state ) = await $stream->read_until( "\n" );
    chomp $auth_state;

    await $spotify->obtain_token(code => $auth_code, auto_refresh => 1);
    $stream->write("Waiting for your Command!...\nCMD: ");
    $loop->run;
}

sub write_to_stream {
    my $content = shift;
    my $to_write = '';
    try {
        # since we are Getting Net::Async::Spotify::Object here.
        # need to implement to_hash there in order to be able to do this
        #$to_write = encode_json_utf8($content);
        $to_write = Dumper($content);
    } catch ($e) {
        $stream->write("Could not parse response. Error: $e\n");
    }
    $stream->write($to_write."\nWaiting for your Command!...\nCMD: ");
}

=head1 COMMANDS

Available Commands:

=head2 CMD => p

Play - Player -> start_a_users_playback

=cut

async sub p {
    my $r = await $spotify->api->player->start_a_users_playback();
    write_to_stream($r);
}

=head2 CMD => pu

Pause - Player -> pause_a_users_playback

=cut

async sub pu {
    $stream->write("Pausing Player...\n");
    my $r = await $spotify->api->player->pause_a_users_playback();
    write_to_stream($r);
}

=head2 CMD => n

Next - Player -> skip_users_playback_to_next_track

=cut

async sub n {
    $stream->write("NEXT! :D\n");
    my $r = await $spotify->api->player->skip_users_playback_to_next_track();
    write_to_stream($r);
}

=head2 CMD => b

Previous - Player ->

=cut

async sub b {

}

=head2 CMD => c

Current Track - Player -> get_information_about_the_users_current_playback

=cut

async sub c {
    my $r = await $spotify->api->player->get_information_about_the_users_current_playback();
    write_to_stream($r);
}

=head2 CMD => d

Available Devices - Player -> get_a_users_available_devices

=cut

async sub d {
    my $r = await $spotify->api->player->get_a_users_available_devices();
    write_to_stream($r);
}

=head2 CMD => t I<device_id>

Transfer playback to device and start playing.

=cut

async sub t {
    my @cmd_array = @_;
    my $r = await $spotify->api->player->transfer_a_users_playback(device_ids => $cmd_array[1], play => 'true');
    write_to_stream($r);
}

=head2 CMD => v I<volume_percent>

Sets the current active device's volume.

=cut

async sub v {
    my @cmd_array = @_;
    my $devices = await $spotify->api->player->get_a_users_available_devices();
    my $device_id;
    for my $device ($devices->{content}{devices}->@*) {
        if($device->{is_active}) {
            $device_id = $device->{id};
            last;
        }
    }
    my $r = await $spotify->api->player->set_volume_for_users_playback(volume_percent => $cmd_array[1], device_id => $device_id);
    write_to_stream($r);
}

=head2 CMD => I<api_name> I<method_name> I<%args>

Generic - Where it will take first argument as API name, second would be the method name. And whaterve comes after that would be
a key value arguments.

=cut

async sub generic {
    my @cmd_array = @_;
    my $r;
    try{
        my $api_name = $cmd_array[0];
        my $api_cmd = $cmd_array[1];
        $r = await $spotify->api->$api_name->$api_cmd(splice @cmd_array, 2);
    } catch ($e) {
        $r = {fail => $e};
    }
    write_to_stream($r);
}
