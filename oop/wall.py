class Wall:

    def __init__(self, depth, height, width):
        self.depth = depth
        self.height = height
        self.width = width
        self.volume = self.width * self.height * self.depth

    def get_cost(self):
        return self.armor * self.height

    def fortify(self):
        self.armor = self.armor * 2
