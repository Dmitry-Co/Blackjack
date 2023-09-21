class Card
  attr_reader :suit, :value

  def initialize
    @suit = 'Ace'
    @value = '11'
  end

  def points
    10
  end
end