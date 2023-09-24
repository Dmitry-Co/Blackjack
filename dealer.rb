class Dealer < Player
  def decision
    return :open if hand.cards.size == 3
    return :take if hand.score < 17

    :skip
  end
end
