# Copyright (c) 2014 Riverbank Computing Limited <info@riverbankcomputing.com>
#
# This file is part of PyQt5.
#
# This file may be used under the terms of the GNU General Public License
# version 3.0 as published by the Free Software Foundation and appearing in
# the file LICENSE included in the packaging of this file.  Please review the
# following information to ensure the GNU General Public License version 3.0
# requirements will be met: http://www.gnu.org/copyleft/gpl.html.
#
# If you do not wish to use this file under the terms of the GPL version 3.0
# then you may purchase a commercial license.  For more information contact
# info@riverbankcomputing.com.
#
# This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
# WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

import os
import sys

# Add sip to PYTHONPATH and executables to PATH
dirname = os.path.dirname(__file__)
sys.path.insert(0, dirname)
os.environ["PATH"] += os.pathsep + dirname

# Expose versions
version_info = (0, 3, 0)  # Version of this release
version = "%s.%s.%s" % version_info
__version__ = version

pyqt_version_info = (5, 7, 1)
pyqt_version = "%s.%s.%s" % pyqt_version_info
__pyqt_version__ = pyqt_version

qt_version_info = (5, 7, 1)
qt_version = "%s.%s.%s" % qt_version_info
__qt_version__ = qt_version
