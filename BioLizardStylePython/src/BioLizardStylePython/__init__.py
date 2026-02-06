# check if colorspace installed
try:
    import colorspace
except ModuleNotFoundError:
    print(
        "Could not find colorspace module. Install with `pip install git+https://github.com/retostauffer/python-colorspace.git`"
    )
    raise

# clear matplotlib cache to make sure lato font is recognized
import matplotlib as mpl

# import os
# import glob
# import warnings

# for f in glob.glob(mpl.get_cachedir() + '/*'):
#     try:
#         os.remove(f)
#     except PermissionError:
#         warnings.warn(f"Permission denied: {f}", UserWarning)


# # # check if lato font installed and install if needed
# from matplotlib import font_manager
# fonts = font_manager.fontManager.ttflist
# font_names = [font.name for font in fonts if 'lato' in font.name.lower()]
# font_names = set(font_names)


# if len(font_names) == 0:
#     from fonts.ttf import Lato, LatoBold
#     font_manager.fontManager.addfont(Lato)  #  adds a custom font from a file without installing it into the operating system
#     font_manager.fontManager.addfont(LatoBold)
#     prop = font_manager.FontProperties(fname=Lato)
#     lato_localname = prop.get_name()
# else:
#     lato_localname = font_names.pop()  #pick first one, usually there should only be one.. (?)

"""from matplotlib import font_manager
from fonts.ttf import RedHatDisplay, RedHatDisplayBold

font_manager.fontManager.addfont(
    RedHatDisplay
)  #  adds a custom font from a file without installing it into the operating system
font_manager.fontManager.addfont(RedHatDisplayBold)
# prop = font_manager.FontProperties(fname=Lato)
# lato_localname = prop.get_name()"""

import matplotlib.pyplot as plt
import matplotlib.font_manager as fm
import importlib.resources
import logging

# Set up simple logging to avoid silent failures
logger = logging.getLogger(__name__)


try:
    import font_rhd

    font_files = importlib.resources.files("font_rhd") / "files"

    # 3. Iterate and register
    fonts_found = False
    if font_files.is_dir():
        for file_path in font_files.iterdir():
            # Check for common font extensions
            if file_path.suffix.lower() in [".ttf"]:
                # as_file() ensures we get a valid filesystem path
                # even if the package is compressed/zipped.
                with importlib.resources.as_file(file_path) as path:
                    fm.fontManager.addfont(str(path))
                    fonts_found = True

    if fonts_found:
        logger.info("Successfully registered Red Hat Display from font-rhd.")
    else:
        logger.warning("font-rhd package found, but no .ttf files detected.")

except ImportError:
    logger.warning("Could not import 'font_rhd'. Fonts were not registered.")
except Exception as e:
    logger.error(f"Error registering fonts: {e}")


from .utils import *
from .plotly_template import *
