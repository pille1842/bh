The command-line interface
==========================

After installing bh, you can run it by typing ``bh`` in a terminal window. This
will start bh in interactive mode. You will be greeted by a short license notice
and a pointer towards the two most important commands: ``help`` to display
online help, and ``quit`` to leave the program.

.. _theprompt:

The prompt
----------

After that, a prompt will be displayed that looks like this::

    BH  0.00->

This prompt indicates a number of facts. ``0.00`` refers to the currently set
taxrate (see :doc:`taxrate`). The dash (``-``) indicates that there are no
accounts in memory that have not been saved to a file on disk (see
:ref:`thedirtybit`). If you change the taxrate, the display will change
accordingly. If there are accounts in memory that have not been saved to a file,
this will be indicated by an asterisk (*) instead of the dash. If your terminal
supports color, bh will also color the prompt: the taxrate is printed yellow,
while a dash will be printed green and an asterisk red.

.. _gettinghelp:

Getting help
------------

bh has excellent online help built right into the interface. Type ``help`` to
get a concise list of all commands ordered by general topic. In order to get
help for a specific command, type ``help`` and then the name of the command.
This will print a short usage information on how to call the command as well as
an explanation of what exactly each command does.

The usage info uses standard POSIX syntax to describe different kinds of
arguments for commands. Everything you should type into bh verbatim will be
printed in lower-case letters. Anything you have to replace with your own values
will be printed in upper-case letters instead. If an argument is optional,
meaning you do not have to supply it when executing a command, it will be
printed in square brackets ([]). If you can supply more than one argument of a
certain type, this will be indicated with three dots (...) after the argument
name.

.. _exitingbh:

Exiting bh
----------

You can quit bh either by typing ``quit`` and hitting the Enter key, or by
hitting Ctrl+C or Ctrl+D. Please note that in the latter two cases, bh will not
warn you if there are any unsaved accounts in memory! It is best to always exit
bh by issuing the ``quit`` command.

.. _history:

History
-------

All the usual Vi and Emacs keybindings that you might be familiar with from your
terminal emulator work in bh. In particular, there is an in-memory command
history. Use the up and down arrow keys to navigate through previously executed
commands.

.. _issuingcommands:

Issuing commands
----------------

To issue a command, first type the command, then a space, then any arguments the
command might require, separated by spaces. If a single argument needs to
contain spaces, wrap it in double quotes (") or espace the space character with
a backslash (\). If a command has no arguments, typing the command name and
hitting Enter is sufficient.

The command-line interface is fully compatible with POSIX shell standards. The
way you issue commands to your shell is identical to the way you issue commands
to bh.
