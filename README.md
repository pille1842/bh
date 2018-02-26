# bh -- accounting utility program

bh is an interactive accounting utility program, providing tools for keeping a
list of accounts and searching through it, converting amounts between net and
gross value, calculating totals, and splitting bills between multiple
contributing parties.

bh is written in Python 3 and is licensed under the GNU General Public License.
See LICENSE for more information.

## Documentation

The full manual is available in HTML at <http://www.erixpage.de/bh/>. bh also
comes with its own manual page and a GNU Texinfo manual that are part of the
installation.

## Installation

### Requirements

To install bh on your machine, make sure the following requirements are
fulfilled:

  - Python >=3.5
  - [prompt-toolkit](https://pypi.python.org/pypi/prompt_toolkit) 1.0
  - [Pygments](https://pypi.python.org/pypi/Pygments/2.2.0) 2.2

To install these dependencies on a Ubuntu 16.04 machine using pip, issue the
following command:

```
$ sudo -H pip3 install prompt_toolkit pygments
```

### Installing bh

After downloading the [latest release](https://github.com/pille1842/bh/releases)
of bh, you can install it by typing:

```
$ sudo make install
```

This will install the bh program in `/usr/local/bin` and also install the bh
manual page and the GNU Texinfo manual at the right locations in `/usr/local`.

## Using bh

Refer to the full manual to get an idea of how to use bh. To start an
interactive session, type

```
$ bh
```

in your shell. Within bh, the `help` command gives you a detailed listing of all
available commands.

## Contributing

Bug reports, pull requests and feature requests are always welcome!

## License

This program is licensed under the GNU General Public License, Version 3 or, at
your discretion, any later version as published by the Free Software Foundation.
See LICENSE for a copy of the GNU GPL.

The documentation in the `doc/` directory as well as the manual page (`bh.1`)
and the GNU Texinfo manual generated from the contents of the `doc/` directory
are licensed under the GNU Free Documentation License, Version 1.3 or, at your
discretion, any later version as published by the Free Software Foundation. Type
`info bh` in your shell to see the manual including a full copy of the GNU FDL.
