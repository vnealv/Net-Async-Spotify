package Net::Async::Spotify::Object;

use strict;
use warnings;

use Future::AsyncAwait;
use Log::Any qw($log);
use Syntax::Keyword::Try;
use Path::Tiny;
use Module::Path qw(module_path);
use Module::Runtime qw(require_module);
use Net::Async::Spotify::Util qw(response_object_map);
use Net::Async::Spotify::Object::General;
 
=head1 NAME

    Net::Async::Spotify::Object - Common Wrapper package for Spotify response Objects

=head1 DESCRIPTION

Common wrapper for Spotify response Objects. To be used to dynamically be able to create
resonse objects.

=head1 SYNOPSIS



=head1 PARAMETERS

We would need to pass what we thing this Object might be along with the content.

=over 4

=item possible_types

A list of possible types for this object we want to create.

=item data

the content that we want to create the object for.

=back

=cut

my $available_types;
BEGIN {
    # Include all Spotify Object classes
    my $current_path = path(module_path(__PACKAGE__) =~ s/\.pm/\//r );
    push @$available_types, $_->basename =~ s/\.pm//r for $current_path->child('Generated')->children;
    require_module(join '::', __PACKAGE__, $_) for @$available_types;
}

sub new {
    my ( $obj, $data, $res_hash ) = @_;

    my $class = response_object_map($available_types, $res_hash);
    $log->debugf('Response object mapping; params: %s | Class selected: %s', $res_hash, $class);
    # return generic when not found.
    return Net::Async::Spotify::Object::General->new($data->%*) unless defined $class;

    my $content = [];
    try {
        # Check if pagination or Error object.
        if ( exists $data->{items} and exists $data->{limit} and exists $data->{total} ) {
            push @$content, $class->new($_->%*) for $data->{items}->@*;
            delete $data->{items};
            my $page = Net::Async::Spotify::Object::Paging->new($data->%*);
            $page->{items} = $content;
            return $page;
            # TODO: Add error checking.
        } else {
            return $class->new($data->%*);
        }
    } catch ($e) {
        $log->warnf('Could not create Spotify Object %s | error: %s | res_hash: %s ', $class, $e, $res_hash);
    }
    return Net::Async::Spotify::Object::General->new($data->%*);
}

1;

=d
        my @keys = keys %$data;
        # Object name containing multiple objects
        if (scalar @keys == 1 and ref $data->{$keys[0]} eq 'ARRAY') {
            push @$content, $class->new($_->%*) for $data->{$keys[0]}->@*;
            my $accessor = join '::', ref($self), $keys[0];
            {
                no strict 'refs';
                *{$accessor} = sub {
                    my ($self, $data) = @_;
                    $self->{$keys[0]} = $data if defined $data;
                    return $self->{$keys[0]};
                };
            }
            $self->{$keys[0]} = $content;
        # Single Object
        } else {
=cut
