class Foundation < Pile
  def self.all_foundations
    Card.suits.map { |suit| Foundation.new(suit) }
  end

  attr_reader :suit

  def initialize(suit, cards = [])
    @suit = suit
    @cards = cards
  end

  def complete?
    @cards.count == 13
  end

  def to_s
    empty? ? "[ #{Card::SUIT_STRINGS[suit]}]" : "[#{top_card}]"
  end

  def valid_move?(card)
    if empty? && card.value == :ace && card.suit == @suit
      return true
    elsif !empty? &&
      Card::CARD_VALUES[@cards.last.value] + 1 == Card::CARD_VALUES[card.value]
      return true
    end
    false
  end
end
