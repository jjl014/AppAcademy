class Player
  def prompt
    puts "Pick a card (row, col)"
  end

  def get_input
    gets.chomp.split(",").map {|n| n.to_i - 1}
  end
end
