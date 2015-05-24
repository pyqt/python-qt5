# This script handles the SIP configuration and generates the Makefiles.
#
# Copyright (c) 2014 Riverbank Computing Limited <info@riverbankcomputing.com>
#
# This file is part of SIP.
#
# This copy of SIP is licensed for use under the terms of the SIP License
# Agreement.  See the file LICENSE for more details.
#
# This copy of SIP may also used under the terms of the GNU General Public
# License v2 or v3 as published by the Free Software Foundation which can be
# found in the files LICENSE-GPL2 and LICENSE-GPL3 included in this package.
#
# SIP is supplied WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


import sys
import os
import glob
import optparse
from distutils import sysconfig

try:
    from importlib import invalidate_caches
except ImportError:
    invalidate_caches = lambda: None

import siputils


# Initialise the globals.
sip_version = 0x041005
sip_version_str = "4.16.5"
py_version = sys.hexversion >> 8
py_platform = sys.platform
plat_py_site_dir = None
plat_py_inc_dir = None
plat_py_conf_inc_dir = None
plat_py_lib_dir = None
plat_sip_dir = None
plat_bin_dir = None
platform_specs = []
sip_bin_dir = ''
sip_inc_dir = ''
sip_module_dir = ''
sip_sip_dir = ''
sysroot = ''
src_dir = os.path.dirname(os.path.abspath(__file__))
sip_module_base = None
build_platform = None

# Constants.
DEFAULT_MACOSX_ARCH = 'i386 ppc'
MACOSX_SDK_DIRS = ('/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs', '/Developer/SDKs')

# The names of build macros extracted from the platform specific configuration
# files.
build_macro_names = [
    "DEFINES", "CONFIG",
    "CC",
    "CFLAGS",
    "CFLAGS_RELEASE", "CFLAGS_DEBUG",
    "CFLAGS_CONSOLE", "CFLAGS_SHLIB", "CFLAGS_APP", "CFLAGS_THREAD",
    "CFLAGS_MT", "CFLAGS_MT_DBG", "CFLAGS_MT_DLL", "CFLAGS_MT_DLLDBG",
    "CFLAGS_EXCEPTIONS_ON", "CFLAGS_EXCEPTIONS_OFF",
    "CFLAGS_RTTI_ON", "CFLAGS_RTTI_OFF",
    "CFLAGS_STL_ON", "CFLAGS_STL_OFF",
    "CFLAGS_WARN_ON", "CFLAGS_WARN_OFF",
    "CHK_DIR_EXISTS", "COPY",
    "CXX",
    "CXXFLAGS",
    "CXXFLAGS_RELEASE", "CXXFLAGS_DEBUG",
    "CXXFLAGS_CONSOLE", "CXXFLAGS_SHLIB", "CXXFLAGS_APP", "CXXFLAGS_THREAD",
    "CXXFLAGS_MT", "CXXFLAGS_MT_DBG", "CXXFLAGS_MT_DLL", "CXXFLAGS_MT_DLLDBG",
    "CXXFLAGS_EXCEPTIONS_ON", "CXXFLAGS_EXCEPTIONS_OFF",
    "CXXFLAGS_RTTI_ON", "CXXFLAGS_RTTI_OFF",
    "CXXFLAGS_STL_ON", "CXXFLAGS_STL_OFF",
    "CXXFLAGS_WARN_ON", "CXXFLAGS_WARN_OFF",
    "DEL_FILE",
    "EXTENSION_SHLIB", "EXTENSION_PLUGIN",
    "INCDIR", "INCDIR_X11", "INCDIR_OPENGL",
    "LIBS_CORE", "LIBS_GUI", "LIBS_NETWORK", "LIBS_OPENGL", "LIBS_WEBKIT",
    "LINK", "LINK_SHLIB", "AIX_SHLIB", "LINK_SHLIB_CMD",
    "LFLAGS", "LFLAGS_CONSOLE", "LFLAGS_CONSOLE_DLL", "LFLAGS_DEBUG",
    "LFLAGS_DLL",
    "LFLAGS_PLUGIN", "LFLAGS_RELEASE", "LFLAGS_SHLIB", "LFLAGS_SONAME",
    "LFLAGS_THREAD", "LFLAGS_WINDOWS", "LFLAGS_WINDOWS_DLL", "LFLAGS_OPENGL",
    "LIBDIR", "LIBDIR_X11", "LIBDIR_OPENGL",
    "LIBS", "LIBS_CONSOLE", "LIBS_RT",
    "LIBS_RTMT", "LIBS_THREAD", "LIBS_WINDOWS", "LIBS_X11",
    "MAKEFILE_GENERATOR",
    "MKDIR",
    "RPATH", "LFLAGS_RPATH",
    "AR", "RANLIB", "LIB", "STRIP"
]


def show_platforms():
    """Display the different platform/compilers.
    """
    sys.stdout.write("""
The following platform/compiler configurations are supported:

""")

    platform_specs.sort()
    sys.stdout.write(siputils.format(", ".join(platform_specs), leftmargin=2))
    sys.stdout.write("\n\n")


def show_macros():
    """Display the different build macros.
    """
    sys.stdout.write("""
The following options may be used to adjust the compiler configuration:

""")

    build_macro_names.sort()
    sys.stdout.write(siputils.format(", ".join(build_macro_names), leftmargin=2))
    sys.stdout.write("\n\n")


def set_build_platform():
    """ Initialise the build platform. """

    global build_platform

    # Set the platform specific default specification.
    platdefaults = {
        "aix":          "aix-xlc",
        "bsd":          "bsdi-g++",
        "cygwin":       "cygwin-g++",
        "darwin":       "macx-g++",
        "dgux":         "dgux-g++",
        "freebsd":      "freebsd-g++",
        "gnu":          "hurd-g++",
        "hp-ux":        "hpux-acc",
        "irix":         "irix-cc",
        "linux":        "linux-g++",
        "lynxos":       "lynxos-g++",
        "netbsd":       "netbsd-g++",
        "openbsd":      "openbsd-g++",
        "openunix":     "unixware-cc",
        "osf1":         "tru64-cxx",
        "qnx":          "qnx-g++",
        "reliantunix":  "reliant-cds",
        "sco_sv":       "sco-cc",
        "sinix":        "reliant-cds",
        "sunos5":       "solaris-cc",
        "ultrix":       "ultrix-g++",
        "unix_sv":      "unixware-g++",
        "unixware":     "unixware-cc"
    }

    build_platform = "none"

    if py_platform == "win32":
        if py_version >= 0x030300:
            build_platform = "win32-msvc2010"
        elif py_version >= 0x020600:
            build_platform = "win32-msvc2008"
        elif py_version >= 0x020400:
            build_platform = "win32-msvc.net"
        else:
            build_platform = "win32-msvc"
    else:
        for pd in list(platdefaults.keys()):
            if py_platform[:len(pd)] == pd:
                build_platform = platdefaults[pd]
                break


def inform_user():
    """ Tell the user the option values that are going to be used. """

    if not opts.no_tools:
        siputils.inform("The SIP code generator will be installed in %s." % sip_bin_dir)

    siputils.inform("The %s module will be installed in %s." % (sip_module_base, sip_module_dir))

    if opts.static:
        siputils.inform("The %s module will be built as a static library." % sip_module_base)

    siputils.inform("The sip.h header file will be installed in %s." % sip_inc_dir)
    siputils.inform("The default directory to install .sip files in is %s." % sip_sip_dir)

    if opts.use_qmake is None:
        siputils.inform("The platform/compiler configuration is %s." % build_platform)

    if opts.arch:
        siputils.inform("MacOS/X binaries will be created for %s." % (", ".join(opts.arch.split())))

    if opts.universal:
        siputils.inform("MacOS/X universal binaries will be created using %s." % opts.universal)

    if opts.deployment_target:
        siputils.inform("MacOS/X deployment target is %s." % opts.deployment_target)


def set_platform_directories():
    """ Initialise the global variables relating to platform-specific
    directories.
    """
    global plat_py_site_dir, plat_py_inc_dir, plat_py_conf_inc_dir
    global plat_bin_dir, plat_py_lib_dir, plat_sip_dir

    # We trust distutils for some stuff.
    plat_py_site_dir = sysconfig.get_python_lib(plat_specific=1)
    plat_py_inc_dir = sysconfig.get_python_inc()
    plat_py_conf_inc_dir = os.path.dirname(sysconfig.get_config_h_filename())

    if sys.platform == "win32":
        plat_py_lib_dir = sys.prefix + "\\libs"
        plat_bin_dir = sys.exec_prefix
        plat_sip_dir = sys.prefix + "\\sip"
    else:
        lib_dir = sysconfig.get_python_lib(plat_specific=1, standard_lib=1)

        plat_py_lib_dir = lib_dir + "/config"
        plat_bin_dir = sys.exec_prefix + "/bin"
        plat_sip_dir = sys.prefix + "/share/sip"


def patch_files():
    """Patch any files that need it."""

    patched = (
        ("siplib", "sip.h"),
        ("siplib", "siplib.c"),
        ("siplib", "siplib.sbf")
    )

    # The siplib directory may not exist if we are building away from the
    # source directory.
    try:
        os.mkdir("siplib")
    except OSError:
        pass

    for f in patched:
        dst_fn = os.path.join(*f)
        src_fn = os.path.join(src_dir, dst_fn + ".in")

        siputils.inform("Creating %s..." % dst_fn)

        dst = open(dst_fn, "w")
        src = open(src_fn)

        for line in src:
            line = line.replace("@CFG_MODULE_NAME@", opts.sip_module)
            line = line.replace("@CFG_MODULE_BASENAME@", sip_module_base)

            dst.write(line)

        dst.close()
        src.close()


def create_config(module, template, macros):
    """Create the SIP configuration module so that it can be imported by build
    scripts.

    module is the module file name.
    template is the template file name.
    macros is the dictionary of build macros.
    """
    siputils.inform("Creating %s..." % module)

    content = {
        "sip_config_args":  sys.argv[1:],
        "sip_version":      sip_version,
        "sip_version_str":  sip_version_str,
        "platform":         build_platform,
        "sip_bin":          os.path.join(sip_bin_dir, "sip"),
        "sip_inc_dir":      sip_inc_dir,
        "sip_mod_dir":      sip_module_dir,
        "default_bin_dir":  plat_bin_dir,
        "default_mod_dir":  plat_py_site_dir,
        "default_sip_dir":  sip_sip_dir,
        "py_version":       py_version,
        "py_inc_dir":       plat_py_inc_dir,
        "py_conf_inc_dir":  plat_py_conf_inc_dir,
        "py_lib_dir":       plat_py_lib_dir,
        "universal":        opts.universal,
        "arch":             opts.arch,
        "deployment_target":    opts.deployment_target,
        "qt_framework":     0
    }

    siputils.create_config_module(module, template, content, macros)


def create_makefiles(macros):
    """Create the Makefiles.

    macros is the dictionary of platform specific build macros.
    """
    # Bootstrap.  Make sure we get the right one.
    sys.path.insert(0, os.path.curdir)
    invalidate_caches()
    import sipconfig

    cfg = sipconfig.Configuration()

    cfg.set_build_macros(macros)

    if opts.no_tools:
        subdirs = ["siplib"]
        installs = None
    else:
        subdirs = ["sipgen", "siplib"]
        installs = (["sipconfig.py", os.path.join(src_dir, "sipdistutils.py")],
                cfg.sip_mod_dir)

    if opts.use_qmake:
        sipconfig.inform("Creating top level .pro file...")

        pro = open("sip.pro", "w")

        pro.write("TEMPLATE = subdirs\n")
        pro.write("SUBDIRS = %s\n" % " ".join(subdirs))

        if installs is not None:
            files, path = installs
            pro.write("\n")
            pro.write("build_system.files = %s\n" % " ".join(files))
            pro.write("build_system.path = %s\n" % quote(path))
            pro.write("INSTALLS += build_system\n")

        pro.close()
    else:
        sipconfig.inform("Creating top level Makefile...")

        sipconfig.ParentMakefile(
            configuration=cfg,
            subdirs=subdirs,
            installs=installs
        ).generate()

    if opts.use_qmake:
        sipconfig.inform("Creating sip code generator .pro file...")

        pro = open(os.path.join("sipgen", "sipgen.pro"), "w")

        pro.write("TEMPLATE = app\n")
        pro.write("TARGET = sip\n")
        pro.write("CONFIG -= qt app_bundle\n")
        pro.write("CONFIG += warn_off exceptions_off console %s\n" % (
                ("debug" if opts.debug else "release")))

        pro.write("\n")
        pro.write("# Work around QTBUG-39300.\n")
        pro.write("CONFIG -= android_install\n")

        pro.write("\n")
        pro.write("target.path = %s\n" % os.path.dirname(cfg.sip_bin))
        pro.write("INSTALLS += target\n")

        c_sources = get_sources("sipgen", "*.c")
        pro.write("\n")
        pro.write("SOURCES = %s\n" % " ".join(c_sources))

        headers = get_sources("sipgen", "*.h")
        pro.write("\n")
        pro.write("HEADERS = %s\n" % " ".join(headers))

        pro.close()
    else:
        sipconfig.inform("Creating sip code generator Makefile...")

        sipconfig.ProgramMakefile(
            configuration=cfg,
            build_file=os.path.join(src_dir, "sipgen", "sipgen.sbf"),
            dir="sipgen",
            install_dir=os.path.dirname(cfg.sip_bin),
            console=1,
            warnings=0,
            universal=opts.universal,
            arch=opts.arch,
            deployment_target=opts.deployment_target
        ).generate()

    if opts.use_qmake:
        sipconfig.inform("Creating sip module .pro file...")

        pro = open(os.path.join("siplib", "siplib.pro"), "w")

        pro.write("TEMPLATE = lib\n")
        pro.write("TARGET = %s\n" % sip_module_base)
        pro.write("CONFIG -= qt\n")
        pro.write("CONFIG += warn_on exceptions_off %s %s\n" % (
                ("staticlib" if opts.static else "plugin"),
                ("debug" if opts.debug else "release")))

        pro.write("\n")
        pro.write("# Work around QTBUG-39300.\n")
        pro.write("CONFIG -= android_install\n")

        pro.write("\n")
        pro.write("INCLUDEPATH += %s\n" % cfg.py_inc_dir)
        if cfg.py_conf_inc_dir != cfg.py_inc_dir:
            pro.write("INCLUDEPATH += %s\n" % cfg.py_conf_inc_dir)

        if not opts.static:
            # These only need to be correct for Windows.
            debug_suffix = "_d" if opts.debug else ""
            link_lib_dir = quote("-L" + cfg.py_lib_dir)

            pro.write("""
win32 {
    PY_MODULE = %s%s.pyd
    target.files = %s%s.pyd
    LIBS += %s -lpython%d.%d
    QMAKE_POST_LINK = $(COPY_FILE) $(DESTDIR_TARGET) $$PY_MODULE
} else {
    PY_MODULE = %s.so
    target.files = %s.so
    QMAKE_POST_LINK = $(COPY_FILE) $(TARGET) $$PY_MODULE
}

macx {
    QMAKE_LFLAGS += "-undefined dynamic_lookup"
    QMAKE_LFLAGS += "-install_name $$absolute_path($$PY_MODULE, $$target.path)"
}
""" % (sip_module_base, debug_suffix,
       sip_module_base, debug_suffix,
       link_lib_dir, (py_version >> 16), ((py_version >> 8) & 0xff),
       sip_module_base,
       sip_module_base))

        pro.write("\n")
        pro.write("target.CONFIG = no_check_exist\n")
        pro.write("target.path = %s\n" % cfg.sip_mod_dir)
        pro.write("INSTALLS += target\n")

        pro.write("\n")
        pro.write("sip_h.files = sip.h\n")
        pro.write("sip_h.path = %s\n" % cfg.sip_inc_dir)
        pro.write("INSTALLS += sip_h\n")

        c_sources = get_sources("siplib", "*.c")
        cpp_sources = get_sources("siplib", "*.cpp")
        pro.write("\n")
        pro.write("SOURCES = %s\n" % " ".join(c_sources + cpp_sources))

        headers = get_sources("siplib", "*.h")
        pro.write("\n")
        pro.write("HEADERS = %s\n" % " ".join(headers))

        pro.close()
    else:
        sipconfig.inform("Creating sip module Makefile...")

        build_dir = os.getcwd()

        makefile = sipconfig.ModuleMakefile(
            configuration=cfg,
            build_file=os.path.join(build_dir, "siplib", "siplib.sbf"),
            dir="siplib",
            install_dir=cfg.sip_mod_dir,
            installs=([os.path.join(build_dir, "siplib", "sip.h")],
                    cfg.sip_inc_dir),
            console=1,
            warnings=0,
            static=opts.static,
            debug=opts.debug,
            universal=opts.universal,
            arch=opts.arch,
            deployment_target=opts.deployment_target
        )
        
        if src_dir != build_dir:
            src_siplib_dir = os.path.join(src_dir, "siplib")
            makefile.extra_include_dirs.append(src_siplib_dir)
            makefile.extra_source_dirs.append(src_siplib_dir)

        makefile.generate()


def get_sources(sources_dir, ext):
    """ Get the quoted files with the specified extension from a directory. """

    return [quote(f) for f in glob.glob(os.path.join(src_dir, sources_dir, ext))]


def quote(path):
    """ Return a path that is quoted if necessary. """

    if " " in path:
        path = '"' + path + '"'

    return path


# Look out for recursive definitions.
_extrapolating = []

def _get_configuration_value(config, name, default=None):
    """ Get a configuration value while extrapolating. """

    value = config.get(name)
    if value is None:
        if default is None:
            siputils.error("Configuration file references non-existent name '%s'." % name)

        return default

    parts = value.split('%(', 1)
    while len(parts) == 2:
        prefix, tail = parts

        parts = tail.split(')', 1)
        if len(parts) != 2:
            siputils.error("Configuration file contains unterminated extrapolated name '%s'." % tail)

        xtra_name, suffix = parts

        if xtra_name in _extrapolating:
            siputils.error("Configuration file contains a recursive reference to '%s'." % xtra_name)

        _extrapolating.append(xtra_name)
        xtra_value = _get_configuration_value(config, xtra_name)
        _extrapolating.pop()

        value = prefix + xtra_value + suffix

        parts = value.split('%(', 1)

    return value


def update_from_configuration_file(config_file):
    """ Update a number of globals from values read from a configuration file.
    """

    siputils.inform("Reading configuration from %s..." % config_file)

    config = {}

    # Read the file into the dict.
    cfg = open(config_file)
    line_nr = 0

    for l in cfg:
        line_nr += 1

        # Strip comments and blank lines.
        l = l.split('#')[0].strip()
        if l == '':
            continue

        parts = l.split('=', 1)
        if len(parts) == 2:
            name = parts[0].strip()
            value = parts[1].strip()
        else:
            name = value = ''

        if name == '' or value == '':
            siputils.error("%s:%d: Invalid line." % (config_file, line_nr))

        config[name] = value
        last_name = name

    cfg.close()

    # Enforce the presets.
    version = siputils.version_to_string(py_version).split('.')
    config['py_major'] = version[0]
    config['py_minor'] = version[1]
    config['sysroot'] = sysroot

    # Override the relevent values.
    global py_platform, plat_py_conf_inc_dir, plat_py_inc_dir, plat_py_lib_dir
    global sip_bin_dir, sip_inc_dir, sip_module_dir, sip_sip_dir

    py_platform = _get_configuration_value(config, 'py_platform', py_platform)
    plat_py_inc_dir = _get_configuration_value(config, 'py_inc_dir',
            plat_py_inc_dir)
    plat_py_lib_dir = _get_configuration_value(config, 'py_pylib_dir',
            plat_py_lib_dir)

    # The pyconfig.h directory defaults to the Python.h directory.
    plat_py_conf_inc_dir = _get_configuration_value(config, 'py_conf_inc_dir',
            plat_py_inc_dir)

    sip_bin_dir = _get_configuration_value(config, 'sip_bin_dir', sip_bin_dir)
    sip_module_dir = _get_configuration_value(config, 'sip_module_dir',
            sip_module_dir)

    # Note that this defaults to any 'py_inc_dir' specified in the
    # configuration file.
    sip_inc_dir = _get_configuration_value(config, 'sip_inc_dir',
            plat_py_inc_dir)

    # Note that this is only used when creating sipconfig.py.
    sip_sip_dir = _get_configuration_value(config, 'sip_sip_dir', sip_sip_dir)


def create_optparser(sdk_dir):
    """Create the parser for the command line.
    """
    def store_abspath(option, opt_str, value, parser):
        setattr(parser.values, option.dest, os.path.abspath(value))

    def store_abspath_dir(option, opt_str, value, parser):
        if not os.path.isdir(value):
            raise optparse.OptionValueError("'%s' is not a directory" % value)
        setattr(parser.values, option.dest, os.path.abspath(value))

    def store_abspath_file(option, opt_str, value, parser):
        if not os.path.isfile(value):
            raise optparse.OptionValueError("'%s' is not a file" % value)
        setattr(parser.values, option.dest, os.path.abspath(value))

    def store_version(option, opt_str, value, parser):
        version = version_from_string(value)
        if version is None:
            raise optparse.OptionValueError(
                    "'%s' is not a valid version number" % value)
        setattr(parser.values, option.dest, version)

    p = optparse.OptionParser(usage="python %prog [opts] [macro=value] "
            "[macro+=value]", version=sip_version_str)

    # Note: we don't use %default to be compatible with Python 2.3.
    p.add_option("-k", "--static", action="store_true", default=False,
            dest="static", help="build the SIP module as a static library")
    p.add_option("-p", "--platform", action="store", type="string",
            metavar="PLATFORM", dest="platform", help="the platform/compiler "
                    "configuration [default: %s]" % build_platform)
    p.add_option("-u", "--debug", action="store_true", default=False,
            help="build with debugging symbols")
    p.add_option("--sip-module", action="store", default="sip", type="string",
            metavar="NAME", dest="sip_module", help="the package.module name "
            "of the sip module [default: sip]")
    p.add_option("--configuration", dest='config_file', type='string',
            action='callback', callback=store_abspath_file, metavar="FILE",
            help="FILE contains the target configuration")
    p.add_option("--target-py-version", dest='target_py_version',
            type='string', action='callback', callback=store_version,
            metavar="VERSION",
            help="the major.minor version of the target Python [default: "
                    "%s]" % siputils.version_to_string(py_version, parts=2))
    p.add_option("--sysroot", dest='sysroot', type='string', action='callback',
            callback=store_abspath_dir, metavar="DIR",
            help="DIR is the target system root directory")
    p.add_option("--no-tools", action="store_true", default=False,
            dest="no_tools", help="disable the building of the code generator "
            "and the installation of the build system [default: enabled]")
    p.add_option("--use-qmake", action="store_true", default=False,
            dest="use_qmake", help="generate qmake .pro files instead of "
            "Makefiles")

    if sys.platform == 'darwin':
        # Get the latest SDK to use as the default.
        sdks = glob.glob(sdk_dir + '/MacOSX*.sdk')
        if len(sdks) > 0:
            sdks.sort()
            _, default_sdk = os.path.split(sdks[-1])
        else:
            default_sdk = 'MacOSX10.4u.sdk'

        g = optparse.OptionGroup(p, title="MacOS X Configuration")
        g.add_option("--arch", action="append", default=[], dest="arch",
                choices=["i386", "x86_64", "ppc"],
                help="build for architecture ARCH")
        g.add_option("--deployment-target", action="store", default='',
                metavar="VERSION", dest="deployment_target",
                help="set the value of the MACOSX_DEPLOYMENT_TARGET "
                        "environment variable in generated Makefiles")
        g.add_option("-n", "--universal", action="store_true", default=False,
                dest="universal",
                help="build the SIP code generator and module as universal "
                        "binaries")
        g.add_option("-s", "--sdk", action="store", default=default_sdk,
                type="string", metavar="SDK", dest="sdk",
                help="the name of the SDK used when building universal "
                        "binaries [default: %s]" % default_sdk)
        p.add_option_group(g)

    # Querying.
    g = optparse.OptionGroup(p, title="Query")
    g.add_option("--show-platforms", action="store_true", default=False,
            dest="show_platforms", help="show the list of supported "
            "platform/compiler configurations")
    g.add_option("--show-build-macros", action="store_true", default=False,
            dest="show_build_macros", help="show the list of supported build "
            "macros")
    p.add_option_group(g)

    # Installation.
    g = optparse.OptionGroup(p, title="Installation")
    g.add_option("-b", "--bindir", action="callback", type="string",
            metavar="DIR", dest="sipbindir", callback=store_abspath,
            help="where the SIP code generator will be installed [default: "
                    "%s]" % plat_bin_dir)
    g.add_option("-d", "--destdir", action="callback", type="string",
            metavar="DIR", dest="sipmoddir", callback=store_abspath,
            help="where the SIP module will be installed [default: "
                    "%s]" % plat_py_site_dir)
    g.add_option("-e", "--incdir", action="callback", type="string",
            metavar="DIR", dest="sipincdir", callback=store_abspath,
            help="where the SIP header file will be installed [default: "
                    "%s]" % plat_py_inc_dir)
    g.add_option("-v", "--sipdir", action="callback", type="string",
            metavar="DIR", dest="sipsipdir", callback=store_abspath,
            help="where .sip files are normally installed [default: "
                    "%s]" % plat_sip_dir)
    p.add_option_group(g)

    return p


def main(argv):
    """Create the configuration module module.

    argv is the list of command line arguments.
    """
    siputils.inform("This is SIP %s for Python %s on %s." % (sip_version_str, sys.version.split()[0], sys.platform))

    global py_version, build_platform

    if py_version < 0x020300:
        siputils.error("This version of SIP requires Python v2.3 or later.")

    # Basic initialisation.
    set_platform_directories()
    set_build_platform()

    # Build up the list of valid specs.
    for s in os.listdir(os.path.join(src_dir, "specs")):
        platform_specs.append(s)

    # Determine the directory containing the default OS/X SDK.
    if sys.platform == 'darwin':
        for sdk_dir in MACOSX_SDK_DIRS:
            if os.path.isdir(sdk_dir):
                break
        else:
            sdk_dir = MACOSX_SDK_DIRS[0]
    else:
        sdk_dir = ''

    # Parse the command line.
    global opts

    p = create_optparser(sdk_dir)
    opts, args = p.parse_args()

    # Override defaults that affect subsequent configuration.
    if opts.target_py_version is not None:
        py_version = opts.target_py_version

    if opts.sysroot is not None:
        global sysroot
        sysroot = opts.sysroot

    # Make sure MacOS specific options get initialised.
    if sys.platform != 'darwin':
        opts.universal = ''
        opts.arch = []
        opts.sdk = ''
        opts.deployment_target = ''

    # Handle the query options.
    if opts.show_platforms or opts.show_build_macros:
        if opts.show_platforms:
            show_platforms()

        if opts.show_build_macros:
            show_macros()

        sys.exit()

    # Convert the list 'arch' option to a string.  Multiple architectures
    # imply a universal binary.
    if len(opts.arch) > 1:
        opts.universal = True

    opts.arch = ' '.join(opts.arch)

    # Convert the boolean 'universal' option to a string.
    if opts.universal:
        if '/' in opts.sdk:
            opts.universal = os.path.abspath(opts.sdk)
        else:
            opts.universal = sdk_dir + '/' + opts.sdk

        if not os.path.isdir(opts.universal):
            siputils.error("Unable to find the SDK directory %s. Use the --sdk flag to specify the name of the SDK or its full path." % opts.universal)

        if opts.arch == '':
            opts.arch = DEFAULT_MACOSX_ARCH
    else:
        opts.universal = ''

    # Apply the overrides from any configuration file.
    global plat_bin_dir, plat_py_conf_inc_dir, plat_py_inc_dir
    global plat_py_lib_dir, plat_py_site_dir, plat_sip_dir
    global sip_bin_dir, sip_inc_dir, sip_module_dir, sip_sip_dir

    # Set defaults.
    sip_bin_dir = plat_bin_dir
    sip_inc_dir = plat_py_inc_dir
    sip_module_dir = plat_py_site_dir
    sip_sip_dir = plat_sip_dir

    if opts.config_file is not None:
        update_from_configuration_file(opts.config_file)
    elif sysroot != '':
        def apply_sysroot(d):
            if d.startswith(sys.prefix):
                d = sysroot + d[len(sys.prefix):]

            return d

        plat_bin_dir = apply_sysroot(plat_bin_dir)
        plat_py_conf_inc_dir = apply_sysroot(plat_py_conf_inc_dir)
        plat_py_inc_dir = apply_sysroot(plat_py_inc_dir)
        plat_py_lib_dir = apply_sysroot(plat_py_lib_dir)
        plat_py_site_dir = apply_sysroot(plat_py_site_dir)
        plat_sip_dir = apply_sysroot(plat_sip_dir)

        sip_bin_dir = apply_sysroot(sip_bin_dir)
        sip_inc_dir = apply_sysroot(sip_inc_dir)
        sip_module_dir = apply_sysroot(sip_module_dir)
        sip_sip_dir = apply_sysroot(sip_sip_dir)

    # Override from the command line.
    if opts.platform is not None:
        build_platform = opts.platform

    if opts.sipbindir is not None:
        sip_bin_dir = opts.sipbindir

    if opts.sipincdir is not None:
        sip_inc_dir = opts.sipincdir

    if opts.sipmoddir is not None:
        sip_module_dir = opts.sipmoddir

    if opts.sipsipdir is not None:
        sip_sip_dir = opts.sipsipdir

    # Get the platform specific macros for building.
    macros = siputils.parse_build_macros(
            os.path.join(src_dir, "specs", build_platform), build_macro_names,
            args)

    if macros is None:
        siputils.error("Unsupported macro name specified. Use the --show-build-macros flag to see a list of supported macros.")
        sys.exit(2)

    # Fix the name of the sip module.
    global sip_module_base

    module_path = opts.sip_module.split(".")
    sip_module_base = module_path[-1]

    if len(module_path) > 1:
        del module_path[-1]
        module_path.insert(0, sip_module_dir)
        sip_module_dir = os.path.join(*module_path)

    # Tell the user what's been found.
    inform_user()

    # Patch any files that need it.
    patch_files()

    # Install the configuration module.
    create_config("sipconfig.py", os.path.join(src_dir, "siputils.py"),
            macros)

    # Create the Makefiles.
    create_makefiles(macros)


###############################################################################
# The script starts here.
###############################################################################

if __name__ == "__main__":
    try:
        main(sys.argv)
    except SystemExit:
        raise
    except:
        sys.stderr.write(
"""An internal error occured.  Please report all the output from the program,
including the following traceback, to support@riverbankcomputing.com.
""")
        raise
