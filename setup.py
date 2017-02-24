import os
import sys
import platform

from setuptools import setup, find_packages

import util

if os.name != "nt":
    print("""
\nThe binaries distributed with this version are Windows only,
- If you are on linux, look at
github.com/pyqt/python-qt5/wiki/Compiling-PyQt5-on-Ubuntu-12.04.
- If you are on OS X, look at the OSX specific port:
github.com/pyqt/python-qt5-mavericks
""")

    sys.exit()

if "64bit" not in platform.architecture():
    print("""
\nThe binaries distributed wtih this version are for the
64-bit version of Python only.
""")

    sys.exit()

def get_version():
    repo_dir = os.path.dirname(__file__)
    sys.path.insert(0, repo_dir)
    import PyQt5
    return PyQt5.__version__


def get_package_data():
    """Include all files from all sub-directories"""
    package_data = dict()

    package_data['PyQt5'] = list()
    for subdir in ("doc/", "examples/", "include/",
                   "mkspecs/", "plugins/", "qml/",
                   "qsci/", "sip/", "translations/", "uic/"):
        abspath = os.path.abspath("PyQt5/" + subdir)
        for root, dirs, files in os.walk(abspath):
            for f in files:
                fpath = os.path.join(root, f)
                relpath = os.path.relpath(fpath, abspath)
                relpath = relpath.replace("\\", "/")
                package_data['PyQt5'].append(subdir + relpath)

    package_data['PyQt5'].extend(["*.exe",
                                  "*.dll",
                                  "*.pyd",
                                  "*.conf",
                                  "*.api",
                                  "*.qm",
                                  "*.bat"])
    return package_data


def get_data_files():
    return [('', ['qt.conf'])]


def get_readme():
    with open('README.txt') as f:
        readme = f.read()
    return readme


classifiers = [
    'Development Status :: 4 - Beta',
    'Intended Audience :: Developers',
    'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
    'Programming Language :: Python',
    'Programming Language :: Python :: 2',
    'Programming Language :: Python :: 2.7',
    'Topic :: Software Development :: Libraries :: Python Modules',
    'Topic :: Utilities'
]


setup(
    name='python-qt5',
    version=get_version(),
    description='PyQt5',
    long_description=get_readme(),
    author='Marcus Ottosson',
    author_email='marcus@abstractfactory.com',
    url='https://github.com/pyqt/python-qt5',
    license='GPLv3',
    packages=find_packages(),
    zip_safe=False,
    classifiers=classifiers,
    package_data=get_package_data(),
    data_files=get_data_files()
)
