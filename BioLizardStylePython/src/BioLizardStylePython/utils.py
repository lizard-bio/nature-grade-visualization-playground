import os
import io
# import numpy as np
from PIL import Image
from pathlib import Path
import matplotlib.pyplot as plt
import matplotlib.colors
from matplotlib import font_manager
import colorspace

# the three basic colors
blz_green = "#01a086"
blz_blue = "#1e2237"
blz_yellow = "#e9b940"


def lizard_style():
    """
    Load and apply the lizard_style for matplotlib plots.

    Parameters:
    -----------
    font_name : str, optional
        The name of the font to be used for the plots. By default, it uses 'Lato'.
        If you want to use your own local installation of Lato or any other font,
        specify the font name using this parameter. For more details on how to use
        the font_name parameter, refer to the 'In_Action' file on GitHub.

    Example:
    --------
    #>>> lizard_style()

    Notes:
    ------
    Ensure that the specified font is installed on your system and is recognized by matplotlib.

    """
    style_path = os.path.join(os.path.dirname(__file__), 'lizard_style.mplstyle')
    plt.style.use(style_path)
    from BioLizardStylePython import lato_localname
    plt.rcParams['font.sans-serif'] = [lato_localname]


def biolizard_qualitative_pal():
    """
    Generate a qualitative colormap for matplotlib.

    Specifically designed to be inclusive, it is suitable for individuals with the most
    common form of color blindness: Deuteranopia (Red-Green Color Blindness).

    Returns:
        matplotlib.colors.ListedColormap: A colormap object suitable for use with matplotlib plots.

    Example:
        #>>> bar_colors = [biolizard_qualitative_pal(i) for i in range(len(categories))]
        #>>> bars = plt.bar(categories, values, color=bar_colors)
        #>>> plt.show()
    """
    return matplotlib.colors.ListedColormap([
        "#01a086", "#1e2237", "#e9b940","#105144",
        "#6CC7B7", "#233E60", "#666666", "#D6D6D6"
    ])

def biolizard_qualitative_pal_r():
    """
    Generate a qualitative colormap for matplotlib. Colors are reversed compared to biolizard_qualitative_pal.

    Specifically designed to be inclusive, it is suitable for individuals with the most
    common form of color blindness: Deuteranopia (Red-Green Color Blindness).

    Returns:
        matplotlib.colors.ListedColormap: A colormap object suitable for use with matplotlib plots.

    Example:
        #>>> bar_colors = [biolizard_qualitative_pal(i) for i in range(len(categories))]
        #>>> bars = plt.bar(categories, values, color=bar_colors)
        #>>> plt.show()
    """
    cmap = matplotlib.colors.ListedColormap([
        "#01a086", "#1e2237", "#e9b940","#105144",
        "#6CC7B7", "#233E60", "#666666", "#D6D6D6"
    ])

    return cmap.reversed()

#Sequential and divergent color map
#These two color maps will be registered as 'biolizard_<sequential/divergent>_pal' when installing the package.

#Internal function
def _create_and_register_colormap(palette, name, reverse=False):
    """
    Create and register a colormap with matplotlib.

    This function generates a colormap from a given palette and registers it with
    matplotlib under the specified name.

    Parameters:
    - palette (function): A function that returns a list of colors.
    - name (str): The name under which the colormap will be registered with matplotlib.

    Example:
    #>>> biolizard_sequential_pal = colorspace.sequential_hcl(h=170, c=[40,0,75], l=[35,90], power=1)
    #>>> create_and_register_colormap(biolizard_sequential_pal, "biolizard_sequential_pal")
    """
    colors = palette(256)
    rgbcolors = [matplotlib.colors.to_rgb(color) for color in colors]
    cmap = matplotlib.colors.LinearSegmentedColormap.from_list(name, rgbcolors)
    if reverse:
        cmap = cmap.reversed()
    matplotlib.colormaps.register(name=name, cmap=cmap)


# Sequential Biolizard Color Map
#
# This colormap applies the sequential Biolizard palette.
#
# Details:
# The sequential palette represents underlying values using a consistent sequence of increasing luminance.
# The hue is derived from the Biolizard green. The palette utilizes gradients within the HCL-spectrum for perceptual uniformity.
# The chroma follows a triangular progression to help differentiate the middle range values from the extreme values.
biolizard_sequential_pal = colorspace.sequential_hcl(h=170, c=[0,75,40], l=[90,35], power=1)
_create_and_register_colormap(biolizard_sequential_pal, "biolizard_sequential_pal")
_create_and_register_colormap(biolizard_sequential_pal, "biolizard_sequential_pal_r", reverse=True)


# Divergent Biolizard Color Map
#
# This colormap applies the divergent Biolizard palette for scenarios where color corresponds to categories with a natural midpoint.
#
# Details:
# This divergent palette codes underlying numeric values by a triangular luminance sequence with different hues
# in the left and in the right "arms" of the palette. Specifically:
# (a) a single hue is used for each arm of the palette,
# (b) chroma and luminance trajectory are balanced between the two arms,
# (c) the neutral central value has zero chroma.
# The palette is crafted using hue 291 and hue 170, which is the distinctive biolizard green.
# This unique hue pairing produces a palette that remains accessible for all major forms of color blindness.
biolizard_divergent_pal = colorspace.diverging_hcl(h=[60, 170], c=80, l=[50, 95], power=1)
_create_and_register_colormap(biolizard_divergent_pal, "biolizard_divergent_pal")
_create_and_register_colormap(biolizard_divergent_pal, "biolizard_divergent_pal_r", reverse=True)


def finalise_lizardplot(plot, source_text, fontsize=12, pdf=False, output_name="TempLizardPlot", save_filepath=None):
    """
   Finalise and save a plot with custom adjustments and a source text.

   This function takes a provided plot, adjusts its layout, and appends a footer
   at the bottom containing a source text and a logo. The combined image is then saved
   either as a PNG or a PDF.

   Parameters:
   - plot (matplotlib.figure.Figure): The input plot to be finalized.
   - source_text (str): The source text to be displayed at the bottom of the plot.
   - fontsize (int, optional): Font size of the source text. Defaults to 12.
   - pdf (bool, optional): If True, saves the output as a PDF. Otherwise, saves as a PNG. Defaults to False.
   - output_name (str, optional): Name of the output file (without extension). Defaults to "TempLizardPlot".
   - save_filepath (str, optional): Full path to save the output (with extension). If specified, it takes precedence over output_name.

   Returns:
   None. The combined image is saved to the specified location or the current working directory.

   Example:
   #>>> fig, ax = plt.subplots()
   #>>> ax.plot([0, 1], [0, 1])
   #>>> finalise_lizardplot(fig, "Source: BioLizard Data", pdf=True)
   """
    # Adjust the provided plot
    plot.subplots_adjust(left=0.11, bottom=0.13, right=0.95)

    # Save the adjusted plot to a temporary buffer
    buf = io.BytesIO()
    dpi = 300  # Increased DPI for higher resolution
    plot.savefig(buf, format='png', pad_inches=0.1, dpi=dpi)
    buf.seek(0)
    img2 = Image.open(buf)

    # Get the width of the saved plot in pixels
    swarmplot_width, _ = img2.size

    # Adjust the width and height of the custom figure to match the width of the plot in pixels
    custom_fig_width_inches = swarmplot_width / dpi
    custom_fig_height_inches = 0.4  # Reduced height

    fig1 = plt.figure(figsize=(custom_fig_width_inches, custom_fig_height_inches))
    ax = fig1.add_axes([0, 0, 1, 1])
    ax.plot([0, 1], [1, 1], color='black', linewidth=1.5, transform=ax.transAxes)

    font_name = plt.rcParams['font.sans-serif'][0]

    ax.text(0.05, 0.5, source_text, verticalalignment='center', transform=ax.transAxes, fontsize=fontsize,
            fontname=font_name)

    ax_image = fig1.add_axes([0.90, -0.09, 0.10, 1], anchor='NE', zorder=-1)

    # Get the directory of the current script
    current_directory = os.path.dirname(os.path.abspath(__file__))
    # Construct the path to the image
    image_path = os.path.join(current_directory, 'logo', 'BiolizardLogo.png')
    # Read the image
    img = plt.imread(image_path)

    ax_image.imshow(img)
    ax_image.axis('off')
    ax.axis('off')

    # Save the custom figure to a temporary buffer
    buf1 = io.BytesIO()
    fig1.savefig(buf1, format='png', pad_inches=0.1, dpi=dpi)
    buf1.seek(0)
    img1 = Image.open(buf1)
    plt.close(fig1)

    # Concatenate the two images vertically
    combined_img = Image.new('RGB', (swarmplot_width, img1.height + img2.height))
    combined_img.paste(img2, (0, 0))
    combined_img.paste(img1, (0, img2.height))

    # Save the concatenated image
    if pdf:
        if save_filepath:
            filename = save_filepath
        else:
            filename = output_name + '.pdf'
        combined_img.save(filename, "PDF", resolution=100.0)
    else:
        if save_filepath:
            filename = save_filepath
        else:
            filename = output_name + '.png'
        combined_img.save(filename)






