class Card
  attr_reader :suit, :value, :cards

  def initialize
    @suit = 'Ace'
    @value = '11'
    @cards = []
  end

  def points
    10
  end
end