class Round
  def initialize(player1, player2)
    @player = player1
    @dealer = player2
  end

  def play
    setup_round
    player_cards(@dealer)
  end

  def setup_round
    deal_cards(@player, 2)
    deal_cards(@dealer, 2)
    player_cards(@player, :open)
    player_cards(@dealer, :hidden)
  end

  def deal_cards(player, quantity)
    quantity.times { player.hand.take_card(@deck.deal_card) }
  end

  def player_cards(player, type = :show)
    if type == :hidden
      Interface.show_cards(player.name, player.hand.show_hidden, player.hand.score_hidden)
    else
      Interface.show_cards(player.name, player.hand.show, player.hand.score)
    end
  end
end
