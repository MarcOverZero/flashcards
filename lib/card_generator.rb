require_relative './deck'
require 'pry'
class CardGenerator
  attr_reader :filename, :lines

  def initialize(filename)
    @filename = filename
    @lines = lines

  end

  def file_reader
  file = File.open(ARGV[0],"r")
  @lines = file.readlines
  binding.pry
  make_cards
  end

  def make_cards
    lines.each do |line|
    csv = line.split(",")
    question = csv[0]
    answer = csv[1]
    Card.new(answer,question)
    end
  end


end



# handle =File.open(ARGV[0],"r")
#
# incoming_text = handle.read
#
# handle.close
