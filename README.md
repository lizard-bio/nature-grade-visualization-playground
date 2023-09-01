# Nature-Grade Visualization 

## Introduction

_Liz.inno.3_

Data visualization is an important aspect the work we do at BioLizard. To ensure that we follow best practices as much as possible, we initiated the "nature-grade visualization" innovation project. One of the goals of this project to develop R and Python packages to add a consistent visual style to our figures. Some prime candidates are [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html), [matplotlib](https://matplotlib.org/), and [seaborn](https://seaborn.pydata.org/)). This repository acts as a "pre-production" playground to work on this development.

For a list of guidelines and best practices that everyone within BioLizard should adhere to, please refer to [this](https://www.notion.so/biolizard/Data-visualization-best-practices-a5a056f107584951af6e6dc8befe1d66?pvs=4) Notion document. Turn to the [this](https://www.notion.so/3c8b944dcc974b3791f9fee398a6d346?pvs=21) one for a more in depth discussion about some of these data visualization do’s and don’ts.

## Packages in This Repository

This repository contains two key packages:

1. **BioLizardStyleR** - An R package designed for ggplot2.
2. **BioLizardStylePython** - A Python package designed for matplotlib, also compatible with seaborn.

Developed by Robbe Neirynck during an internship at BioLizard

## Installation and Usage

For **installation details**, usage examples, and example workflows, please refer to the **"In Action" files** specific to each package. Most information below this point is general, but the "In Action" files contain specialized guidance.

Both packages have three main components:

### 1. Styling Function: `lizard_style()`

This function applies a BioLizard aesthetic to your ggplot, matplotlib, or seaborn plots. The aim is to ensure that plots maintain a uniform look, irrespective of whether they were made in R or Python.

### 2. BioLizard Color Palettes

These are qualitative, sequential, and divergent color maps that can be applied to your plots. The palettes are designed using BioLizard's house colors, keeping perceptual uniformity and color-blind friendliness in mind. For more information, consult the help documentation specific to each function.

### 3. Finalizing and Exporting Plots: `finalise_lizardplot()`

This function adds a BioLizard footer beneath your graph and exports it to a specified format such as PNG or PDF. The footer includes the BioLizard logo at the bottom right corner and leaves room for source text.

## Required Fonts

Before using these packages, install the **NunitoSans** fonts from the `fontstoinstall` folder. NunitoSans is an open-license google-font that closely resembles BioLizard's house font, Avenir.

## Contributing and Feedback

Contributions and feedback are very welcome and much appreciated. 

For any kind of feedback or issues, please contact:
- Intern Contact: [robbe.neirynck@lizard.bio](mailto:robbe.neirynck@lizard.bio) *(Note: This email will probably no longer be active after the internship period)*
- Private Contact: [robbe.neirynck1@hotmail.com](mailto:robbe.neirynck1@hotmail.com)
- Project Supervisor: [Alexander.koch@lizard.bio](mailto:Alexander.koch@lizard.bio)




