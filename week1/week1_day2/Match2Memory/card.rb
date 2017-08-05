class Card
  attr_reader :name
  attr_accessor :face_up

  def initialize(name)
    @name = name
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @name.to_s
  end

  def ==(other_card)
    @name = other_card.name
  end

  def face
    if @face_up
      @name.to_s
    else
      "*"
    end
  end
end
