require_relative 'interface'
require_relative 'player'
require_relative 'dealer'
require_relative 'deck'
require_relative 'card'
require_relative 'hand'
require_relative 'round'
require_relative 'game'

game = Game.new(100, 10)
game.play
