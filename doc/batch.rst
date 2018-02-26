Batch Processing
================

bh allows you to execute commands from so-called batch files. These are files
that contain commands, one per line, as you would issue them in an interactive
bh session.

Batch files can also contain comments. A comment is something intended for the
human reader of a batch file, explaining what the purpose of the commands that
are being executed is. bh will ignore comments. You can make any line a comment
by starting it with a pound sign (#). Please note that inline comments are not
allowed; each comment has to start at the beginning of a line.

.. _executingbatchfilesfromwithinbh:

Executing batch files from within bh
------------------------------------

If at any point in a bh session you wish to execute commands from a batch file,
use the ``exec`` command to do so::

    BH 19.00-> exec mybatchfile.bat

bh will then read the contents of the given file (relative to the current
working directory). It will print out any commands it is about to execute
preceded with ``BH>``. Suppose your batch file has the following contents::

    # This is a comment.
    settaxr 19
    grsum 100 200 300
    # Another comment. Let's split a bill!
    split 1200 300 300

Save this file as ``example.bat`` and execute it from within bh. The output will
be the following::

    BH  0.00-> exec example.bat
    BH> settaxr 19
    BH> grsum 100 200 300
    TOTAL   714.00
    BH> split 1200 300 300
    TOTAL  1200.00
    PER01   357.00
    PER02   357.00
    REST    486.00

As you can see, the comment lines have been ignored, and any commands contained
within the batch file have been printed out preceded by ``BH>`` before being
executed in the interactive session.

.. _providingbatchfilesascommandlinearguments:

Providing batch files as command line arguments
-----------------------------------------------

You can also supply any number of batch files to be processed right at the
startup of bh by giving them as command line arguments to bh. Type the following
into your shell to execute the ``example.bat`` file from the previous section::

    $ bh example.bat

bh will print its usual welcome message and then immediately execute the batch
file. You can use this, for example, to load accounts from a file and set a tex
rate appropriate for your jurisdiction right when you are about to start your
accounting work. You don't have to type these commands over and over again in
each interactive session.

You could also define an alias in your shell to do this for you. Suppose you
simply want to type ``accounting`` to start bh and execute the ``example.bat``
file from the previous section. You could add the following to your ``.bashrc``
or any of the other usual POSIX shell setup files::

    alias accounting='bh ~/example.bat'

Note that in this case, an absolute path to your home directory was supplied as
an argument, not a path relative to the current working directory. For more
information about aliases, see the `Advanced Bash-Scripting Guide
<http://tldp.org/LDP/abs/html/aliases.html>`_.

.. _usingbatchfilesasshellscripts:

Using batch files as shell scripts
----------------------------------

UNIX systems allow you to define any command interpreter at the beginning of a
script file. You can use this to your advantage. Edit your ``example.bat`` file
to look like this::

    #!/usr/local/bin/bh
    # This is a comment
    settaxr 19
    grsum 100 200 300
    split 1200 300 300

Then, make the file executable by changing its permissions from within your
shell::

    $ chmod +x example.bat

Now you can start bh and execute any commands from the batch file by simply
typing the following into your shell::

    $ ./example.bat

(The ``.bat`` filename extension is purely cosmetic, by the way. bh does not
care about the names of your batch files as long as they are valid filenames.)
