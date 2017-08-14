require_relative 'card'

class Tableau
  def initialize(cards = [])
    @cards = cards
    @cards_held = []
  end

  def empty?
    @cards.empty?
  end

  def count
    @cards.length
  end

  def last
    @cards.last
  end

  def [](idx)
    @cards[idx]
  end

  def add_cards(cards)
    if empty? || @cards_held == cards || cards.first.stackable?(last)
      @cards += cards
      @cards_held = []
    else
      raise UserError.new("card(s) cannot be stacked on this tableau")
    end
  end

  def grabbable?(idx)
    while idx < count - 1
      return false unless @cards[idx + 1].stackable?(@cards[idx])
      idx += 1
    end
    true
  end

  def grab(idx)
    raise UserError.new("cannot grab that card") unless grabbable?(idx)
    @cards_held = @cards.slice!(idx..-1)
    @cards_held
  end
end
