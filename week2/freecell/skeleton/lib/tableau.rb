require 'byebug'
require_relative 'card'

class Tableau

  def initialize(cards = [])
    @cards = cards
    @cards_taken = []
  end

  def add_cards(cards)
    if empty? || @cards_taken == cards || cards.first.stackable?(last)
      until cards.empty? do
        @cards << cards.shift
      end
      @cards_taken = []
    else
      raise UserError.new("card(s) cannot be stacked on this tableau")
    end
  end

  def empty?
    @cards.empty?
  end

  def last
    @cards.last
  end

  def [](index)
    @cards[index]
  end

  def grabbable?(index)
    c = count - 1
    while index < c
      return false unless self[index+1].stackable?(self[index])
      index += 1
    end
    true
  end

  def grab(index)
    raise UserError.new("cannot grab that card") unless grabbable?(index)
    @cards_taken = @cards.slice!(index..-1)
    @cards_taken
  end

  def count
    @cards.length
  end

  private

end
