# BioLizardStylePython

Enhance plots with the signature Biolizard aesthetic for matplotlib and seaborn.

## install

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

### 3. Font Installation

The BioLizardStyleR package makes use of the signature BioLizard font 'Lato'. This font can be found on Google Fonts under an open font license.

If you don't have the Lato font locally installed, you can download and install it from GitHub.

1. **Download Fonts**: Download the two font files from the GitHub repository [Nature Grade Visualization Playground](https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main).
2. **Install Fonts**: Install the downloaded fonts on your system.
3. **Complete**: Once the installation is done, you're all set to use the font.

## usage

### 1. Styling Function: `lizard_style()`

This function applies a BioLizard aesthetic to your matplotlib or seaborn plots. The aim is to ensure that plots maintain a uniform look, irrespective of whether they were made in R or Python.

### 2. BioLizard Color Palettes

These are qualitative, sequential, and divergent color maps that can be applied to your plots. The palettes are designed using BioLizard's house colors, keeping perceptual uniformity and color-blind friendliness in mind. For more information, consult the help documentation specific to each function.

### 3. Finalizing and Exporting Plots: `finalise_lizardplot()`

This function adds a BioLizard footer beneath your graph and exports it to a specified format such as PNG or PDF. The footer includes the BioLizard logo at the bottom right corner and leaves room for source text.

## Contributing and Feedback

Contributions and feedback are very welcome and much appreciated. 

Issues can be reported [on github](https://github.com/lizard-bio/nature-grade-visualization-playground/issues).

