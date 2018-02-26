Accounts
========

bh helps you keep a list of accounts. These might be the standard accounts that
are used in your jurisdiction, or user-defined accounts, for example the
accounts of your customers. Each account has a unique number and an associated
name. The list of accounts can easily be searched through, stored on disk and
loaded into bh.

It is important to note that bh is not an accounting program. It does not
provide utilities to make entries into accounts, but simply to keep a list of
accounts that you can search through. There are already excellent accounting
programs; bh is a utility program designed to help in accounting where these
programs might be lacking in speed and ease of use.

.. _creatingnewaccounts:

Creating new accounts
---------------------

In order to create a new account, use the ``newacc`` command. It expects two
arguments: an account number and a name to give to the new account. To create an
account with number 1200 and the name "Bank Account", issue the following
command to bh::

    BH> newacc 1200 "Bank Account"

Don't forget to wrap arguments that contain spaces, like "Bank Account", into
double quotes!

Notice how the prompt changed when you issued this command. Instead of a green
dash, there will be a red asterisk. This indicates that the accounts list in
memory contains an account that has not yet been saved to a file on disk.

If you attempt to create an account with a number that already exists, bh will
refuse to do so. This is not true when loading accounts from a file on disk,
however: In this case, accounts loaded later will overwrite existing accounts if
there is a collision, although bh will issue a warning if it does overwrite an
existing account.

.. _deletingaccounts:

Deleting accounts
-----------------

To delete one or more accounts, simply pass their numbers as arguments to the
``delacc`` command::

    BH> delacc 1200 4200 4711

You can also clear the entire list of accounts with the ``clearacc`` command. bh
will refuse to clear the list of accounts if there are unsaved changes in the
accounts list, however.

.. _searchingtheaccountslist:

Searching the accounts list
---------------------------

There are two commands to search through the accounts list in memory: ``acc``
and ``accno``. Use ``acc`` to search through the names of accounts, ``accno`` to
search through their numbers. Imagine you have the following list of accounts::

      1200 TEST ACCOUNT
      4200 MY COMPANY, INC.
      4711 CUSTOMER ENTERPRISES CORP.

``acc`` allows you to search for multiple terms at once. This is example output
produced by issuing the following command::

    BH> acc test comp cust
    test:
      1200 TEST ACCOUNT
    comp:
      4200 MY COMPANY, INC.
    cust:
      4711 CUSTOMER ENTERPRISES CORP.

Search is case-insensitive and looks for parts of account names regardless where
they appear. Use ``accno`` to search for specific account numbers instead::

    BH> accno 200 11
    200:
      4200 MY COMPANY, INC.
      1200 TEST ACCOUNT
    11:
      4711 CUSTOMER ENTERPRISES CORP.

``accno`` looks for any part of an account number that matches a search term.

.. _loadingandsavingaccounts:

Loading and saving accounts
---------------------------

bh stores accounts on disk in JSON files. Each such file contains an object with
key-value pairs. The keys are account numbers while the values represent account
names. You can save the accounts currently in memory to a file with the
``saveacc`` command::

    BH> saveacc myaccounts.json

This will also change the prompt again if there were unsaved accounts: Instead
of a red asterisk, it will now display a green dash, indicating that all changes
have been saved to disk.

To load accounts from one or more files, use the ``loadacc`` command::

    BH> loadacc myaccounts.json otheraccounts.json

bh will warn you if any accounts in memory are overwritten due to an identical
account number read from a file. It will also print the total number of accounts
read from each file.

.. _printingtheaccountslist:

Printing the accounts list
--------------------------

Should you ever wish to print the entire list of accounts, you can do so with
the ``pracc`` command. It will sort the accounts by number and print them.

.. _thedirtybit:

The dirty bit
-------------

bh makes use of a so-called "dirty bit" to keep track of unsaved changes to the
accounts list. Whenever you create a new account with the ``newacc`` command, or
delete an existing account with ``delacc``, the dirty bit is turned on. This
changes the prompt: It will now display a red asterisk instead of a green dash.
Saving the accounts list to a file with ``saveacc`` will turn the dirty bit off
and return the prompt to normal.

If the dirty bit is turned on, this will also change the behaviour of some
commands. ``quit`` will refuse to exit if there are unsaved changes.
``clearacc`` will not allow you to clear the entire list of accounts.

You can manually turn the dirty bit on and off with the ``setdirty`` command::

    BH> setdirty 0

To turn the dirty bit on, use one of the following values as an argument to
``setdirty``: 1, true, yes, on, one. To turn it off, use one of these values: 0,
false, no, off, zero.
