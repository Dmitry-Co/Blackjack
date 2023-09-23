class Player
  iclude Interface

  attr_reader :name, :bank, :hand

  def initialize(name, bank)
    @name = name
    @bank = bank
    @hand = Hand.new
  end

  def decision
    Interface.menu(Interface::CHOICE_MENU)
  end

  def place_bet(bet)
    @bank -= bet
  end
  
   def topup_bank(num)
    @bank += num
   end
end
