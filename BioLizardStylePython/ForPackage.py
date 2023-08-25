import matplotlib.colors
import colorspace
import numpy as np
import matplotlib.pyplot as plt
import io
from PIL import Image


# Qualitative color map

# There isn't necessarily a single, clear way to use a qualitative colormap with matplotlib.
# Since it can be applied in multiple ways, it seems best to simply provide users with a `ListedColormap`.

# This palette is inspired by Martin Krzywinski's "12-COLOR PALETTE FOR COLORBLINESS"
# and is infused with the signature house colors of BioLizard for the first three shades.
# Tailored to be inclusive, it is friendly for those with the prevalent form of color blindness: Deuteranopia (Red-Green Color Blindness).

biolizard_qualitative_pal = matplotlib.colors.ListedColormap(["#01a086", "#1e2237", "#e9b940", "#00C2F9","#008DF9", "#FF6E3A", "#00FCCF",
                                             "#8400CD", "#E20134","#FFB2FD","#FF5AAF" ,"#A40122"])

#Sequential and divergent color map

#Also for these color maps it seems best to simply provide the users with a new colormap. This approach offers the most flexibility.

def create_and_register_colormap(palette, name):
    colors = palette(256)
    if name== "biolizard_sequential_pal":
        colors = colors[::-1]  # Reverse the order of the colors
    rgbcolors = [matplotlib.colors.to_rgb(color) for color in colors]
    cmap = matplotlib.colors.LinearSegmentedColormap.from_list(name, rgbcolors)
    matplotlib.colormaps.register(name=name, cmap=cmap)

# Sequential color map
biolizard_sequential_pal = colorspace.sequential_hcl(h=170, c=[40,0,75], l=[35,90], power=1)
create_and_register_colormap(biolizard_sequential_pal, "biolizard_sequential_pal")

# Divergent color map
biolizard_divergent_pal = colorspace.diverging_hcl(h=[291, 170], c=80, l=[35, 95], power=1)
create_and_register_colormap(biolizard_divergent_pal, "biolizard_divergent_pal")

#Adding a biolizard footer!

def add_custom_footer(plot, source_text, fontsize=12, pdf=False):
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

    # Load your custom style
    plt.style.use('lizard_style.mplstyle')
    font_name = plt.rcParams['font.family'][0]

    ax.text(0.05, 0.5, source_text, verticalalignment='center', transform=ax.transAxes, fontsize=fontsize,
            fontname=font_name)

    ax_image = fig1.add_axes([0.90, -0.09, 0.10, 1], anchor='NE', zorder=-1)
    img = plt.imread('BioLizardLogo.png')  # Assuming 'img' is globally defined or passed to the function
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
        combined_img.save('TempLizardPlot.pdf', "PDF", resolution=100.0)
    else:
        combined_img.save('TempLizardPlot.png')




