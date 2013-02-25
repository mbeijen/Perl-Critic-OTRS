package Perl::Critic::Policy::OTRS::ProhibitDumper;

# ABSTRACT: Check module for use of "Dumper"

use strict;
use warnings;

use Perl::Critic::Utils qw{ :severities :classification :ppi };
use base 'Perl::Critic::Policy';

use Readonly;

our $VERSION = '0.02';

Readonly::Scalar my $DESC => q{Use of "Dumper" is not allowed.};
Readonly::Scalar my $EXPL => q{Use "Dump" method of MainObject instead};

sub supported_parameters { return; }
sub default_severity     { return $SEVERITY_HIGHEST; }
sub default_themes       { return qw( otrs ) }
sub applies_to           { return 'PPI::Token::Word' }

sub violates {
    my ( $self, $elem ) = @_;

    return if $elem ne 'Dumper' && $elem ne 'Data::Dumper::Dumper';
    return if !is_function_call( $elem );
    return $self->violation( $DESC, $EXPL, $elem );
}

1;

__END__
=pod

=head1 NAME

Perl::Critic::Policy::OTRS::ProhibitDumper - Check module for use of "Dumper"

=head1 VERSION

version 0.02

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut