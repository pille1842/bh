Working with taxrates
=====================

Most of the calculations done by bh include some sort of conversion between net
and gross values. For this purpose, you can define a global taxrate that is
indicated as part of your command prompt::

    BH 19.00->

In this case, the taxrate is set to 19 percent. The following commands will
alter their behaviour because of this setting:

``gr``, ``grsum``
    gr and grsum will use the taxrate to convert net amounts to gross values.
``net``, ``netsum``
    net and netsum will use the taxrate to convert gross amounts to net values.
``split``
    split will convert any amounts given to it (except the total) to gross value
    if the taxrate is set to anything but zero.

.. _settingthetaxrate:

Setting the taxrate
-------------------

You can set the global taxrate by using the ``settaxr`` command::

    BH  0.00-> settaxr 19
    BH 19.00->

This will immediately be indicated in your command prompt. Please note that you
can give a number with arbitrary precision to be set as the taxrate, like
25.4711. This will also be used in calculations. However, neither the prompt nor
the ``prtaxr`` command will ever indicate more than two decimal places!

.. _gettingthecurrenttaxrate:

Getting the current taxrate
---------------------------

In addition to the prompt, you can also ask bh to print out the current taxrate
with the ``prtaxr`` command::

    BH 19.00-> prtaxr
    Taxrate is set to 19.00 percent.
