### PyQt5 for Windows and 64-bit Python 2.7

[![Build status](https://ci.appveyor.com/api/projects/status/wfp7ximk4janf9yj?svg=true)](https://ci.appveyor.com/project/mottosso/python-qt5) [![PyPI version][pypi]][pypi_repo]

<br>
<br>
<br>

#### A) Install with pip and git

With this approach, you get version 5.7.1

```bash
$ pip install git+git://github.com/pyqt/python-qt5.git
```

#### B) Or install with just pip

With this approach, you only get 5.3 due to [space restrictions on PyPI](https://github.com/pyqt/python-qt5/issues/7).

```bash
$ pip install python-qt5
```

#### C) Or install with just git

- [See wiki](https://github.com/pyqt/python-qt5/wiki/Installation).

<br>
<br>
<br>

### Testing out the installation

1. Launch Python
2. Type this in

  ```python
>>> import sys
>>> from PyQt5 import QtWidgets
>>> app = QtWidgets.QApplication(sys.argv)
>>> button = QtWidgets.QPushButton("Hello")
>>> button.setFixedSize(400, 400)
>>> button.show()
>>> app.exec_()
```

- More information in the [Wiki](https://github.com/pyqt/python-qt5/wiki)

[travis]: https://travis-ci.org/pyqt/python-qt5.svg?branch=master
[travis_repo]: https://travis-ci.org/pyqt/python-qt5
[pypi]: https://badge.fury.io/py/python-qt5.svg
[pypi_repo]: http://badge.fury.io/py/python-qt5
[redist]: http://www.microsoft.com/en-us/download/details.aspx?id=40784
[mail]: mailto:marcus@abstractfactory.io
