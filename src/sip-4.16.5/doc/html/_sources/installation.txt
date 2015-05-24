Installation
============

Downloading
-----------

You can get the latest release of the SIP source code from
http://www.riverbankcomputing.com/software/sip/download.

SIP is also included with all of the major Linux distributions.  However, it
may be a version or two out of date.


Configuring
-----------

After unpacking the source package (either a ``.tar.gz`` or a ``.zip`` file
depending on your platform) you should then check for any ``README`` files
that relate to your platform.

Next you need to configure SIP by executing the :program:`configure.py` script.
For example::

    python configure.py

This assumes that the Python interpreter is on your path.  Something like the
following may be appropriate on Windows::

    c:\python34\python configure.py

If you have multiple versions of Python installed then make sure you use the
interpreter for which you wish SIP to generate bindings for.

The full set of command line options is:

.. program:: configure.py

.. cmdoption:: --version

    Display the SIP version number.

.. cmdoption:: -h, --help

    Display a help message.

.. cmdoption:: --arch <ARCH>

    Binaries for the MacOS/X architecture ``<ARCH>`` will be built.  This
    option should be given once for each architecture to be built.  Specifying
    more than one architecture will cause a universal binary to be created.

.. cmdoption:: -b <DIR>, --bindir <DIR>

    The SIP code generator will be installed in the directory ``<DIR>``.

.. cmdoption:: --configuration <FILE>

    .. versionadded:: 4.16

    ``<FILE>`` contains the configuration of the SIP build to be used instead
    of dynamically introspecting the system and is typically used when
    cross-compiling.  See :ref:`ref-configuration-files`.

.. cmdoption:: -d <DIR>, --destdir <DIR>

    The SIP module will be installed in the directory ``<DIR>``.

.. cmdoption:: --deployment-target <VERSION>

    .. versionadded:: 4.12.1

    Each generated Makefile will set the :envvar:`MACOSX_DEPLOYMENT_TARGET`
    environment variable to ``<VERSION>``.  In order to work around bugs in
    some versions of Python, this should be used instead of setting the
    environment variable in the shell.

.. cmdoption:: -e <DIR>, --incdir <DIR>

    The SIP header file will be installed in the directory ``<DIR>``.

.. cmdoption:: -k, --static

    The SIP module will be built as a static library.  This is useful when
    building the SIP module as a Python builtin.

.. cmdoption:: -n, --universal

    The SIP code generator and module will be built as universal binaries
    under MacOS/X.  If the :option:`--arch <configure.py --arch>` option has
    not been specified then the universal binary will include the ``i386`` and
    ``ppc`` architectures.

.. cmdoption:: --no-tools

    .. versionadded:: 4.16

    The SIP code generator and :mod:`sipconfig` module will not be installed.

.. cmdoption:: -p <PLATFORM>, --platform <PLATFORM>

    Explicitly specify the platform/compiler to be used by the build system,
    otherwise a platform specific default will be used.  The
    :option:`--show-platforms <configure.py --show-platforms>` option will
    display all the supported platform/compilers.

.. cmdoption:: -s <SDK>, --sdk <SDK>

    If the :option:`--universal <configure.py -n>` option was given then this
    specifies the name of the SDK directory.  If a path is not given then it is
    assumed to be a sub-directory of
    ``/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs``
    or ``/Developer/SDKs``.

.. cmdoption:: -u, --debug

    The SIP module will be built with debugging symbols.

.. cmdoption:: -v <DIR>, --sipdir <DIR>

    By default ``.sip`` files will be installed in the directory ``<DIR>``.

.. cmdoption:: --show-platforms

    The list of all supported platform/compilers will be displayed.

.. cmdoption:: --show-build-macros

    The list of all available build macros will be displayed.

.. cmdoption:: --sip-module <NAME>

    The SIP module will be created with the name ``<NAME>`` rather than the
    default ``sip``.  ``<NAME>`` may be of the form
    ``package.sub-package.module``.  See :ref:`ref-private-sip` for how to
    use this to create a private copy of the SIP module.

.. cmdoption:: --sysroot <DIR>

    .. versionadded:: 4.16

    ``<DIR>`` is the name of an optional directory that replaces ``sys.prefix``
    in the names of other directories (specifically those specifying where the
    various SIP components will be installed and where the Python include
    directories can be found).  It is typically used when cross-compiling or
    when building a static version of SIP.  See :ref:`ref-configuration-files`.

.. cmdoption:: --target-py-version <VERSION>

    .. versionadded:: 4.16

    ``<VERSION>`` is the major and minor version (e.g. ``3.4``) of the version
    of Python being targetted.  By default the version of Python being used to
    run the :program:`configure.py` script is used.  It is typically used when
    cross-compiling.  See :ref:`ref-configuration-files`.

.. cmdoption:: --use-qmake

    .. versionadded:: 4.16

    Normally the :program:`configure.py` script uses SIP's own build system to
    create the Makefiles for the code generator and module.  This option causes
    project files (``.pro`` files) used by Qt's :program:`qmake` program to be
    generated instead.  :program:`qmake` should then be run to generate the
    Makefiles.  This is particularly useful when cross-compiling.

The :program:`configure.py` script takes many other options that allows the
build system to be finely tuned.  These are of the form ``name=value`` or
``name+=value``.  The :option:`--show-build-macros <configure.py
--show-build-macros>` option will display each supported ``name``, although not
all are applicable to all platforms.

The ``name=value`` form means that ``value`` will replace the existing value of
``name``.

The ``name+=value`` form means that ``value`` will be appended to the existing
value of ``name``.

For example, the following will disable support for C++ exceptions (and so
reduce the size of module binaries) when used with GCC::

    python configure.py CXXFLAGS+=-fno-exceptions

A pure Python module called ``sipconfig.py`` is generated by
:program:`configure.py`.  This defines each ``name`` and its corresponding
``value``.  Looking at it will give you a good idea of how the build system
uses the different options.  It is covered in detail in
:ref:`ref-build-system`.


Configuring for MinGW
*********************

SIP, and the modules it generates, can be built with MinGW, the Windows port of
GCC.  You must use the :option:`--platform <configure.py -p>` command line
option to specify the correct platform.  For example::

    c:\python34\python configure.py --platform win32-g++


Configuring for the Borland C++ Compiler
****************************************

SIP, and the modules it generates, can be built with the free Borland C++
compiler.  You must use the :option:`--platform <configure.py -p>` command line
option to specify the correct platform.  For example::

    c:\python34\python configure.py --platform win32-borland

You must also make sure you have a Borland-compatible version of the Python
library.  If you are using the standard Python distribution (built using the
Microsoft compiler) then you must convert the format of the Python library.
For example::

    coff2omf python34.lib python34_bcpp.lib


Building
--------

The next step is to build SIP by running your platform's ``make`` command.  For
example::

    make

The final step is to install SIP by running the following command::

    make install

(Depending on your system you may require root or administrator privileges.)

This will install the various SIP components.


.. _ref-configuration-files:

Configuring with Configuration Files
------------------------------------

The :program:`configure.py` script normally introspects the Python installation
of the interpreter running it in order to determine the names of the various
files and directories it needs.  This is fine for a native build of SIP but
isn't appropriate when cross-compiling.  In this case it is possible to supply
a configuration file, specified using the
:option:`--configuration <configure.py --configuration>` option, which contains
definitions of all the required values.

The format of a configuration file is as follows:

- a configuration item is a single line containing a name/value pair separated
  by ``=``

- a value may include another value by embedding the name of that value
  surrounded by ``%(`` and ``)``

- comments begin with ``#`` and continue to the end of the line

- blank lines are ignored.

:program:`configure.py` provides the following preset values for a
configuration:

``py_major``
    is the major version number of the target Python installation.

``py_minor``
    is the minor version number of the target Python installation.

``sysroot``
    is the name of the system root directory.  This is specified with the
    :option:`--sysroot <configure.py --sysroot>` option.

The following is an example configuration file::

    # The target Python installation.
    py_platform = linux
    py_inc_dir = %(sysroot)/usr/include/python%(py_major)%(py_minor)

    # Where SIP will be installed.
    sip_bin_dir = %(sysroot)/usr/bin
    sip_module_dir = %(sysroot)/usr/lib/python%(py_major)/dist-packages

The following values can be specified in the configuration file:

``py_platform``
    is the target Python platform.

``py_inc_dir``
    is the target Python include directory containing the ``Python.h`` file.

``py_conf_inc_dir``
    is the target Python include directory containing the ``pyconfig.h`` file.
    If this isn't specified then it defaults to the value of ``py_inc_dir``.

``py_pylib_dir``
    is the target Python library directory.

``sip_bin_dir``
    is the name of the target directory where the SIP code generator will be
    installed.  It can be overridden by the
    :option:`--bindir <configure.py -b>` option.

``sip_inc_dir``
    is the name of the target directory where the ``sip.h`` file will be
    installed.  If this isn't specified then it defaults to the value of
    ``py_inc_dir``.  It can be overridden by the
    :option:`--incdir <configure.py -e>` option.

``sip_module_dir``
    is the target directory where the SIP module will be installed.  It can be
    overridden by the :option:`--destdir <configure.py -d>` option.

``sip_sip_dir``
    is the name of the target directory where generated ``.sip`` files will be
    installed by default.  It is only used when creating the :mod:`sipconfig`
    module.  It can be overridden by the :option:`--sipdir <configure.py -v>`
    option.
