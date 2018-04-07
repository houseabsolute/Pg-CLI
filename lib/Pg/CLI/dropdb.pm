package Pg::CLI::dropdb;

use strict;
use warnings;
use namespace::autoclean;

our $VERSION = '0.14';

use Moose;
use MooseX::SemiAffordanceAccessor;

with qw( Pg::CLI::Role::Connects Pg::CLI::Role::Executable );

__PACKAGE__->meta()->make_immutable();

1;

# ABSTRACT: Wrapper for the F<dropdb> utility

__END__

=head1 SYNOPSIS

  my $dropdb = Pg::CLI::dropdb->new(
      username => 'foo',
      password => 'bar',
      host     => 'pg.example.com',
      port     => 5433,
  );

  $dropdb->run(
      database => 'NewDB',
  );

=head1 DESCRIPTION

This class provides a wrapper for the F<dropdb> utility.

=head1 METHODS

This class provides the following methods:

=head2 Pg::CLI::dropdb->new( ... )

The constructor accepts a number of parameters:

=over 4

=item * executable

The path to F<dropdb>. By default, this will look for F<dropdb> in your
path and throw an error if it cannot be found.

=item * username

The username to use when connecting to the database. Optional.

=item * password

The password to use when connecting to the database. Optional.

=item * host

The host to use when connecting to the database. Optional.

=item * port

The port to use when connecting to the database. Optional.

=item * require_ssl

If this is true, then the C<PGSSLMODE> environment variable will be set to
"require" when connecting to the database.

=back

=head2 $dropdb->run( database => $db, ... )

This method runs the dropdb command with the given options.

This method also accepts optional C<stdin>, C<stdout>, and C<stderr>
parameters. These parameters can be any defined value that could be passed as
the relevant parameter to L<IPC::Run3>'s C<run3> subroutine.

Most notably, you can pass scalar references to pipe data in via the C<stdin>
parameter or capture output sent to C<stdout> or C<stderr>

This method accepts the following arguments:

=over 4

=item * database

The name of the database to drop. Required.

=item * options

A list of additional options to pass to the command. Optional.

=back

=cut
