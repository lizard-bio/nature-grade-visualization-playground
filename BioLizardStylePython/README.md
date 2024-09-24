# BioLizardStylePython

Enhance plots with the signature Biolizard aesthetic for matplotlib and seaborn.

## Installation

### 1. Extra requirements
`BioLizardStylePython` relies on the colorspace package, which is not available on the Python Package Index (PyPI). However, it is hosted on GitHub and needs to be installed directly from there. To install the `colorspace` package, please run the following command in your terminal:
```
pip install git+https://github.com/retostauffer/python-colorspace.git
```
Once you've successfully installed `colorspace`, you can proceed with the installation and usage of `BioLizardStylePython`.

### 2. Package Installation

The BioLizardStylePython package is available on PyPI and can be easily installed using:
```
pip install BioLizardStylePython
```

### 3. Font package

The BioLizardStyleR package makes use of the signature BioLizard font 'Lato'. This font can be found on Google Fonts under an open font license.
The font has been packaged using the [Python Fonts module](https://pypi.org/project/fonts/) and should be installed automatically when installing BioLizardStylePython. See [font-lato](https://pypi.org/project/font-lato/) for more information.

## Usage

### 1. Styling Function: `lizard_style()`

This function applies a BioLizard aesthetic to your matplotlib or seaborn plots. The aim is to ensure that plots maintain a uniform look, irrespective of whether they were made in R or Python.

### 2. BioLizard Color Palettes

These are qualitative, sequential, and divergent color maps that can be applied to your plots. The palettes are designed using BioLizard's house colors, keeping perceptual uniformity and color-blind friendliness in mind. For more information, consult the help documentation specific to each function.

### 3. Finalizing and Exporting Plots: `finalise_lizardplot()`

This function adds a BioLizard footer beneath your graph and exports it to a specified format such as PNG or PDF. The footer includes the BioLizard logo at the bottom right corner and leaves room for source text.

## Contributing and Feedback

Contributions and feedback are very welcome and much appreciated. 

Issues can be reported [on github](https://github.com/lizard-bio/nature-grade-visualization-playground/issues).

