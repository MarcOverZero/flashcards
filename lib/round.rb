require 'pry'
class Round
  attr_reader :deck, :guesses, :active_card, :guess

  def initialize(deck)
    @deck = deck
    @guesses = []
    @active_card = 0  # replace with guesses.count
    @guess = nil
  end

  def current_card
    deck.cards[active_card]
  end
  def record_guess(response)
    guess= Guess.new(response,current_card)
    @active_card += 1
    @guesses << guess
    guess
  end
  def number_correct
    correct_guess_counter = 0
    @guesses.each do |guess|
      if guess.correct?
      correct_guess_counter += 1
      end
    end
    correct_guess_counter
  end

  def percent_correct
    (number_correct.to_f / guesses.count.to_f)*100
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards.
   -------------------------------------------------"

    deck.cards.each do |card_we_care_about|

  "This is card number #{deck.cards.index(card_we_care_about)+1} out of #{deck.count}."
  # no + 1 next time


    puts "Question: #{card_we_care_about.question}"
    response = gets.chomp


    guess = record_guess(response)
    puts guess.feedback

    #guess = Guess.new(gets.chomp, current_card)
    # binding.pry

    end
    puts "****** Game over! ******
    You had #{number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}%."
  end





  # #This is card number 2 out of 4.
  # # Question: What is Rachel's favorite animal?
  # # panda
  # # Incorrect.
  # # This is card number 3 out of 4.
  # # Question: What is Mike's middle name?
  # # nobody knows
  # # Correct!
  # # This is card number 4 out of 4.
  # # Question: What cardboard cutout lives at Turing?
  # # Justin Bieber
  # # Correct!
  # # ****** Game over! ******
  # # You had 3 correct guesses out of 4 for a score of 75%."
  #


end
