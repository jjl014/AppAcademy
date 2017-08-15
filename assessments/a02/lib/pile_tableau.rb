class Tableau < Pile
  def to_s
    empty? ? "[  ]" : "[#{cards.join(', ')}]"
  end

  def valid_move?(card)
    if empty? || (@cards.last.color != card.color &&
      Card::CARD_VALUES[@cards.last.value] - 1 == Card::CARD_VALUES[card.value]) 
      return true
    elsif @cards.last.color == card.color
      return false
    end
    false
  end
end
