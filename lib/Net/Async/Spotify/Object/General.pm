package Net::Async::Spotify::Object::General;

use strict;
use warnings;

# VERSION
# AUTHORITY

use Future::AsyncAwait;
use Log::Any qw($log);
use Syntax::Keyword::Try;

=head1 NAME

    Net::Async::Spotify::Object::General - Default representation of unmapped Spotify API Response Objects

=head1 DESCRIPTION

Default representation of unmapped Objects. where C<data> will contain a hash of the returned response.
Without specifying field names.

=cut

sub new {
    my ( $class, %data ) = @_;

    my $self = bless {}, $class;
    $self->{data} = \%data;
    return $self;

}

sub data { shift->{data} }

1;
