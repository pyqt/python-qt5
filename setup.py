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


setup(
    name='pypiqt5',  # To avoid name-clash with existing PyQt5
    version="5.3.2",
    description='quality assurance for content',
    long_description="pypiqt5",
    author='Marcus Ottosson',
    author_email='marcus@abstractfactory.com',
    url='https://github.com/pyqt/pyqt5',
    license='GPLv3',
    packages=find_packages(),
    zip_safe=False,
    classifiers=classifiers,
    package_data={},
)
