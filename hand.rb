class Hand
  def initialize
    @cards = []
  end

  def take_card(card)
    @cards << card
  end
end