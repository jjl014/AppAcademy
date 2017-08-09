require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @null_piece = NullPiece.instance
    setup
  end

  def setup
    @grid = Array.new(8) { Array.new(8, @null_piece) }
    [:light_cyan, :light_magenta].each do |color|
      fill_back_row(color)
      fill_pawn_row(color)
    end
  end

  def fill_back_row(color)
    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    i = (color == :light_cyan) ? 0 : 7
    back_pieces.each_with_index do |piece, j|
      piece.new(color, self, [i,j])
    end
  end

  def fill_pawn_row(color)
    i = (color == :light_cyan) ? 1 : 6
    8.times { |j| Pawn.new(color, self, [i,j]) }
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def []=(pos, obj)
    x, y = pos
    @grid[x][y] = obj
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def in_bounds?(pos)
    r, c = pos
    r.between?(0, 7) && c.between?(0, 7)
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(Piece)
      if in_bounds?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = @sentinel
      else
        raise "Not a valid end position"
      end
    else
      raise "No piece at start position"
    end
  end
end
