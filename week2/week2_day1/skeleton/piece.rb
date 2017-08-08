class Piece
  attr_reader :value
  def initialize(value)
    @value = value
  end

end

class NullPiece < Piece
  def initialize(value)
    super
  end
end
