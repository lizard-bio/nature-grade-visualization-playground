import os
import io
import warnings

# import numpy as np
from PIL import Image

# from pathlib import Path
import matplotlib.pyplot as plt
import matplotlib.colors

# from matplotlib import font_manager
import colorspace

# the three basic colors
# deprecated in the new brand style: return black
blz_green = "#000000"
blz_blue = "#000000"
blz_yellow = "#000000"

# base element and text colors
blz_base_element = "#000000"
blz_base_fill = "#faf4ed"
blz_base_text = "#000000"

# highlight colors
blz_highlight_element = "#0d47a1"
blz_highlight_fill = "#badeed"


def lizard_style(plotly=False):
    """
    Load and apply the lizard_style for matplotlib plots.

    Parameters:
    -----------
    font_name : str, optional
        The name of the font to be used for the plots. By default, it uses 'Red Hat Display'.
        If you want to use your own local installation of Red Hat Display or any other font,
        specify the font name using this parameter. For more details on how to use
        the font_name parameter, refer to the 'In_Action' file on GitHub.

    Example:
    --------
    #>>> lizard_style()

    Notes:
    ------
    Ensure that the specified font is installed on your system and is recognized by matplotlib.

    """
    style_path = os.path.join(os.path.dirname(__file__), "lizard_style.mplstyle")
    plt.style.use(style_path)

    if plotly:
        import plotly.io as pio

        pio.templates.default = "lizard_style"


# Colorblind-safe qualitative color palette based on the colors in the bliolizard brand book.
biolizard_qualitative_pal = matplotlib.colors.ListedColormap(
    [
        "#9fd356",
        "#0d47a1",
        "#E5A4CB",
        "#FF6F59",
        "#75DDDD",
        "#009944",
        "#1e88e5",
        "#F72585"
    ]
)
biolizard_qualitative_pal_r = biolizard_qualitative_pal.reversed()

# Colorblind-safe qualitative color palette based on the colors in the bliolizard brand book, especially suited for levels that are related 2-by-2.
biolizard_paired_pal = matplotlib.colors.ListedColormap(
    [
        "#9fd356",
        "#009944",
        "#1e88e5",
        "#0d47a1",
        "#E5A4CB",
        "#F72585"
    ]
)
biolizard_paired_pal_r = biolizard_paired_pal.reversed()

def _create_colormap(name, palette, reverse=False):
    """
    Create and register a colormap with matplotlib.

    This function generates a colormap from a given palette and registers it with
    matplotlib under the specified name.

    Parameters:
    - palette (function): A function that returns a list of colors.
    - name (str): The name under which the colormap will be registered with matplotlib.
    - reverse (bool): whether or not to reverse the color palette

    Example:
    #>>> _biolizard_sequential_pal = colorspace.sequential_hcl(h=170, c=[40,0,75], l=[35,90], power=1)
    #>>> biolizard_sequential_pal = create_colormap(_biolizard_sequential_pal)
    """
    colors = palette(256)
    rgbcolors = [matplotlib.colors.to_rgb(color) for color in colors]
    cmap = matplotlib.colors.LinearSegmentedColormap.from_list(name, rgbcolors)
    if reverse:
        cmap = cmap.reversed()
    return cmap


# Hues Biolizard Color Map
#
# This colormap applies the Biolizard 'hues' palette.
#
# Details:
# Maps each level to an evenly spaced hue on the color wheel, starting with the dark green color from the brand book. DOES NOT generate colorblind-safe palettes.
_biolizard_hues_pal = colorspace.qualitative_hcl(
    h=[
        135,
        lambda n: 330 * (n - 1) / n + 135,
    ],  # 330 degrees instead of 360 to avoid the last being identical to the first one
    c=71,
    l=55,
)
biolizard_hues_pal = _create_colormap("biolizard_hues_pal", _biolizard_hues_pal)
biolizard_hues_pal_r = _create_colormap(
    "biolizard_hues_pal_r", _biolizard_hues_pal, reverse=True
)
matplotlib.colormaps.register(
    name="biolizard_hues_pal", cmap=biolizard_hues_pal, force=True
)
matplotlib.colormaps.register(
    name="biolizard_hues_pal_r", cmap=biolizard_hues_pal_r, force=True
)

# Sequential Biolizard Color Map
#
# This colormap applies the sequential Biolizard palette.
#
# Details:
# Sequential, colorblind-safe, perceptually unifom color palette inspired by the light and dark blue shades of the brand.
_biolizard_sequential_pal = colorspace.sequential_hcl(
    h=250, c=[100, 90], l=[75, 20], power=1
)
biolizard_sequential_pal = _create_colormap(
    "biolizard_sequential_pal", _biolizard_sequential_pal
)
biolizard_sequential_pal_r = _create_colormap(
    "biolizard_sequential_pal_r", _biolizard_sequential_pal, reverse=True
)
matplotlib.colormaps.register(
    name="biolizard_sequential_pal", cmap=biolizard_sequential_pal, force=True
)
matplotlib.colormaps.register(
    name="biolizard_sequential_pal_r", cmap=biolizard_sequential_pal_r, force=True
)

# Divergent Biolizard Color Map
#
# This colormap applies the divergent Biolizard palette for scenarios where color corresponds to categories with a natural midpoint.
#
# Details:
# Divergent, colorblind-safe and perceptually uniform (within each branch) continuous color palette inspired by the green-blue color gradient in the biolizard brand book.
_biolizard_divergent_pal = colorspace.diverging_hcl(
    h=[250, 115], c=[80, 100], l=[35, 90], power=1
)
biolizard_divergent_pal = _create_colormap(
    "biolizard_divergent_pal", _biolizard_divergent_pal
)
biolizard_divergent_pal_r = _create_colormap(
    "biolizard_divergent_pal_r", _biolizard_divergent_pal, reverse=True
)
matplotlib.colormaps.register(
    name="biolizard_divergent_pal", cmap=biolizard_divergent_pal, force=True
)
matplotlib.colormaps.register(
    name="biolizard_divergent_pal_r", cmap=biolizard_divergent_pal_r, force=True
)


# beige-blue colormap
from .beige_blue import cm_data as cm_data_beige_blue
rgbcolors_beige_blue = [matplotlib.colors.to_rgb(color) for color in cm_data_beige_blue]
biolizard_beige_blue_pal_r = matplotlib.colors.LinearSegmentedColormap.from_list(
    "biolizard_beige_blue_pal_r", rgbcolors_beige_blue
)
biolizard_beige_blue_pal = biolizard_beige_blue_pal_r.reversed() # reverse to start with beige
matplotlib.colormaps.register(name="biolizard_beige_blue_pal", cmap=biolizard_beige_blue_pal, force=True)
matplotlib.colormaps.register(name="biolizard_beige_blue_pal_r", cmap=biolizard_beige_blue_pal_r, force=True)

# beige-green-blue colormap
from .beige_gn_blue import cm_data as cm_data_beige_gn_blue
rgbcolors_beige_gn_blue = [matplotlib.colors.to_rgb(color) for color in cm_data_beige_gn_blue]
biolizard_beige_gn_blue_pal_r = matplotlib.colors.LinearSegmentedColormap.from_list(
    "biolizard_beige_gn_blue_pal_r", rgbcolors_beige_gn_blue
)
biolizard_beige_gn_blue_pal = biolizard_beige_gn_blue_pal_r.reversed() # reverse to start with beige
matplotlib.colormaps.register(name="biolizard_beige_gn_blue_pal", cmap=biolizard_beige_gn_blue_pal, force=True)
matplotlib.colormaps.register(name="biolizard_beige_gn_blue_pal_r", cmap=biolizard_beige_gn_blue_pal_r, force=True)

# viridis-like colormap: DEPRECATED
# named l_viridis after the european green lizard (Lacerta viridis)
from .l_viridis import cm_data

rgbcolors = [matplotlib.colors.to_rgb(color) for color in cm_data]
_deprecated_l_viridis_pal_r = matplotlib.colors.LinearSegmentedColormap.from_list(
    "_deprecated_l_viridis_pal_r", rgbcolors
)
_deprecated_l_viridis_pal = _deprecated_l_viridis_pal_r.reversed()  # reverse to start with yellow

class DeprecatedColormap(matplotlib.colors.Colormap):
    def __init__(self, base_cmap, name):
        self._base_cmap = base_cmap
        self.name = name
        super().__init__(name, N=base_cmap.N)
    def __call__(self, *args, **kwargs):
        warnings.warn(
            f"{self.name} is deprecated and will be removed in a future version. "
            "Please use biolizard_beige_gn_blue_pal instead.",
            DeprecationWarning,
            stacklevel=2
        )
        return self._base_cmap(*args, **kwargs)
    def __getattr__(self, attr):
        # Forward all other attributes to the base colormap
        return getattr(self._base_cmap, attr)

l_viridis_pal = DeprecatedColormap(biolizard_beige_gn_blue_pal, "l_viridis_pal")
l_viridis_pal_r = DeprecatedColormap(biolizard_beige_gn_blue_pal_r, "l_viridis_pal_r")

matplotlib.colormaps.register(name="l_viridis_pal", cmap=l_viridis_pal, force=True)
matplotlib.colormaps.register(name="l_viridis_pal_r", cmap=l_viridis_pal_r, force=True)

# deprecation logic for attribute access
deprecated_names = ['l_viridis_pal', 'l_viridis_pal_r']

def __getattr__(name):
    if name in deprecated_names:
        warnings.warn(
            f"{name} is deprecated and will be removed in a future version. Please use biolizard_beige_gn_blue_pal instead.",
            DeprecationWarning,
            stacklevel=2
        )
        return l_viridis_pal if name == 'l_viridis_pal' else l_viridis_pal_r
    raise AttributeError(f"module {__name__} has no attribute {name}")


def finalise_lizardplot(
    plot,
    source_text,
    fontsize=12,
    pdf=False,
    output_name="TempLizardPlot",
    save_filepath=None,
):
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
    plot.savefig(buf, format="png", pad_inches=0.1, dpi=dpi)
    buf.seek(0)
    img2 = Image.open(buf)

    # Get the width of the saved plot in pixels
    swarmplot_width, _ = img2.size

    # Adjust the width and height of the custom figure to match the width of the plot in pixels
    custom_fig_width_inches = swarmplot_width / dpi
    custom_fig_height_inches = 0.4  # Reduced height

    fig1 = plt.figure(figsize=(custom_fig_width_inches, custom_fig_height_inches))
    ax = fig1.add_axes([0, 0, 1, 1])
    ax.plot([0, 0.99], [0.9, 0.9], color="black", linewidth=1, transform=ax.transAxes)
    ax.plot([0.99], [0.9], "o", transform=ax.transAxes, markersize=5)

    font_name = plt.rcParams["font.sans-serif"][0]

    ax.text(
        0.05,
        0.5,
        source_text,
        verticalalignment="center",
        transform=ax.transAxes,
        fontsize=fontsize,
        fontname=font_name,
    )

    ax_image = fig1.add_axes([0.85, -0.15, 0.15, 1], anchor="NE", zorder=-1)

    # Get the directory of the current script
    current_directory = os.path.dirname(os.path.abspath(__file__))
    # Construct the path to the image
    image_path = os.path.join(current_directory, "logo", "BiolizardLogo.png")
    # Read the image
    img = plt.imread(image_path)

    ax_image.imshow(img)
    ax_image.axis("off")
    ax.axis("off")

    # Save the custom figure to a temporary buffer
    buf1 = io.BytesIO()
    fig1.savefig(buf1, format="png", pad_inches=0.1, dpi=dpi)
    buf1.seek(0)
    img1 = Image.open(buf1)
    plt.close(fig1)

    # Concatenate the two images vertically
    combined_img = Image.new("RGB", (swarmplot_width, img1.height + img2.height))
    combined_img.paste(img2, (0, 0))
    combined_img.paste(img1, (0, img2.height))

    # Save the concatenated image
    if pdf:
        if save_filepath:
            filename = save_filepath
        else:
            filename = output_name + ".pdf"
        combined_img.save(filename, "PDF", resolution=100.0)
    else:
        if save_filepath:
            filename = save_filepath
        else:
            filename = output_name + ".png"
        combined_img.save(filename)
