require_relative 'card'

class Board
  attr_accessor :grid

  def initialize(num_cards=20, dictionary)
    @grid = Array.new(2) {Array.new(num_cards/2)}
    @dict = dictionary
    @dict ||= default_dict
    populate
  end

  def default_dict
    ("a".."z").map(&:to_sym)
  end

  def populate
    new_arr = []
    dict = @dict.map {|name| Card.new(name)}
    @grid[0].length.times do
      card_name = dict.pop
      new_arr.concat([card_name])
      new_arr.concat([card_name.dup])
    end
    p new_arr
    new_arr.shuffle!
    p new_arr
    @grid[0] = new_arr[0...new_arr.length/2]
    @grid[1] = new_arr[(new_arr.length/2)...new_arr.length]
  end

  def render
    print "    "
    (1..@grid[0].length).each { |n| print "#{n}    "}
    puts
    puts "1 #{@grid[0].map(&:face)}"
    puts "2 #{@grid[1].map(&:face)}"
  end

  def won?
    @grid.all? do |row|
      row.all?(&:face_up)
    end
  end

  def reveal(pos)
    p pos
    row, col = pos
    @grid[row][col].reveal
    @grid[row][col]
  end

end
