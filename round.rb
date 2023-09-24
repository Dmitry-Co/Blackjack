class Round
  def initialize(player1, player2)
    @player = player1
    @dealer = player2
  end

  def play
    setup_round
  end

  def setup_round
    deal_cards(@player, 2)
    deal_cards(@dealer, 2)
  end

  def deal_cards(player, quantity)
    quantity.times { player.hand.take_card(@deck.deal_card) }
  end
end