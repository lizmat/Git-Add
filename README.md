[![Actions Status](https://github.com/lizmat/Git-Add/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Git-Add/actions) [![Actions Status](https://github.com/lizmat/Git-Add/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Git-Add/actions) [![Actions Status](https://github.com/lizmat/Git-Add/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Git-Add/actions)

NAME
====

Git::Add - add paths to a git repository

SYNOPSIS
========

```raku
use Git::Add;

my $status := Git::Add.new(
  :$directory,
  :@add,
);

if $status.added -> @added {
    say "Added:";
    .say for @added;
}
```

DESCRIPTION
===========

Git::Add provides a simple way to add paths to a git repository.

PARAMETERS
==========

directory
---------

The directory of the git repository. Can be specified as either an `IO::Path` object, or as a string. Defaults to `$*CWD`. It should be readable.

add
---

One or more paths to be added to the repository. Can be specified as strings or as `IO::Path` objects.

METHODS
=======

added
-----

The paths of files that have been added.

gist
----

A text representation of the object, empty string if there were no added paths.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Git-Add . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2021, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

