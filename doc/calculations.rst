Calculations
============

bh has a number of tools built in to help you with common calculations you might
need when doing your accounting work. In particular, it can easily convert
between net and gross values and calculate totals. There is also a facility
built right in that allows you to split a large bill between multiple
contributing parties.

.. _convertingnetandgrossvalues:

Converting net and gross values
-------------------------------

After setting a taxrate (see :ref:`settingthetaxrate`), you can convert amounts
between net and gross value using the ``net`` and ``gr`` commands. ``net`` will
convert any amounts you give it to net value, while ``gr`` does the opposite: It
converts amounts to gross value::

    BH 19.00-> gr 350 700 121.12
      350.00: GROSS( 19.00%)   416.50
      700.00: GROSS( 19.00%)   833.00
      121.12: GROSS( 19.00%)   144.13
    BH 19.00-> net 416.5 833.00 144
      416.50: NET( 19.00%)   350.00
      833.00: NET( 19.00%)   700.00
      144.00: NET( 19.00%)   121.01

As you can see, each of these commands converts any amounts you give it as
arguments. You have to give these commands at least one argument, otherwise they
will print out an error message.

.. _calculatingtotals:

Calculating totals
------------------

There are three commands that calculate sums. The ``sum`` command simply adds
all the arguments it gets and prints out the total, rounded to two decimal
places. The ``grsum`` will do the same, but will treat any amounts it gets as
net value and convert them to gross value first. Finally, the ``netsum`` command
treats all its arguments as gross value and will convert them to net value
first::

    BH 19.00-> sum 100 200 300
    TOTAL   600.00
    BH 19.00-> grsum 100 200 300
    TOTAL   714.00
    BH 19.00-> netsum 100 200 300
    TOTAL   504.20

Each of these commands also has an interactive mode. Call them without any
arguments to use it::

    BH 19.00-> sum
    Amount (empty line to quit): 100
    Amount (empty line to quit): 200
    Amount (empty line to quit): 300
    Amount (empty line to quit): 
    TOTAL   600.00

All three commands will ask you for further amounts until you quit with an empty
line of input.

.. _splittingbills:

Splitting bills
---------------

This is a very special facility built into bh. It is suitable for the following
situation: Your company invoices a customer with a set gross amount of, say,
$1200.00. In internal accounting, you want to split this bill into accounts for
multiple employees who contributed to the billed work. You know the net values
each employee has contributed, but you wish to convert them to gross value first
before splitting the bill.

The ``split`` command allows you to do exactly that. It expects at least two
arguments: A total that is assumed to already be gross value, and one net amount
that will be converted to gross value and subtracted from the total::

    BH 19.00-> split 1200 300 300
    TOTAL  1200.00
    PER01   357.00
    PER02   357.00
    REST    486.00

As you can see, if a rest remains, bh will also print that. If the sum of the
amounts is larger than the total you have provided, this will be indicated with
a ``!MISS`` line that informs you of the missing amount. If no rest remains and
nothing is missing, this will be indicated by a line saying ``EXACT``.

``split`` also has an interactive mode. Call it without any arguments to use
it::

    BH 19.00-> split
    Total: 1200
    Amount (empty line to quit): 300
    Amount (empty line to quit): 300
    Amount (empty line to quit): 
    TOTAL  1200.00
    PER01   357.00
    PER02   357.00
    REST    486.00

``split`` will continue to prompt you for further amounts to subtract until you
quit with an empty line of input.
