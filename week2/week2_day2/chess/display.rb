require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end


  def render
    @board.grid.each_with_index do |row, idx1|
      row.each_with_index do |piece, idx2|
        colors = color_options(idx1, idx2)
        print piece.to_s.colorize(colors)
      end
      puts "\n"
    end
  end

  def color_options(i, j)
    if @cursor.cursor_pos == [i, j]
      bg = :red
    elsif (i+j).odd?
      bg = :black
    else
      bg = :white
    end
    {background: bg}
  end

end
