# Nature-Grade Visualization 

## Introduction

_Liz.inno.3_

Data visualization is an important aspect the work we do at BioLizard. To ensure that we follow best practices as much as possible, we initiated the "nature-grade visualization" innovation project. One of the goals of this project to develop R and Python packages to add a consistent visual style to our figures. Some prime candidates are [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html), [matplotlib](https://matplotlib.org/), and [seaborn](https://seaborn.pydata.org/)). This repository acts as a "pre-production" playground to work on this development.

For a list of guidelines and best practices that everyone within BioLizard should adhere to, please refer to [this](https://www.notion.so/biolizard/Data-visualization-best-practices-a5a056f107584951af6e6dc8befe1d66?pvs=4) Notion document. Turn to [this](https://www.notion.so/3c8b944dcc974b3791f9fee398a6d346?pvs=21) one for a more in depth discussion about some of the data visualization do’s and don’ts.

## Packages in This Repository

This repository contains two key packages:

1. [BioLizardStyleR](https://lizard-bio.github.io/nature-grade-visualization-playground/BioLizardStyleR/) - An R package designed for ggplot2.
2. [BioLizardStylePython](https://lizard-bio.github.io/nature-grade-visualization-playground/BioLizardStylePython/) - A Python package designed for matplotlib, also compatible with seaborn.

Developed by Robbe Neirynck during an internship at BioLizard, under the supervision of Alexander Koch.
Development was continued by Anikó Meijer.

## Installation

### Installing BioLizardStyleR

```{r}
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

devtools::install_github("lizard-bio/nature-grade-visualization-playground", subdir="BioLizardStyleR", build_vignettes = TRUE)

```

### Installing BioLizardStylePython

#### 1. Extra requirements

`BioLizardStylePython` relies on the colorspace package, which is not available on the Python Package Index (PyPI). However, it is hosted on GitHub and needs to be installed directly from there. To install the `colorspace` package, please run the following command in your terminal:
```
pip install git+https://github.com/retostauffer/python-colorspace.git
```
Once you've successfully installed `colorspace`, you can proceed with the installation and usage of `BioLizardStylePython`.

#### 2. Package Installation

The BioLizardStylePython package is available on PyPI and can be easily installed using:
```
pip install BioLizardStylePython
```

## Documentation

A detailed description of the functionalities in each package can be found on these help pages:

1. R: https://lizard-bio.github.io/nature-grade-visualization-playground/BioLizardStyleR/
2. Python: https://lizard-bio.github.io/nature-grade-visualization-playground/BioLizardStylePython/

## Quick start

For installation details, usage examples, and example workflows, please refer to the the [help pages](https://lizard-bio.github.io/nature-grade-visualization-playground/). Most information below this point is general.
Both packages have three main components:

### 1. Styling Function: `lizard_style()`

This function applies a BioLizard aesthetic to your ggplot, matplotlib, or seaborn plots. The aim is to ensure that plots maintain a uniform look, irrespective of whether they were made in R or Python.

### 2. BioLizard Color Palettes

These are qualitative, sequential, and divergent color maps that can be applied to your plots. The palettes are designed using BioLizard's house colors, keeping perceptual uniformity and color-blind friendliness in mind. For more information, consult the help documentation specific to each function.

### 3. Finalizing and Exporting Plots: `finalise_lizardplot()`

This function adds a BioLizard footer beneath your graph and exports it to a specified format such as PNG or PDF. The footer includes the BioLizard logo at the bottom right corner and leaves room for source text.


## Contributing and Feedback

Contributions and feedback are very welcome and much appreciated. 

To report issues or provide feedback, you can:

- Open an issue on GitHub
- Contact us via the following channels:
  
  - **Project Supervisor**: [alexander.koch@lizard.bio](mailto:Alexander.koch@lizard.bio)
  - **Slack**: there is a (private) #nature-grade-visualisations channel. Let Alexander know if you'd like to be added!
