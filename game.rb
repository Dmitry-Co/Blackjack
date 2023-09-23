require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'player'
require_relative 'dealer'

class Game
  attr_reader :player1, :player2, :bet

  def initialize(bank = 100, bet = 10)
    Interface.welcome_message
    @player1 = Player.new(Interface.name, bank)
    @palyer2 = Dealer.new('Dealer', bank)
    @bank = bank
    @bet = bet
  end

    def bets_make
      player1.place_bet(@bet)
      player2.place_bet(@bet)
    end

    def bets_back
      player1.topup_bank(@bet)
      palyer2.topup_bank(@bet)
    end
end