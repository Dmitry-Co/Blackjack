class Deck
  attr_accessor :cards

  def initialize
    @faces = faces_arr
    @suits = suits_arr
    @cards = generate
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

  def faces_arr
    Card::FACES
  end

  def suits_arr
    Card::SUITS
  end
  
  def take_card
    @cards.pop
  end
end