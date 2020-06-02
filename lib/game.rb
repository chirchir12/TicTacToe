require_relative './play'
require_relative './board'
require_relative './player'
class Game
  include Play
  attr_accessor :board
  def initialize
    @board = Board.new
  end
end
