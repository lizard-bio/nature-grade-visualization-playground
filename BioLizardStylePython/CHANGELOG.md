# Changelog

<!--next-version-placeholder-->

## v2.0.1
big fixes issue [#34](https://github.com/lizard-bio/nature-grade-visualization-playground/issues/34) and [#33](https://github.com/lizard-bio/nature-grade-visualization-playground/issues/33)

### Fix

- remove matplotlib cache clearing at __init__.py, issue [#34](https://github.com/lizard-bio/nature-grade-visualization-playground/issues/34)
- always use lato from lato-font package, instead of searcing for local lato installation 
- Add seaborn as a dependency and define optional dev dependencies issue [#33](https://github.com/lizard-bio/nature-grade-visualization-playground/issues/33)

## v2.0.0 (2025-03-06)

Plotly layout and improved color scales.

### Breaking changes

- Make sure all discrete colorscales and all continuous colorscales behave the same way, i.e. calling a discrete palette returns a `matplotlib.colors.ListedColormap` object, and all continuous palettes now return a `matplotlib.colors.LinearSegmentedColormap` object. issue #23 

### Feature

- new palettes:
    - viridis-like continuous colorscale "l_viridis"
    - colorscale for paired discrete data
    - hues colorscale for discrete data with many levels
- plotly template for interactive graphs with plotly express and plotly graph objects, issue #6 

### Fix

- adjust discrete palette to avoid dark colors that are hard to distinguish from each other + extend to 10 colors, issue #15
- Make sure all discrete colorscales and all continuous colorscales behave the same way, i.e. calling a discrete palette returns a `matplotlib.colors.ListedColormap` object, and all continuous palettes now return a `matplotlib.colors.LinearSegmentedColormap` object. issue #23 

### Tests

- added + adjusted tests for new color scales

### Documentation

- added plotly docs
- added extra info about the colorscales and how to intereact with them
- restructure examples notebook: separate sections for seaborn and matplotlib
- added colorspace package to dependencies instead of manual installation through git, issue #26 


## v.1.0.0 (2024-09-25)

First production release

### Documentation

- Update documentation with updated color scales from release 0.2.0

## v0.2.0 (2024-04-10)

### Feature

- Switched from Nunito to Lato font
- Automated clearing of matplotlib cache upon loading the module
- Added infromative error messages in case colorspace or lato are not installed


### Fix

- fix bug in discrete qualitative fill scale
- update default lizard_style colorscale to show colors in the same ortder as discrete palette


### Tests

- Added new tests to all package modules

### Documentation

- Added readme and usage examples

## v0.1.0 (2023-09-08)

- First release of `BioLizardStylePython`