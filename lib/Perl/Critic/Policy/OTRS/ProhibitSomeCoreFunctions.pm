package Perl::Critic::Policy::OTRS::ProhibitSomeCoreFunctions;

use strict;
use warnings;

use Perl::Critic::Utils qw{ :severities :classification :ppi };
use base 'Perl::Critic::Policy';

use Readonly;

our $VERSION = '0.01';

Readonly::Scalar my $DESC => q{Use of "print", "die", and "exit" in modules is not allowed};
Readonly::Scalar my $EXPL => q{Use methods of LayoutObject or MainObject instead.};

sub supported_parameters { return; }
sub default_severity     { return $SEVERITY_HIGHEST; }
sub default_themes       { return qw( otrs ) }
sub applies_to           { return 'PPI::Token::Word' }

my @prohibited = qw(print die exit);

sub violates {
    my ( $self, $elem ) = @_;

    return if !grep{ $elem eq $_ }@prohibited;
    return if $self->_is_script( $elem );
    return $self->violation( $DESC, $EXPL, $elem );
}

sub _is_script {
    my ( $self, $elem ) = @_;

    my $document = $elem->document;
    my $filename = $document->logical_filename;

    # This applies only to modules, not scripts.
    my $is_module = $filename =~ m{ \.pm \z }xms;

    # For now, only run this for controller modules (Kernel/Modules/*, Kernel/Output/HTML/)
    $is_module &&= $filename =~ m{ Kernel/Modules | Kernel/Output/HTML }xms;

    return !$is_module;
}

1;
__END__
=pod

=head1 NAME

Perl::Critic::Policy::OTRS::ProhibitSomeCoreFunctions

=head1 VERSION

version 0.02

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

