require 'pry'
require './lib/deck'
require './lib/card'
require './lib/round'
require './lib/guess'


cards = CardGenerator.new(filename)
deck = Deck.new([cards])
round = Round.new(deck)

round.start
