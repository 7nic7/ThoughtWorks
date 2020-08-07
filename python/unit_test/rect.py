class Rect:

    def __init__(self, x, y, width, height):
        self.x = x
        self.y = y
        self.width = width
        self.height = height

    def intersect(self, rect: 'Rect') -> bool:
        # TODO: implement me
        if rect.y > self.y + self.height or \
                rect.y + rect.height < self.y or \
                rect.x > self.x + self.width or \
                rect.x + rect.width < self.x:
            return False
        return True
