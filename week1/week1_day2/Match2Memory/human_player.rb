class HumanPlayer
  def get_input
    puts "Pick a card (row, col)"
    gets.chomp.split(",").map {|n| n.to_i - 1}
  end
end
