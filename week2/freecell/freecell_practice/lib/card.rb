require 'colorize'
require_relative 'errors'

class Card

  SUIT_STRINGS = {
    club: "♣",
    diamond:"♦",
    heart: "♥",
    spade: "♠"
  }

  VALUE_STRINGS = {
    ace: "A",
    two: "2",
    three: "3",
    four: "4",
    five: "5",
    six: "6",
    seven: "7",
    eight: "8",
    nine: "9",
    ten: "10",
    jack: "J",
    queen: "Q",
    king: "K"
  }

  CARD_VALUES = {
    ace: 1,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 11,
    queen: 12,
    king: 13
  }

  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def self.all_cards
    cards = []
    suits.each do |suit|
      values.each do |value|
        cards << self.new(value, suit)
      end
    end
    cards
  end

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUE_STRINGS.keys
  end

  def to_s
    "#{VALUE_STRINGS[value]}#{SUIT_STRINGS[suit]}"
  end

  def num
    CARD_VALUES[value]
  end

  def stackable?(other_card)
    if value == :king
      raise UserError.new("card is a king")
    elsif self.color != other_card.color
      return true if CARD_VALUES[self.value] + 1 == CARD_VALUES[other_card.value]
    end
    false
  end

  def color
    case suit
    when :spade, :club
      :black
    when :diamond, :heart
      :red
    end
  end

  def display(bg = :white)
    to_s.rjust(3).colorize(background: bg, color: color)
  end
end
