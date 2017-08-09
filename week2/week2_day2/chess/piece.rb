require 'singleton'

class Piece
  attr_reader :board, :color
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

    board.add_piece(self, pos)
  end

  def to_s
    " #{symbol} "
  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :none
  end

  def symbol
    ' '
  end
end

class Rook < Piece
  def symbol
    '♜'.colorize(color)
  end
end

class Knight < Piece
  def symbol
    '♞'.colorize(color)
  end
end

class Bishop < Piece
  def symbol
    '♝'.colorize(color)
  end
end

class Queen < Piece
  def symbol
    '♛'.colorize(color)
  end
end

class King < Piece
  def symbol
    '♚'.colorize(color)
  end
end

class Pawn < Piece
  def symbol
    '♟'.colorize(color)
  end
end
