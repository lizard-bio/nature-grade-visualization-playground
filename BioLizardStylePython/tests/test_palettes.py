import unittest
from BioLizardStylePython import *
from matplotlib.colors import rgb_to_hsv, to_rgb

class PalettesTestCase(unittest.TestCase):
    
    def test_qualitative_ncolors(self):
        cols = biolizard_qualitative_pal().colors
        self.assertEqual(len(cols), 8,
                         "Qualitative palette does not contain 8 colors")
    
    def test_qualitative_ncolors5(self):
        cols = biolizard_qualitative_pal()(range(5))
        self.assertEqual(len(cols), 5,
                         "Number of returned colors in qualitative palette does not match requested number (5)")
        
    def test_qualitative_colors(self):
        cols = biolizard_qualitative_pal().colors[0:3]
        self.assertEqual(cols, ['#01a086', '#1e2237', '#e9b940'],
                         "First three colors of qualitative palette do not match BLZ colors")
    
    def test_sequential_ncolors(self):
        cols = biolizard_sequential_pal()
        self.assertEqual(len(cols), 11,
                         "Sequential palette does not contain 11 colors")
        
    # def test_sequential_hue(self):
    #     hues = [rgb_to_hsv(to_rgb(col))[0] for col in biolizard_sequential_pal()[0:-1]]  # last color is grey
    #     blz_hue = rgb_to_hsv(to_rgb('#01A086'))[0]
    #     self.assertTrue(all(abs(hues - blz_hue) < 0.05),
    #                     "Hues of sequential pallete divert from BLZ green with more than 5%")
        
    def test_divergent_ncolors(self):
        cols = biolizard_divergent_pal()
        self.assertEqual(len(cols), 11,
                         "Divergent palette does not contain 11 colors")
        
    # def test_divergent_hue(self):
    #     hues = [rgb_to_hsv(to_rgb(col))[0] for col in biolizard_divergent_pal()[6::]]  # last half is BLZ green
    #     blz_hue = rgb_to_hsv(to_rgb('#01A086'))[0]
    #     self.assertTrue(all(abs(hues - blz_hue) < 0.05),
    #                     "Hues of divergent pallete divert from BLZ green with more than 5%")


if __name__ == '__main__':
    unittest.main()