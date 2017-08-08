require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = setup
  end

  def setup
    board = Array.new(8) { Array.new(8) }
    board[0..1].each_with_index do |row, idx1|
      row.map!.with_index {|el, idx2| Piece.new("+")}
    end
    board[2..5].each_with_index do |row, idx1|
      row.map!.with_index {|el, idx2| NullPiece.new("-")}
    end
    board[6..7].each_with_index do |row, idx1|
      row.map!.with_index {|el, idx2| Piece.new("+")}
    end
    board
  end

  def []=(pos, obj)
    x, y = pos
    @grid[x][y] = obj
  end

  def [] (pos)
    x, y = pos
    @grid[x][y]
  end

  def in_bounds?(pos)
    r, c = pos
    r.between?(0, 7) && c.between?(0, 7)
  end

  def move_piece(start_pos, end_pos)
    r1, c1 = start_pos
    r2, c2 = end_pos
    if @grid[r1][c1].is_a?(Piece)
      if in_bounds?(end_pos)
        @grid[r2][c2] = @grid[r1][c1]
        @grid[r1][c1] = nil
      else
        raise "Not a valid end position"
      end
    else
      raise "No piece at start position"
    end
    @grid
  end
end
