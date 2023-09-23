class Deck
  attr_reader :deck

  def initialize
    @deck = make_deck.shuffle
  end
  
  def deal_card
    @deck.pop
  end

  def make_deck
    Card::RANK.product(Card::SUITS).map { |rank, suit| Card.new(rank, suit) }
  end
end
