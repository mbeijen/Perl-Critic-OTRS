package Perl::Critic::Policy::OTRS::RequireTrueReturnValueForModules;

# ABSTRACT: Check if modules have a "true" return value

use strict;
use warnings;

use Perl::Critic::Utils qw{ :severities :classification :ppi };
use base 'Perl::Critic::Policy';

use Readonly;

our $VERSION = '0.02';

Readonly::Scalar my $DESC => q{Modules have to return a true value ("1;")};
Readonly::Scalar my $EXPL => q{Use "1;" as the last statement of the module};

sub supported_parameters { return; }
sub default_severity     { return $SEVERITY_HIGHEST; }
sub default_themes       { return qw( otrs ) }
sub applies_to           { return 'PPI::Document' }

sub violates {
    my ( $self, $elem ) = @_;
    
    return if $self->_is_script( $elem );
    return if $self->_returns_1( $elem );
    return $self->violation( $DESC, $EXPL, $elem );
}

sub _returns_1 {
    my ( $self, $elem ) = @_;
    
    my $last_statement = ( grep{ ref $_ eq 'PPI::Statement' }$elem->schildren )[-1];
    return 0 if !$last_statement;
    return 1 if $last_statement eq '1;';
    return 0;
}

sub _is_script {
    my ( $self, $elem ) = @_;
    
    my $document = $elem->document;
    my $filename = $document->logical_filename;
    
    my $is_module = $filename =~ m{ \.pm \z }xms;
    
    return !$is_module;
}

1;

__END__
=pod

=head1 NAME

Perl::Critic::Policy::OTRS::RequireTrueReturnValueForModules - Check if modules have a "true" return value

=head1 VERSION

version 0.02

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

