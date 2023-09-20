# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  def initialize
    @suit = 'Ace'
    @value = '11'
  end

  def points
    10
  end
end

class Deck
  attr_accessor :cards 

  def initialize
    @cards = []
  end

  def generate
    52.times do
      @cards << Card.new
    end
    @cards.shuffle
  end

  def take_card
    @cards.pop
  end
end

class Player
  attr_accessor :cards

  def initialize
    @balance = 100
    @cards = []
    @hand = []
  end

  def show_hidden_cards
    # найти метод который замещает значение * но не изменяет исходного значения переменной
    @cards.each {|card| puts card}
  end

  def show_cards
    @cards.each { |card| puts card }
  end

  # делаем ход
  def make_move
    # @cards.pop
    puts "#{self} делает ход"
  end

  # не знал как сделать метод подсчета в очках через карты
  def points
    @cards.map(&:points).sum
  end

  def hand
    @cards << Card.new
    # if @cards > 3
    # raise 'не более трех карт'
  end
end

class Game
  # не додумал сам, что нужно создать экземпляры классов.
  def initialize
    @deck = Deck.new
    @deck.generate
    @player = Player.new
    @dealer = Player.new
  end

  def start
    puts 'Запрос имени'
    ask_name
    loop do
      play_round
      make_bet
      balance_process
      player_actions
      dealer_actions
      define_winner
      play_again?
      break if exit
    end
  end

  def ask_name
    puts 'Please input your name: '
    puts 'Gamer!'
  end

  def play_round
    @player.cards = []
    @dealer.cards = []

    2.times do
      @player.cards << @deck.take_card
      @dealer.cards << @deck.take_card
    end

    show_status

    @dealer.make_move
    @player.make_move
  end

  # делаем ставку
  def make_bet
    # bet_amount = 10
    # @player.balance -= bet_amount
    # @dealer.balance -= bet_amount
  end

  def show_status
    puts "player card is #{@player.show_cards}"
    puts "dealer card is #{@dealer.show_hidden_cards}"
    # @cards
  end

  # реализую через else if или case (это наброски чернового варианта)
  def player_actions
    # puts 'Ask player about action?'
    # gets.chomp
    # if 1 == 'Пропустить ход'
    #   # делаем
    #   dealer_actions
    # elsif 2 == 'Добавить одну карту'
    #   # делаем
    #   @player.hand
    # else
    #   # делаем
    #   @player.show_cards
    #   @dealer.show_cards
    # end
  end

  def dealer_actions
    # dealer_points = @dealer.points

    # if dealer_points >= 17
    #   # Дилер останавливается при 17 очках и более
    #   player_actions
    # else
    #   # Дилер берет еще одну карту
    #   @dealer.hand
    # end
  end

  def define_winner
    nil if @player.points == @dealer.points
    # player_points = @player.points
    # dealer_points = @dealer.points
    # if player_points > 21
    #   puts 'У игрока больше 21! Дилер выигрывает.'
    # elsif dealer_points > 21
    #   puts 'У дилера больше 21! Игрок выигрывает.'
    # elsif player_points > dealer_points
    #   puts "#{@player} won!"
    # elsif player_points < dealer_points
    #   puts "#{@dealer} won!"
    # else
    #   puts 'Draw!'
    # end
  end

  def balance_process
    #  raise "не введено"
    #  true
    # if @player # если игрок победил, дополню условие
    #   @player.balance += 10
    #   @dealer.balance -= 10
    # elsif @player.balance -= 10
    #   @dealer.balance += 10
    # else
    #   raise 'Not implemented'
    # end
  end

  def play_again?
    puts 'One more game? (y/n): '
    gets.chomp
    true
  end
  
  def exit
    puts 'Input 0 for exit'
    gets.chomp.to_i.zero?
  end
end

Game.new.start
