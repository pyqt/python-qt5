### PyQt5 - distributed via PyPI

[![Build Status][travis]][travis_repo]
[![PyPI version][pypi]][pypi_repo]

### Installation - 5.3

```bash
$ pip install python-qt5
```

You'll also need the Visual C++ Redistributable.
- http://www.microsoft.com/en-us/download/details.aspx?id=40784

### Installation - 5.4

The 5.4 installation is different due to some trouble getting it up onto PyPI, this is what you can do in the meantime.

```bash
$ pip install git+https://github.com/pyqt/python-qt5.git
```

You won't need the Redistributable here; as it is included.

**Testing out the installation**

1. Launch Python
2. Type this in

  ```python
>>> import sys
>>> from PyQt5 import QtWidgets
>>> app = QtWidgets.QApplication(sys.argv)
>>> button = QtWidgets.QPushButton("Hello")
>>> button.setFixedSize(400, 400)
>>> button.show()
```

- More information in the [Wiki](https://github.com/pyqt/python-qt5/wiki)

[travis]: https://travis-ci.org/pyqt/python-qt5.svg?branch=master
[travis_repo]: https://travis-ci.org/pyqt/python-qt5
[pypi]: https://badge.fury.io/py/python-qt5.svg
[pypi_repo]: http://badge.fury.io/py/python-qt5
[redist]: http://www.microsoft.com/en-us/download/details.aspx?id=40784
[mail]: mailto:marcus@abstractfactory.io
