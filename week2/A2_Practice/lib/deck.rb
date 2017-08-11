require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = []
    Card.suits.each do |suit|
      Card.values.each do |val|
        deck << Card.new(suit, val)
      end
    end
    deck
  end

  def initialize(cards = Deck.all_cards)
    @deck = cards
  end

  # Returns the number of cards in the deck.
  def count
    @deck.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise("not enough cards") if n > count
    new_hand = []
    n.times do
      new_hand << @deck.shift
    end
    new_hand
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @deck.push(*cards)
  end
end
