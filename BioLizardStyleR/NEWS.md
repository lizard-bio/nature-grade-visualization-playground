<!---
# placeholder next version

## Breaking changes

## New features

## Bug fixes
-->

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
