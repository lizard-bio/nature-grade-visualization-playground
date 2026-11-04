from BioLizardStylePython import *
from matplotlib.testing.decorators import image_comparison
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns

# uses pytest framework

#maplotlib plot
@image_comparison(baseline_images=['lineplot'], remove_text=False,
                  extensions=['png'], style='mpl20')
def test_lizardstyle_lineplot():
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
    plt.suptitle('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    plt.title('abcdefghijklmnopqrstuvwxyz')
    plt.xlabel('X-axis')
    plt.ylabel('Y-axis')
    plt.legend()


#scatterplot
@image_comparison(baseline_images=['irisplot'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_irisplot():
    # Sample data
    data = sns.load_dataset("iris")
    sns.swarmplot(x="species", y="sepal_length", hue ="species", data=data, palette=biolizard_qualitative_pal.colors[0:3])
    plt.title('A Flower Plot')

#boxplot
@image_comparison(baseline_images=['irisplot_box'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_boxplot():
    # Sample data
    data = sns.load_dataset("iris")
    sns.boxplot(x="species", y="sepal_length", data=data, boxprops={"facecolor": blz_base_fill})
    plt.title('A Flower Plot')

#density plot
@image_comparison(baseline_images=['irisplot_dens'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_distplot():
    # Sample data
    data = sns.load_dataset("iris")
    sns.displot(data, x="sepal_length", hue="species", kind="kde", fill=True,palette=biolizard_qualitative_pal.colors[0:3])
    plt.title('A Flower Plot')

# colormap
@image_comparison(baseline_images=['seq_cmapplot'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_cmapplot_seq():
    np.random.seed(42)
    data = np.random.rand(5, 5)  # Example data
    plt.imshow(data, cmap='biolizard_sequential_pal')
    plt.colorbar()

@image_comparison(baseline_images=['div_cmapplot'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_cmapplot_div():
    np.random.seed(42)
    data = np.random.rand(5, 5)  # Example data
    plt.imshow(data, cmap='biolizard_divergent_pal')
    plt.colorbar()

@image_comparison(baseline_images=['l_viridis_cmapplot'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_cmapplot_l_viridis():
    np.random.seed(42)
    data = np.random.rand(5, 5)  # Example data
    plt.imshow(data, cmap='l_viridis_pal')
    plt.colorbar()

@image_comparison(baseline_images=['beige_blue_cmapplot'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_cmapplot_beige_blue():
    np.random.seed(42)
    data = np.random.rand(5, 5)  # Example data
    plt.imshow(data, cmap='biolizard_beige_blue_pal')
    plt.colorbar()

@image_comparison(baseline_images=['beige_gn_blue_cmapplot'], remove_text=False,
                extensions=['png'], style='mpl20')
def test_lizardstyle_cmapplot_beige_gn_blue():
    np.random.seed(42)
    data = np.random.rand(5, 5)  # Example data
    plt.imshow(data, cmap='biolizard_beige_gn_blue_pal')
    plt.colorbar()

# finalise_lizardplot: footer is drawn into the figure and the figure is restored afterwards
def test_finalise_lizardplot(tmp_path):
    for layout in (None, "constrained", "tight"):
        fig, ax = plt.subplots(layout=layout)
        ax.plot([0, 1], [0, 1])
        fig.suptitle("title")
        size_before = tuple(fig.get_size_inches())
        positions_before = [ax.get_position().bounds for ax in fig.axes]
        for pdf in (False, True):
            ext = ".pdf" if pdf else ".png"
            out = tmp_path / f"plot_{layout}{ext}"
            finalise_lizardplot(fig, "Source: test", pdf=pdf, save_filepath=str(out))
            assert out.exists() and out.stat().st_size > 0
        assert tuple(fig.get_size_inches()) == size_before
        assert [ax.get_position().bounds for ax in fig.axes] == positions_before
        plt.close(fig)
