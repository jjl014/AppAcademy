class Hanoi
  attr :towers
  def initialize(towers = nil)
    @towers = towers || [[3,2,1], [], []]
  end

  def play
    display

    until won?
      puts "Choose a tower to move a disk from:"
      from = gets.chomp.to_i
      puts "Choose a tower to move the disk to"
      to = gets.chomp.to_i
      if valid_move?(from, to)
        move(from,to)
        display
      else
        display
        puts "Invalid move. Try again."
      end
    end

    puts "You win!"
    reset
  end

  def reset
    @towers = [[3,2,1],[],[]]
  end

  def won?
    @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
  end

  def valid_move?(from, to)
    return false unless [from, to].all? {|t| t.between?(0,2)}
    return false if @towers[from].empty?
    @towers[to].empty? || @towers[from].last < @towers[to].last
  end

  def move(from, to)
    raise "cannot move from an empty tower" if @towers[from].empty?
    raise "cannot move onto a smaller disk" unless valid_move?(from, to)
    @towers[to] << @towers[from].pop
  end

  def render
    to_render = ""
    towers.each_index do |i|
      to_render << "Tower #{i}: #{@towers[i].join(" ")}\n"
    end
    to_render
  end

  def display
    system('clear')
    puts render
  end
end

if __FILE__ == $PROGRAM_NAME
  Hanoi.new.play
end
