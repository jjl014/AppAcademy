class Board

  def self.default
    grid = Array.new(9) do
      Array.new(9) { Tile.new }
    end
    self.new(grid)
  end

  def initialize(grid)
    @grid = grid
  end

  def populate_bombs
    #randomly populates bombs by iteration
  end

  def set_fringes
    #iterates through grid and finds how many bombs around it

  end

  def reveal(pos)
    # reveal itself
    #get the array of neighbors
    # reveal each neighbor (call reveal on neighbors)


  end



end
