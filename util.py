import os
import sys


def createqtconf():
    """Create a qt.conf file next to the current executable"""

    template = """[Paths]
Prefix = {path}
Binaries = {path}
"""

    import PyQt5

    exedir = os.path.dirname(sys.executable)
    qtpath = os.path.join(exedir, "qt.conf")
    pyqt5path = os.path.abspath(PyQt5.__file__)
    binpath = os.path.dirname(pyqt5path).replace("\\", "/")

    try:
        with open(qtpath, "w") as f:
            f.write(template.format(path=binpath))
    except:
        pass
