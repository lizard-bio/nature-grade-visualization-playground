import plotly.graph_objects as go
import plotly.io as pio
import matplotlib.colors

from .utils import (
    biolizard_qualitative_pal,
    biolizard_divergent_pal,
    biolizard_sequential_pal,
    blz_base_element,
    blz_base_fill,
    blz_base_text,
    blz_highlight_element,
)

lizard_style_template = go.layout.Template()
lizard_style_template.layout = {
    #     'activeselection' : {},
    "annotationdefaults": {"arrowhead": 0, "arrowwidth": 1},
    #     'annotations' : {},
    "autotypenumbers": "convert types",
    "barmode": "group",
    "boxmode": "group",
    "coloraxis": {
        "colorbar": {
            "outlinewidth": 1,
            "tickcolor": blz_base_element,
            "ticks": "outside",
            "exponentformat": "E",
        }
    },
    "colorscale": {
        "diverging": [
            matplotlib.colors.rgb2hex(biolizard_divergent_pal(i)) for i in range(255)
        ],
        "sequential": [
            matplotlib.colors.rgb2hex(biolizard_sequential_pal(i)) for i in range(255)
        ],
        "sequentialminus": [
            matplotlib.colors.rgb2hex(biolizard_sequential_pal.reversed()(i))
            for i in range(255)
        ],
    },
    "colorway": biolizard_qualitative_pal.colors,
    "font": {"family": "Red Hat Display", "size": 12},
    "geo": {
        "bgcolor": "white",
        "oceancolor": "white",
        "lakecolor": "white",
        "landcolor": blz_highlight_element,
        "showlakes": True,
        "showland": True,
        "subunitcolor": "white",
    },
    # 'hoverlabel': {'align': 'left'},
    "hovermode": "closest",
    "mapbox": {"style": "light"},
    "paper_bgcolor": "white",
    "plot_bgcolor": "white",
    # 'polar': {'angularaxis': {'gridcolor': 'rgb(232,232,232)',
    #                           'linecolor': '#808080',
    #                           'showgrid': False,
    #                           'showline': True,
    #                           'ticks': 'outside'},
    #           'bgcolor': 'white',
    #           'radialaxis': {'gridcolor': 'rgb(232,232,232)',
    #                          'linecolor': '#808080',
    #                          'showgrid': False,
    #                          'showline': True,
    #                          'ticks': 'outside'}},
    "scattermode": "overlay",
    "scene": {
        "xaxis": {
            "backgroundcolor": "white",
            "gridcolor": "rgb(232,232,232)",
            "gridwidth": 2,
            "color": blz_base_element,
            "linecolor": blz_base_element,
            "spikecolor": blz_base_element,
            "tickcolor": blz_base_element,
            "showbackground": True,
            "showgrid": False,
            "showline": True,
            "ticks": "outside",
            "zeroline": False,
            "zerolinecolor": blz_base_element,
            "exponentformat": "power",
        },
        "yaxis": {
            "backgroundcolor": "white",
            "gridcolor": "rgb(232,232,232)",
            "gridwidth": 2,
            "color": blz_base_element,
            "linecolor": blz_base_element,
            "spikecolor": blz_base_element,
            "tickcolor": blz_base_element,
            "showbackground": True,
            "showgrid": False,
            "showline": True,
            "ticks": "outside",
            "zeroline": False,
            "zerolinecolor": blz_base_element,
            "exponentformat": "power",
        },
        "zaxis": {
            "backgroundcolor": "white",
            "gridcolor": "rgb(232,232,232)",
            "gridwidth": 2,
            "color": blz_base_element,
            "linecolor": blz_base_element,
            "spikecolor": blz_base_element,
            "tickcolor": blz_base_element,
            "showbackground": True,
            "showgrid": False,
            "showline": True,
            "ticks": "outside",
            "zeroline": False,
            "zerolinecolor": blz_base_element,
            "exponentformat": "power",
        },
    },
    "separators": ". ",
    "shapedefaults": {"fillcolor": blz_base_fill, "line": {"width": 0}, "opacity": 1},
    "ternary": {
        "aaxis": {
            "gridcolor": "rgb(232,232,232)",
            "gridwidth": 2,
            "color": blz_base_element,
            "linecolor": blz_base_element,
            "tickcolor": blz_base_element,
            "showgrid": False,
            "showline": True,
            "ticks": "outside",
            "exponentformat": "power",
        },
        "baxis": {
            "gridcolor": "rgb(232,232,232)",
            "gridwidth": 2,
            "color": blz_base_element,
            "linecolor": blz_base_element,
            "tickcolor": blz_base_element,
            "showgrid": False,
            "showline": True,
            "ticks": "outside",
            "exponentformat": "power",
        },
        "bgcolor": "white",
        "caxis": {
            "gridcolor": "rgb(232,232,232)",
            "gridwidth": 2,
            "color": blz_base_element,
            "linecolor": blz_base_element,
            "tickcolor": blz_base_element,
            "showgrid": False,
            "showline": True,
            "ticks": "outside",
            "exponentformat": "power",
        },
    },
    "title": {
        "x": 0.05,
        "font": {"family": "Red Hat Display", "size": 16, "color": blz_base_text},
    },
    "violinmode": "group",
    "waterfallmode": "group",
    "xaxis": {
        "automargin": True,
        "gridcolor": "rgb(232,232,232)",
        "linecolor": blz_base_element,
        "spikecolor": blz_base_element,
        "dividercolor": blz_base_element,
        "tickcolor": blz_base_element,
        "showgrid": False,
        "showline": True,
        "ticks": "outside",
        "title": {
            "standoff": 15,
            "font": {"family": "Red Hat Display", "size": 14, "color": blz_base_text},
        },
        "zeroline": False,
        "zerolinecolor": blz_base_element,
        "exponentformat": "power",
    },
    "yaxis": {
        "automargin": True,
        "gridcolor": "rgb(232,232,232)",
        "linecolor": blz_base_element,
        "spikecolor": blz_base_element,
        "dividercolor": blz_base_element,
        "tickcolor": blz_base_element,
        "showgrid": False,
        "showline": True,
        "ticks": "outside",
        "title": {
            "standoff": 15,
            "font": {"family": "Red Hat Display", "size": 14, "color": blz_base_text},
        },
        "zeroline": False,
        "zerolinecolor": blz_base_element,
        "exponentformat": "power",
    },
}

lizard_style_template.data = {
    "bar": [
        {
            "error_x": {"color": blz_base_element},
            "error_y": {"color": blz_base_element},
            "marker": {
                "line": {"color": "white", "width": 0.5},
                "pattern": {"fillmode": "overlay", "size": 10, "solidity": 0.2},
            },
            "type": "bar",
        }
    ],
    "barpolar": [
        {
            "marker": {
                "line": {"color": "white", "width": 0.5},
                "pattern": {"fillmode": "overlay", "size": 10, "solidity": 0.2},
            },
            "type": "barpolar",
        }
    ],
    "carpet": [
        {
            "aaxis": {
                "endlinecolor": blz_base_element,
                "gridcolor": blz_base_element,
                "linecolor": blz_base_element,
                "minorgridcolor": blz_base_element,
                "startlinecolor": blz_base_element,
            },
            "baxis": {
                "endlinecolor": blz_base_element,
                "gridcolor": blz_base_element,
                "linecolor": blz_base_element,
                "minorgridcolor": blz_base_element,
                "startlinecolor": blz_base_element,
            },
            "type": "carpet",
        }
    ],
    "choropleth": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "colorscale": [
                matplotlib.colors.rgb2hex(biolizard_sequential_pal(i))
                for i in range(255)
            ],
            "type": "choropleth",
        }
    ],
    "contour": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "colorscale": [
                matplotlib.colors.rgb2hex(biolizard_sequential_pal(i))
                for i in range(255)
            ],
            "type": "contour",
        }
    ],
    "contourcarpet": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "type": "contourcarpet",
        }
    ],
    "heatmap": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "colorscale": [
                matplotlib.colors.rgb2hex(biolizard_sequential_pal(i))
                for i in range(255)
            ],
            "type": "heatmap",
        }
    ],
    # 'heatmapgl': [{'colorbar': {'outlinewidth': 1, 'tickcolor': blz_base_element, 'ticks': 'outside', 'exponentformat': 'E'},
    #                'colorscale': [matplotlib.colors.rgb2hex(biolizard_sequential_pal(i)) for i in range(255)],
    #                'type': 'heatmapgl'}],
    "histogram": [
        {"marker": {"line": {"color": "white", "width": 0.6}}, "type": "histogram"}
    ],
    "histogram2d": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "colorscale": [
                matplotlib.colors.rgb2hex(biolizard_sequential_pal(i))
                for i in range(255)
            ],
            "type": "histogram2d",
        }
    ],
    "histogram2dcontour": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "colorscale": [
                matplotlib.colors.rgb2hex(biolizard_sequential_pal(i))
                for i in range(255)
            ],
            "type": "histogram2dcontour",
        }
    ],
    "mesh3d": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "type": "mesh3d",
        }
    ],
    "parcoords": [
        {
            "line": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "parcoords",
        }
    ],
    "pie": [{"automargin": True, "type": "pie"}],
    "scatter": [
        {
            "fillpattern": {"fillmode": "overlay", "size": 10, "solidity": 0.2},
            "type": "scatter",
        }
    ],
    "scatter3d": [
        {
            "line": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scatter3d",
        }
    ],
    "scattercarpet": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scattercarpet",
        }
    ],
    "scattergeo": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scattergeo",
        }
    ],
    "scattergl": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scattergl",
        }
    ],
    "scattermapbox": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scattermapbox",
        }
    ],
    "scatterpolar": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scatterpolar",
        }
    ],
    "scatterpolargl": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scatterpolargl",
        }
    ],
    "scatterternary": [
        {
            "marker": {
                "colorbar": {
                    "outlinewidth": 1,
                    "tickcolor": blz_base_element,
                    "ticks": "outside",
                    "exponentformat": "E",
                }
            },
            "type": "scatterternary",
        }
    ],
    "surface": [
        {
            "colorbar": {
                "outlinewidth": 1,
                "tickcolor": blz_base_element,
                "ticks": "outside",
                "exponentformat": "E",
            },
            "colorscale": [
                matplotlib.colors.rgb2hex(biolizard_sequential_pal(i))
                for i in range(255)
            ],
            "type": "surface",
        }
    ],
    "table": [
        {
            "cells": {"fill": {"color": "white"}, "line": {"color": blz_base_element}},
            "header": {
                "fill": {"color": blz_base_fill},
                "line": {"color": blz_base_element},
            },
            "type": "table",
        }
    ],
}

pio.templates["lizard_style"] = lizard_style_template
