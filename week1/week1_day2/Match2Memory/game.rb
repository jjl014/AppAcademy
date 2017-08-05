require_relative 'card'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board
  def initialize(player, num_cards=20,  dictionary = nil)
    @board = Board.new(num_cards, dictionary)
    @player = player
  end

  def play
    until @board.won?
      play_turn
    end
    puts "you won, nice"

  end

  def play_turn

    @board.render
    choice1 = @player.first_turn
    p "choice1: #{choice1}"
    result1 = @board.reveal(choice1)
    p "choice1: #{result1}"
    @player.update(result1, choice1)
    @board.render
    choice2 = @player.second_turn(result1, choice1)
    result2 = @board.reveal(choice2)
    @player.update(result2, choice2)
    @board.render
    if (result1.name == result2.name) && !result1.equal?(result2)
      puts "You've got a match! ;)"
    else
      puts "Too bad"
      result1.hide
      result2.hide
    end
    p "memory: #{@player.memory}"
  end

end
