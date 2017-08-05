

class Tile

  def initialize
    @bomb = false
    @flagged = false
    @fringe = nil
    @hidden = true
  end

  def is_bomb
    @bomb = true
  end

  def flag
    @flagged = true
  end

  def unflag
    @flagged = false
  end

  def reveal
    @hidden = false
  end


end
