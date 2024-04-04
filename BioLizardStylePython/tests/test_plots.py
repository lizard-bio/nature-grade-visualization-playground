from BioLizardStylePython import *
from matplotlib.testing.decorators import image_comparison
import matplotlib.pyplot as plt
import numpy as np

# uses pytest framework
# note: will not pick up on minor differences in font: eg Nunito vs Lato: both are very similar
# did pick up differences between Lato and Helvetica, for example

@image_comparison(baseline_images=['lineplot'], remove_text=False,
                  extensions=['png'], style='mpl20')
def test_lizardstyle():
    # create random lineplot
    np.random.seed(42)
    x = np.linspace(0, 10, 10)
    y1 = np.sin(x) + np.random.normal(0, 0.1, size=x.shape)
    y2 = np.cos(x) + np.random.normal(0, 0.1, size=x.shape)
    y3 = x + np.random.normal(0, 0.5, size=x.shape)
    lizard_style()
    plt.figure()
    plt.plot(x, y1, label='Line 1')
    plt.plot(x, y2, label='Line 2')
    plt.plot(x, y3, label='Line 3')
    plt.title('Random Plot with 3 Lines')
    plt.xlabel('X-axis')
    plt.ylabel('Y-axis')
    plt.legend()