package Perl::Critic::Policy::OTRS::RequireParensWithMethods;

use strict;
use warnings;

use Perl::Critic::Utils qw{ :severities :classification :ppi };
use base 'Perl::Critic::Policy';

use Readonly;

our $VERSION = '0.01';

Readonly::Scalar my $DESC => q{Method invokation should use "()"};
Readonly::Scalar my $EXPL => q{Use "->MethodName()" instead of "->MethodName".};

sub supported_parameters { return; }
sub default_severity     { return $SEVERITY_HIGHEST; }
sub default_themes       { return qw( otrs ) }
sub applies_to           { return 'PPI::Token::Operator' }

sub violates {
    my ( $self, $elem ) = @_;
    
    return if $elem ne '->';
    
    my $method = $elem->snext_sibling;
    return if ref $method eq 'PPI::Structure::Subscript';
    
    my $list   = $method->snext_sibling;
    return if ref $list eq 'PPI::Structure::List';
    
    return $self->violation( $DESC, $EXPL, $elem );
}

1;
__END__
=pod

=head1 NAME

Perl::Critic::Policy::OTRS::RequireParensWithMethods

=head1 VERSION

version 0.02

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2010 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut

