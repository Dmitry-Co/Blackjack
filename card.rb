class Card
  
  FACES = %w[2 3 4 5 6 7 8 9 10 J Q K]
  SUITS = %w[♣ ♥ ♠ ♦]
  
  attr_reader :name, :value

  def initialize(args = {})
    #@cards = []
    @face = args[:face]
    @suit = args[:suit]
    @name = create_name
   #{} @value = set_value
  end

  def create_name
    return ' ' unless @face && @suit
    @face + @suit
  end

  def points
    10
  end
end