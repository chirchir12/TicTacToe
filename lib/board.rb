require_relative 'ui.rb'

class Board
  include UserInterface
  attr_accessor :cells, :option, :player_name, :state, :message

  def initialize
    @cells = { '1' => [' ', '1'], '2' => [' ', '2'], '3' => [' ', '3'], '4' => [' ', '4'],
               '5' => [' ', '5'], '6' => [' ', '6'], '7' => [' ', '7'], '8' => [' ', '8'], '9' => [' ', '9'] }
    @option = 'Press Q to quit, R to restart'
    @player_name = 'PLAYER-1'
    @message = 'WELCOME! PLEASE CHOOSE ONE OF THE NINE CELLS'
    @state = 'ON'
  end

  def toggle_players
    @player_name = @player_name == 'PLAYER-1' ? 'PLAYER-2' : 'PLAYER-1'
  end
end
