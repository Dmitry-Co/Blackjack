class Player < User
  attr_accessor :cards

  def initialize
    super
  end

  def show_cards
    @cards.each { |card| puts card }
  end

  # делаем ход
  def make_move
    # @cards.pop
    puts "#{self} делает ход"
  end

  def points
    @cards.map(&:points).sum
  end

  def hand
    @cards << Card.new
    # if @cards > 3
    # raise 'не более трех карт'
  end
end
