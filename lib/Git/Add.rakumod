unit class Git::Add:ver<0.0.1>:auth<zef:lizmat>;

has IO() $.directory = $*CWD.absolute;
has str  @.added is built(False);

method TWEAK(Mu :$add) {
    if $add {
        @!added.append: |$add if $add;
        indir $!directory, { run <git add>, @!added }
    }
}

method gist() {
    my str @parts;
    if @!added {
        @parts.push: "Added:";
        @parts.push: "  $_" for @!added;
        @parts.push: "";
    }
    
    @parts.prepend: self.^name ~ ":", "  $!directory", "" if @parts;

    @parts.join: "\n"
}

=begin pod

=head1 NAME

Git::Add - add paths to a git repository

=head1 SYNOPSIS

=begin code :lang<raku>

use Git::Add;

my $status := Git::Add.new(
  :$directory,
  :@add,
);

if $status.added -> @added {
    say "Added:";
    .say for @added;
}

=end code

=head1 DESCRIPTION

Git::Add provides a simple way to add paths to a git repository.

=head1 PARAMETERS

=head2 directory

The directory of the git repository.  Can be specified as either an C<IO::Path>
object, or as a string.  Defaults to C<$*CWD>.  It should be readable.

=head2 add

One or more paths to be added to the repository.  Can be specified as strings
or as C<IO::Path> objects.

=head1 METHODS

=head2 added

The paths of files that have been added.

=head2 gist

A text representation of the object, empty string if there were no added paths.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Git-Add .
Comments and Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2021 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
