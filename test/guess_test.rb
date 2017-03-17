require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'
require_relative '../lib/card'

class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
  end
  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end
  def test_it_recieves_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end
  def test_it_can_assess_accuracy
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end
  def test_it_recieves_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!" , guess.feedback
  end
  def test_other_cards_work
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Saturn", guess.response
    assert_equal false , guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end
  

end
