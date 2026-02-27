import unittest
from BioLizardStylePython import *
# from matplotlib.colors import rgb_to_hsv, to_rgb

class PalettesTestCase(unittest.TestCase):
    
    def test_qualitative_ncolors(self):
        cols = biolizard_qualitative_pal.colors
        self.assertEqual(len(cols), 8,
                         "Qualitative palette does not contain 8 colors")
        
    def test_paired_ncolors(self):
        cols = biolizard_paired_pal.colors
        self.assertEqual(len(cols), 6,
                         "Paired palette does not contain 6 colors")
    
    def test_qualitative_ncolors5(self):
        cols = biolizard_qualitative_pal(range(5))
        self.assertEqual(len(cols), 5,
                         "Number of returned colors in qualitative palette does not match requested number (5)")
        
    def test_qualitative_colors(self):
        cols = biolizard_qualitative_pal.colors
        self.assertEqual(cols,[
            "#9fd356",
            "#0d47a1",
            "#E5A4CB",
            "#FF6F59",
            "#75DDDD",
            "#009944",
            "#1e88e5",
            "#F72585"
        ],
        "Colors of qualitative palette do not match brand book colors")


if __name__ == '__main__':
    unittest.main()