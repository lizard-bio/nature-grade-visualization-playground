import os
import warnings

# import numpy as np
# from pathlib import Path
import matplotlib.pyplot as plt
import matplotlib.colors
import matplotlib.layout_engine

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
    at the bottom containing a source text and a logo. The footer is drawn into the
    figure itself, so a PDF export stays vector graphics. The figure is restored to
    its original size and layout after saving.

    Parameters:
    - plot (matplotlib.figure.Figure): The input plot to be finalized.
    - source_text (str): The source text to be displayed at the bottom of the plot.
    - fontsize (int, optional): Font size of the source text. Defaults to 12.
    - pdf (bool, optional): If True, saves the output as a PDF. Otherwise, saves as a PNG. Defaults to False.
    - output_name (str, optional): Name of the output file (without extension). Defaults to "TempLizardPlot".
    - save_filepath (str, optional): Full path to save the output (with extension). If specified, it takes precedence over output_name.

    Returns:
    None. The figure is saved to the specified location or the current working directory.

    Example:
    #>>> fig, ax = plt.subplots()
    #>>> ax.plot([0, 1], [0, 1])
    #>>> finalise_lizardplot(fig, "Source: BioLizard Data", pdf=True)
    """
    fig = plot
    dpi = 300
    footer_height_inches = 0.4
    logo_right_pad_inches = 0.15  # keeps the logo clear of the right edge
    logo_top_gap_inches = 0.08  # space between the footer line and the logo
    logo_height_inches = 0.22

    # Remember the original state so the figure can be restored after saving
    orig_size = fig.get_size_inches().copy()
    orig_subplotpars = {
        k: getattr(fig.subplotpars, k)
        for k in ("left", "right", "bottom", "top", "wspace", "hspace")
    }
    orig_positions = {
        ax: (ax.get_position(original=True), ax.get_position(original=False))
        for ax in fig.axes
    }
    orig_text_positions = {t: t.get_position() for t in fig.texts}
    engine = fig.get_layout_engine()
    engine_rect = engine.get()["rect"] if engine is not None and "rect" in engine.get() else None

    # Grow the figure downwards to make room for the footer
    width, height = orig_size
    new_height = height + footer_height_inches
    f = footer_height_inches / new_height  # footer height as a fraction of the new figure

    def to_new(y):
        """Map a vertical figure fraction of the original figure to the enlarged one."""
        return f + y * (1 - f)

    if engine_rect is not None:
        # constrained / tight layout: restrict the layout to the area above the footer
        if isinstance(engine, matplotlib.layout_engine.TightLayoutEngine):
            # rect is (left, bottom, right, top)
            left, bottom, right, top = engine_rect
            engine.set(rect=(left, to_new(bottom), right, to_new(top)))
        else:
            # rect is (left, bottom, width, height)
            x0, y0, w, h = engine_rect
            engine.set(rect=(x0, to_new(y0), w, h * (1 - f)))
        fig.set_size_inches(width, new_height)
    else:
        with warnings.catch_warnings():
            warnings.simplefilter("ignore")
            fig.subplots_adjust(left=0.11, bottom=0.13, right=0.95)
        positions = {ax: ax.get_position() for ax in fig.axes}
        fig.set_size_inches(width, new_height)
        for ax, pos in positions.items():
            ax.set_position(
                [pos.x0, to_new(pos.y0), pos.width, pos.height * (1 - f)]
            )
    # Figure-level texts (e.g. suptitle) are placed in figure fractions too
    for t, (x, y) in orig_text_positions.items():
        t.set_position((x, to_new(y)))

    # Footer: horizontal line ending in a dot, the source text and the logo
    footer_ax = fig.add_axes([0, 0, 1, f])
    footer_ax.set_in_layout(False)
    footer_ax.plot([0, 0.99], [0.9, 0.9], color="black", linewidth=1)
    footer_ax.plot([0.99], [0.9], "o", markersize=5)
    footer_ax.text(
        0.05,
        0.5,
        source_text,
        verticalalignment="center",
        fontsize=fontsize,
        fontname=plt.rcParams["font.sans-serif"][0],
    )
    footer_ax.set_xlim(0, 1)
    footer_ax.set_ylim(0, 1)
    footer_ax.axis("off")

    image_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "logo", "BiolizardLogo.png"
    )
    logo = plt.imread(image_path)
    # Logo is sized and placed in inches so its spacing is the same for every figure size
    logo_height_in = min(logo_height_inches, 0.15 * width * logo.shape[0] / logo.shape[1])
    logo_width_in = logo_height_in * logo.shape[1] / logo.shape[0]
    line_y_in = 0.9 * footer_height_inches
    logo_top_in = line_y_in - logo_top_gap_inches
    logo_ax = fig.add_axes(
        [
            1 - (logo_right_pad_inches + logo_width_in) / width,
            (logo_top_in - logo_height_in) / new_height,
            logo_width_in / width,
            logo_height_in / new_height,
        ],
        zorder=-1,
    )
    logo_ax.set_in_layout(False)
    logo_ax.imshow(logo)
    logo_ax.axis("off")

    # Save
    if save_filepath:
        filename = save_filepath
    else:
        filename = output_name + (".pdf" if pdf else ".png")
    try:
        with warnings.catch_warnings():
            # tight_layout warns about the footer axes, which are excluded from layout anyway
            warnings.filterwarnings("ignore", message=".*not compatible with tight_layout.*")
            fig.savefig(filename, format="pdf" if pdf else "png", dpi=dpi)
    finally:
        # Restore the figure so it can still be shown or edited afterwards
        footer_ax.remove()
        logo_ax.remove()
        fig.set_size_inches(orig_size)
        if engine_rect is not None:
            engine.set(rect=engine_rect)
        else:
            fig.subplots_adjust(**orig_subplotpars)
        for ax, (orig_pos, active_pos) in orig_positions.items():
            ax.set_position(orig_pos, which="original")
            ax.set_position(active_pos, which="active")
        for t, pos in orig_text_positions.items():
            t.set_position(pos)
