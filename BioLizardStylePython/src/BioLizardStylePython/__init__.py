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


# # check if lato font installed
# from matplotlib import font_manager
# fonts = font_manager.fontManager.ttflist
# font_names = [font.name for font in fonts if 'lato' in font.name.lower()]
# font_names = set(font_names)

# if len(font_names) == 0:
#     raise FileNotFoundError('Could not find Lato font, is it installed? Try installing the Lato font from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall')
# else:
#     print('Lato font found! Ready to start visualizing in BLZ style!')
#     lato_localname = font_names.pop()  #pick first one, usually there should only be one.. (?)


from .utils import *