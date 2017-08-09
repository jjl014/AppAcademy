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
      row.each_with_index do |el, idx2|
        if @cursor.cursor_pos == [idx1,idx2]
          print "|#{el.value}|".colorize(:red)
        else
          print "|#{el.value}|"
        end
      end
      puts "\n"
    end
  end

end
