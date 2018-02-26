Installation Guide
==================

This chapter will guide you through the installation of bh on your machine.

.. _requirements:

Requirements
------------

bh is written in Python 3. In order to install it on your machine, first make
sure that the following requirements are satisfied:

* Python 3.5+
* `prompt_toolkit <https://pypi.python.org/pypi/prompt_toolkit>`_ 1.0
* `Pygments <https://pypi.python.org/pypi/Pygments/2.2.0>`_ 2.2

You can install the required Python packages via pip. On an Ubuntu 16.04 system,
the following command will install these packages globally::

    $ sudo -H pip3 install prompt_toolkit pygments

bh expects the Python interpreter to be named ``python3`` on your system. If it
is not, you will need to change the first line of the program accordingly, or
make a symbolic link on your system that points to the real Python interpreter.

.. _downloadingbh:

Downloading bh
--------------

In order to clone the bh repository locally, you will need to have Git
installed. Clone the repository as follows::

    $ git clone https://github.com/pille1842/bh

You can also obtain a Zip archive by visiting the `Releases page
<https://github.com/pille1842/bh/releases>`_.

.. _installingonthesystem:

Installing on the system
------------------------

You can either run bh from the directory you downloaded it to, or you can
install it on your system globally. bh comes with a Makefile that allows you to
use make to install bh. Change into the directory you downloaded bh into, then
execute the following command to install the bh program to ``/usr/local/bin``::

    $ sudo make install

If you wish to install bh to another location, you can change the prefix that is
applied to the target path. The default is ``/usr/local`` to comply with Linux
filesystem standards. In order to install bh into ``/usr/bin``, run::

    $ sudo make PREFIX=/usr install

The install directive will also install the Linux manual page for bh and the GNU
Info manual into the appropriate locations.

.. _buildinghtmldocumentation:

Building HTML documentation
---------------------------

If you wish to read HTML documentation offline, you will need `Sphinx
<http://www.sphinx-doc.org/en/master/>`_. After installing it, go into the
``doc/`` directory in the bh source, then issue the following command::

    $ make html

This will build HTML documentation into ``doc/_build/html/``. Open
``index.html`` with your browser to start reading.
