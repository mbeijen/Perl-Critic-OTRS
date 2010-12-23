package Perl::Critic::OTRS;

use warnings;
use strict;

# ABSTRACT A collection of handy Perl::Critic policies

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Perl::Critic::OTRS is a collection of Perl::Critic policies that
will help to program in the OTRS way of programming

=head1 DESCRIPTION

The rules included with the Perl::Critic::OTRS group include:

=head2 L<Perl::Critic::Policy::OTRS::ProhibitFetchrowHashref>

Kernel::System::DB provides a method called C<FetchrowHashref>, but this method
is deprecated as this relies on C<DBI>'s fetchrow_hashref. Some users have
reported problems with it on some database systems.

=head1 WHY A COLLECTION OF OTRS POLICIES?

The policies bundled in this distributions represent the coding guideline
provided by the OTRS project. It's always a good idea to program the way the
project itself does.

So every programmer who is familiar with the OTRS codebase can read and follow
your code.

=head1 AUTHOR

Renee Baecker, C<< <module@renee-baecker.de> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-perl-critic-otrs at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Perl-Critic-OTRS>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Perl::Critic::OTRS

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Perl-Critic-OTRS>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Perl-Critic-OTRS>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Perl-Critic-OTRS>

=item * Search CPAN

L<http://search.cpan.org/dist/Perl-Critic-OTRS>

=item * Source code repository

L<http://github.com/reneeb/Perl-Critic-OTRS>

=back

=head1 ACKNOWLEDGMENTS

Thanks to

=over 4

=item * Martin Edenhofer for creating a great tool like OTRS

=back

=head1 COPYRIGHT & LICENSE

Copyright 2010 Renee Baecker.

This program is free software; you can redistribute it and/or modify
it under the terms of:

=over 4

=item * the Artistic License version 2.0.

=back

=cut

1; # End of Perl::Critic::OTRS
