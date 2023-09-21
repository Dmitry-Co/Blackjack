require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'

class Game
  def initialize
    greeting
    @player_name = player_name
    @deck = Deck.new
    @deck.generate
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    start_notification
    loop do
      play_round
      make_bet
      bank_process
      player_actions
      dealer_actions
      define_winner
      play_again?
      break if exit
    end
  end

  def greeting
    puts 'Welcome to the Black Jack game'
  end

  def player_name
    puts 'Please enter your name: '
    gets.chomp
  end

  def start_notification
    puts "Hello #{@player_name}! Game has started! Good luck!"
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

  def bank_process
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