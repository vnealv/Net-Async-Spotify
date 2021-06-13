package Net::Async::Spotify::Object::Base;

use strict;
use warnings;

use Log::Any qw($log);
use Syntax::Keyword::Try;
use Module::Runtime qw(require_module);

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
        exists $args{$field} ?
            $self->$field(delete $args{$field}) :
            $self->$field('');
    }
    $log->warnf('Unknown field %s passed | Object: %s', $_, ref $self) for keys %args;

}

sub apply_type {
    my ($self, $type, $value) = @_;
    $log->tracef('applying type %s', $type);
    # TODO: Implement better Type casting, maybe Inline C ?
    if ( $type eq 'Integer' ) {
        $value = 0 unless $value;
        return $value if $value =~ /^\d+$/;
    } elsif ( $type eq 'Float' ) {
        $value = "0.0" unless $value;
        return $value if $value =~ /[+-]?[0-9]*[.]?[0-9]+/;
    } elsif ( $type eq 'String' ) {
        return $value unless ref $value;
    } elsif ( my ( $obj ) = $type =~ /^(?!Array)(.*?)(Object)/ ) {
        my $module = "Net::Async::Spotify::Object::$obj";
        try {
            require_module($module);
        } catch($e) {
            $log->errorf('Unrecognized Object type %s | Error: %s', $module, $e);
        }
        # When $value is empty.
        # Not sure if I want to pass it as empty hashref
        # or empty blessed object
        # will revisit later.
        $value = {} unless $value;
        return $module->new($value->%*);
    } elsif ( my ($array_type, $object_array) = $type =~ /^Array\[(.*?)(Object)?\]/m ) {
        my $array = [];
        if ( $object_array ) {
            my $module = $array_type ? "Net::Async::Spotify::Object::$array_type" : "Net::Async::Spotify::Object";
            try {
                require_module($module);
            } catch($e) {
                $log->errorf('Unrecognized Object type %s | Error: %s', $module, $e);
            }
            if ( $value ) {
                push @$array, $module->new($_->%*) for @$value;
            }
        } elsif ( $value ) {
            push @$array, $_ for @$value;
        }
        return $array;
    }
    $log->errorf('Unmatching Type. %s is not %s | %s', $value, $type, ref $self);
    return $value;
}

1;
