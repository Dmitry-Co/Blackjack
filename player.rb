class Player
  iclude Interface

  def initialize(name, bank)
    @name = name
    @bank = bank
    @hand = Hand.new
  end

  def decision
    Interface.menu(Interface::CHOICE_MENU)
  end

end
