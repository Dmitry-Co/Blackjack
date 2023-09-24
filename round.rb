class Round
  def initialize(player1, player2)
    @player = player1
    @dealer = player2
  end

  def play
    setup_round
    moves
    player_cards(@dealer)
  end

  def setup_round
    deal_cards(@player, 2)
    deal_cards(@dealer, 2)
    player_cards(@player, :open)
    player_cards(@dealer, :hidden)
  end

  def moves
    return if move(@player) == :open
    return if move(@dealer) == :open

    move(@player)
  end

  def move
    return :open if player.hand.cards.size == 3

    decision = player.decision
    return :open if decision == :open

    deal_cards(player, 1) if decision == :take
    Interface.show_decision(player.name, decision)
    type = player.class == Dealer ? :hidden : :show
    player_cards(player, type)
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
