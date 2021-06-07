package Net::Async::Spotify::Object::Base;

use strict;
use warnings;

use Log::Any qw($log);

sub new {
    my ( $class, $fields, %args ) = @_;
    my $self = bless {}, $class;
    $self->generate($fields, %args);
    return $self;
}

sub generate {
    my ( $self, $fields, %args ) = @_;

    for my $field (keys %$fields) {
        my $accessor = join '::', ref($self), $field;
        {
            # here we need to allow hard references
            # so we can add accessors to calling class.
            no strict 'refs';

            # Only add accessor when it does not exist
            # also do not repeat added ones.
            *{$accessor} = sub {
                my ( $self, $value ) = @_;

                if (defined $value) {
                    $value = $self->apply_type($fields->{$field}, $value);
                    $self->{$field} = $value;
                }
                return $self->{$field};
            }
            unless defined &{$accessor};
        }
        $self->$field($args{$field}) if exists $args{$field};
    }

}

sub apply_type {
    my ($self, $type, $value) = @_;
    $log->warnf('applying type %s', $type);
    # TODO: Add type checking
    return $value;
}

1;
