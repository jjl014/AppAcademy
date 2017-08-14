require 'colorize'
require_relative 'errors'

class Card

  # check the protected methods and assets!

  def self.suits
    [:spade, :diamond, :club, :heart]
  end

  def self.values
    [
      :ace,
      :two,
      :three,
      :four,
      :five,
      :six,
      :seven,
      :eight,
      :nine,
      :ten,
      :jack,
      :queen,
      :king
    ]
  end

  def self.all_cards
    cards = []
    self.suits.each do |suit|
      self.values.each do |value|
        cards << self.new(value,suit)
      end
    end
    cards
  end

  attr_reader :value, :suit

  def initialize(value, suit)
    @value, @suit = value, suit
  end

  def to_s
    "#{VALUE_STRINGS[self.value]}#{SUIT_STRINGS[self.suit]}"
  end

  def num
    NUM_VALUES[self.value]
  end

  def stackable?(card)
    # use the Card::color method down below!
    if self.value == :king
      raise UserError.new("card is a king")
    elsif self.color != card.color
      return true if NUM_VALUES[self.value]+1 == NUM_VALUES[card.value]
    end
    false
  end

  def display(bg_color = :white)
    to_s.rjust(3).colorize(:background => bg_color, :color => color)
  end

  protected

  def color
    case suit
    when :spade, :club
      :black
    when :heart, :diamond
      :red
    end
  end

  NUM_VALUES = {
    :ace => 1,
    :two => 2,
    :three => 3,
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7,
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13
  }

  VALUE_STRINGS = {
    :ace => "A",
    :two => "2",
    :three => "3",
    :four => "4",
    :five => "5",
    :six => "6",
    :seven => "7",
    :eight => "8",
    :nine => "9",
    :ten => "10",
    :jack => "J",
    :queen => "Q",
    :king => "K"
  }

  SUIT_STRINGS = {
    :spade => "♠",
    :heart => "♥",
    :club => "♣",
    :diamond => "♦"
  }

end
