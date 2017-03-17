require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/round'
require_relative '../lib/guess'
require_relative '../lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)
    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_a_filename
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    assert_equal "cards.txt" , card_generator.filename
  end

  def test_it_has_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal [<Card:0x007f9f1413cbe8 @answer="10", @question="What is 5 + 5?">,
 <Card:0x007f9f1413c788 @answer="red panda", @question="What is Rachel's favorite animal?">,
 <Card:0x007f9f1413c2b0 @answer="nobody knows", @question="What is Mike's middle name?">,
 <Card:0x007f9f14137da0 @answer="Justin bieber", @question="What cardboard cutout lives at Turing?">], cards

  end
end
