class Deck
  attr_accessor :cards 

  def initialize
    @cards = []
  end

  def generate
    52.times do
    @cards << Card.new(@name)
    end
    @cards.shuffle
  end
  
  def take_card
    @cards.pop
  end
end