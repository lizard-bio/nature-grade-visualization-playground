# check if colorspace installed
try:
    import colorspace
except ModuleNotFoundError:
    print('Could not find colorspace module. Install with `pip install git+https://github.com/retostauffer/python-colorspace.git`')
    raise

# clear matplotlib cache to make sure lato font is recognized
import matplotlib as mpl
import os, glob
for f in glob.glob(mpl.get_cachedir() + '/*'):
    os.remove(f)


# # check if lato font installed and install if needed
from matplotlib import font_manager
fonts = font_manager.fontManager.ttflist
font_names = [font.name for font in fonts if 'lato' in font.name.lower()]
font_names = set(font_names)


if len(font_names) == 0:
    from fonts.ttf import Lato, LatoBold
    font_manager.fontManager.addfont(Lato)  #  adds a custom font from a file without installing it into the operating system
    font_manager.fontManager.addfont(LatoBold)
    prop = font_manager.FontProperties(fname=Lato)
    lato_localname = prop.get_name()
else:
    lato_localname = font_names.pop()  #pick first one, usually there should only be one.. (?)


from .utils import *