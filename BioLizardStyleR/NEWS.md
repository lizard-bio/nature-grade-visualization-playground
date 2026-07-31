<!---
# placeholder next version

## Breaking changes

## New features

## Bug fixes
-->

# BioLizardStyleR 3.1.1

## Fixes

- Use pak instead of devtools in vignette
- Updated documentation
- Updated description + version bump

# BioLizardStyleR 3.1.0

## New features

- Increased font size for text elements on ggplot2
- css style sheet in separate file instead of code chunk in the vignette
- add BioLizard logo to Rmarkdown html output

# BioLizardStyleR 3.0.0

## Breaking changes

- BioLizardStyleR now is adapted to the new house style of BioLizard, including the
BioLizard colors and fonts.


# BioLizardStyleR 2.0.1

- Fix bug where y axis text is angled faulty when using set_theme(lizard_style())
- Explicitly make lizard_style() inherit from ggplot2's default style theme_grey() to avoid differences in behavior based in default that was set by user. 

# BioLizardStyleR 2.0.0

fix installation bugs, improved color scales, and add plotly functionality.

## New features

- `lizard_layout()` function for styling in plotly, issue #7 
-  new palettes:
    - viridis-like continuous colorscale "l_viridis"
    - colorscale for paired discrete data
    - hues colorscale for discrete data with many levels

## Bug fixes

- adjust discrete palette to avoid dark colors that are hard to distinguish from each other + extend to 10 colors, issue #15
- adapt vignette with optional chunks to avoid package installation issues and change vignette installation to FALSE (=default) in README, issue #20
- on MacOS the ttf fonts are copied from inst/fonts to ~library/fonts to automatically install Lato, issue #21

## Other notes

- main version number brought up to "2" for consistency with the BioLizardStylePython package.


# BioLizardStyleR 0.1.0

First release
