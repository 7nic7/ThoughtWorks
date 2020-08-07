import unittest

from rect import Rect


class RectTest(unittest.TestCase):
    def test_intersect_for_crossing_rects(self):
        self.assertTrue(Rect(1, 1, 1, 1).intersect(Rect(1, 1, 0.5, 0.5)))

    def test_nonintersect(self):
        self.assertFalse(Rect(1, 1, 1, 1).intersect(Rect(-1, -1, 0.5, 0.5)))

    def test_edge_rects(self):
        self.assertFalse(Rect(1, 1, 1, 1).intersect(Rect(1, 0, 1, 1)))

if __name__ == '__main__':
    unittest.main()
