import os
from setuptools import setup, find_packages

classifiers = [
    'Intended Audience :: Developers',
    'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
    'Programming Language :: Python',
    'Programming Language :: Python :: 2',
    'Programming Language :: Python :: 2.7',
    'Topic :: Software Development :: Libraries :: Python Modules',
    'Topic :: Utilities'
]


package_data = dict()

package_data['PyQt5'] = list()
for subdir in ("plugins/", "qml/", "uic/"):
    abspath = os.path.abspath("PyQt5/" + subdir)
    for root, dirs, files in os.walk(abspath):
        for f in files:
            fpath = os.path.join(root, f)
            relpath = os.path.relpath(fpath, abspath)
            relpath = relpath.replace("\\", "/")
            package_data['PyQt5'].append(subdir + relpath)

package_data['PyQt5'].extend(["*.exe", "*.dll", "*.pyd"])

setup(
    name='pypiqt5',  # To avoid name-clash with existing PyQt5
    version="0.1.1",
    description='PyQt5',
    long_description="pypiqt5",
    author='Marcus Ottosson',
    author_email='marcus@abstractfactory.com',
    url='https://github.com/pyqt/pyqt5',
    license='GPLv3',
    packages=find_packages(),
    zip_safe=False,
    classifiers=classifiers,
    package_data=package_data
)
