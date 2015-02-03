### PyQt5 - distributed via PyPI

[![Build Status][travis]][travis_repo]
[![PyPI version][pypi]][pypi_repo]

### Preface

The goal of this project is to supply PyQt via PyPI, and that's what it does, but currently only for:

- Python 2.7 x64
- Windows 7+
- PyQt5 5.3.2 compiled using Qt 5.3.1. 

If you require alternative versions, [contact me][mail] or submit an issue and we'll talk about it.

> Note that these packages are not provided by Riverbank Computing Limited. Please do not contact them if you require help with them.

> Also note that this build is **64-bit** and thus requires a 64-bit build of Python. You are probably already running one.

### Installation

First, make sure you have the Visual Studio C++ 2013 redistributable, available [here][redist]. Then go ahead and install it, like this:

```bash
# To install
$ pip install python-qt5
```

**Testing out the installation**

1. Launch Python
2. Type this in

  ```python
>>> import sys
>>> from PyQt5 import QtWidgets
>>> app = QtWidgets.QApplication(sys.argv)
>>> button = QtWidgets.QPushButton("Hello")
>>> button.show()
```

### FAQ

> ImportError: DLL load failed: The specified module could not be found.

This may be due to the Visual Studio C++ 2013 redistributable not being installed. Make sure you install this, and then restart Python.

[travis]: https://travis-ci.org/pyqt/python-qt5.svg?branch=master
[travis_repo]: https://travis-ci.org/pyqt/python-qt5
[pypi]: https://badge.fury.io/py/python-qt5.svg
[pypi_repo]: http://badge.fury.io/py/python-qt5
[redist]: http://www.microsoft.com/en-us/download/details.aspx?id=40784
[mail]: mailto:marcus@abstractfactory.io
