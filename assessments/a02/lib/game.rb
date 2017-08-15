class Game
  attr_reader :free_cells, :foundations, :tableau, :move_history

  def initialize
    @free_cells = Array.new(4) { FreeCell.new }
    @foundations = Foundation.all_foundations
    @tableau = Array.new(8) { Tableau.new }
    deal_tableau
    @move_history = []
    # ...
  end

  def deal_tableau
    cards = Card.all_cards
    cards.shuffle!
    until cards.empty?
      @tableau.each_index do |i|
        @tableau[i].cards << cards.pop unless cards.empty?
      end
    end
  end

  def move!(from_pile, to_pile)
    to_pile << from_pile.draw
  end

  def move(from_pile, to_pile)
    raise "invalid move" unless valid_move?(from_pile, to_pile)
    move!(from_pile, to_pile)
    @move_history << [from_pile, to_pile]
  end

  def undo_move
    raise "No moves have been made" if @move_history.empty?
    previous_move = @move_history.pop
    move!(previous_move[1], previous_move[0])
  end

  def valid_move?(from_pile, to_pile)
    return false if from_pile.empty?
    to_pile.valid_move?(from_pile.top_card)
  end

  def won?
    @foundations.all? {|foundation| foundation.count == 13}
  end
end
