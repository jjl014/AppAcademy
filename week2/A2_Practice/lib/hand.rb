class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    new_hand = deck.take(2)
    Hand.new(new_hand)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    @cards.each do |card|
      begin
        points += card.blackjack_value
      rescue
        # Takes care of the case where there's an ace
        if points + 11 == 21
          points += 11
        else
          points += 1
        end
      end
    end
    points
  end

  def busted?
    return true if points > 21
    false
  end

  def hit(deck)
    raise("already busted") if busted?
    @cards.concat(deck.take(1))
  end

  def beats?(other_hand)
    if self.busted?
      false
    elsif other_hand.busted?
      true
    else
      self.points > other_hand.points
    end
  end

  def return_cards(deck)
    to_return = []
    @cards.count.times do
      to_return << @cards.pop
    end
    deck.return(to_return)
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
