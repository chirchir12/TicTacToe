require_relative './play'
class Game
  include Play
  attr_accessor :players, :current_player, :player_move, :number_of_moves, :board
  def initialize
    @board = Board.new
    @current_player = 'PLAYER-1'
    @number_of_moves = 0
    @player_move = nil
  end
end
