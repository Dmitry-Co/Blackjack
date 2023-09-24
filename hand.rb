class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def take_card(card)
    @cards << card
  end
  def show_hidden
    @cards.reduce('') { |acc, _card| acc + '**'}.lstrip
  end

  def score_hidden
    'XX'
  end
end