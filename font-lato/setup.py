#!/usr/bin/env python

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

classifiers = ['Development Status :: 5 - Production/Stable',
               'Operating System :: POSIX :: Linux',
               'License :: OSI Approved :: SIL Open Font License 1.1 (OFL-1.1)',
               'Intended Audience :: Developers',
               'Programming Language :: Python :: 2.6',
               'Programming Language :: Python :: 2.7',
               'Programming Language :: Python :: 3',
               'Topic :: Software Development',
               'Topic :: Text Processing :: Fonts']

setup(
    name            = 'font-lato',
    version         = '0.1.0',
    author          = 'Aniko Meijer',
    author_email    = 'aniko.meijer@lizard.bio',
    description     = 'Lato font repackaged for the Python Fonts module',
    long_description= open('README.rst').read() + '\n' + open('CHANGELOG.txt').read(),
    license         = 'MIT',
    keywords        = 'Lato Font',
    url             = 'https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main',
    classifiers     = classifiers,
    py_modules      = [],
    packages        = ['font_lato'],
    package_data    = {'font_lato': ['font_lato/files']},
    entry_points    = {
        'fonts_ttf': [
            'lato = font_lato:font_files'
        ]
    },
    zip_safe        = False,
    include_package_data = True
)