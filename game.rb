require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'

class Game
  include Interface

  attr_reader :player1, :player2, :bet

  def initialize(bank = 100, bet = 10)
    Interface.welcome_message
    @bank_start = bank
    @bet = bet
    @round_counter = 0
    @player1 = Player.new(Interface.name, bank)
    @player2 = Dealer.new('Dealer', bank)
    @players = [@player1, @player2]
  end

  def play
    loop do
      main
      what_next = menu(Interface::GAME_MENU)
      break if what_next == :exit

      reset_cards
    end
    show_final(player1.name, player1.bank - @bank_start)
  end

  def main
    Interface.show_round_welcome(@round_counter += 1)
    @payers.each { |pl| Interface.show_status(pl.name, pl.bank) }
    bets_make
    round = Round.new(player1, player2)
    round.play
    
  end

    def bets_make
      player1.place_bet(@bet)
      player2.place_bet(@bet)
    end

    def bets_back
      player1.topup_bank(@bet)
      player2.topup_bank(@bet)
    end

    def reset_cards
      player1.hand.reset
      player2.hand.reset
    end
end