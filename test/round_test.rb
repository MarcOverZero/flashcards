require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/round'
require_relative '../lib/guess'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end
  def test_round_has_a_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end
  def test_it_has_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end
  def test_round_has_a_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1 ,round.current_card
  end
  def test_it_records_the_number_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", card_1)

    assert_equal "Juneau", round.record_guess("Juneau").response
  end
  def test_it_can_count_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count

  end
  def test_it_can_validate_a_guess

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_can_count_the_number_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback

    assert_equal 1, round.number_correct

  end

  def test_it_knows_which_card_is_current
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("93,000,000")

    assert_equal card_2, round.current_card
  end

  def test_it_records_the_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal "2" , round.record_guess("2")

  end


  def test_it_records_number_of_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("93,000,000")

    assert_equal 2, round.guesses.count

  end

  def test_it_can_reject_a_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("2")

    assert_equal "Incorrect." , round.guesses.last.feedback


  end

  def test_it_knows_how_many_are_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal 1 , round.number_correct


  end

  def test_it_knows_percent_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("2")

    assert_equal 50 , round.percent_correct
  end




end
