class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
    @score = 0
  end

  def take_card(card)
    @cards << card
    @score
  end

  def show
    @cards.reduce('') { |acc, card| acc + "#{card.name} " }.lstrip
  end

  def show_hidden
    @cards.reduce('') { |acc, _card| acc + '**'}.lstrip
  end

  def score_hidden
    'XX'
  end
end