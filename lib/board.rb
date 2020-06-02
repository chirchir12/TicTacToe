require_relative 'ui.rb'

class Board
  include UserInterface
  attr_reader :cells, :option, :player_name, :state, :message

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

  def extract_values
    result = []
    @cells.values.each do |i|
      result << i[0]
    end
  end

  def extract_columns
    columns = []
    (0..2).each do |i|
      columns << [extract_values[i], extract_values[i + 3], extract_values[i + 6]]
    end
    columns
  end

  def extract_diagonals
    diagonals = []
    diagonals << [extract_values[0], extract_values[4], extract_values[8]]
    diagonals << [extract_values[2], extract_values[4], extract_values[6]]
    diagonals
  end

  def display
    ui
  end
end
