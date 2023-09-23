class Deck
  attr_accessor :make_deck

  def initialize
    @deck = make_deck.shuffle
  end

  def generate
    cards = []
    @faces.each do |face|
      @suits.each do |suit|
        cards << Card.new(face: face, suit: suit)
      end
    end
    cards.shuffle
  end
  
  def deal_card
    @deck.pop
  end

  def make_deck
    
  end
end