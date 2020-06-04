require_relative 'ui.rb'
require_relative 'player'
class Board
  include UserInterface
  attr_accessor :state, :player_move, :current_player, :player1, :player2, :message, :cells, :next_player

  def initialize
    @cells = { '1' => [' ', '1'], '2' => [' ', '2'], '3' => [' ', '3'], '4' => [' ', '4'],
               '5' => [' ', '5'], '6' => [' ', '6'], '7' => [' ', '7'], '8' => [' ', '8'], '9' => [' ', '9'] }
    @player1 = Player.new('Player-1', 'X')
    @player2 = Player.new('Player-2', 'O')
    @current_player = player1
    @next_player = player2
    @message = "\n  WELCOME! PLEASE CHOOSE ONE OF THE NINE CELLS"
    @state = 'continue'
    @player_move = ' '
  end

  def extract_values
    result = []
    @cells.values.each do |i|
      result << i[0]
    end
    result
  end

  def finished?
    if !extract_values.include?(' ')
      true
    else
      false
    end
  end

  def extract_rows
    rows = []
    [0, 3, 6].each do |i|
      rows << [extract_values[i], extract_values[i + 1], extract_values[i + 2]]
    end
    rows
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

  def check_rows
    extract_rows.each do |i|
      @state = 'WIN' if i.all?('X') or i.all?('O')
    end
  end

  def check_columns
    extract_columns.each do |i|
      @state = 'WIN' if i.all? 'X' or i.all? 'O'
    end
  end

  def check_diagonals
    extract_diagonals.each do |i|
      @state = 'WIN' if i.all? 'X' or i.all? 'O'
    end
  end

  def check_win
    check_rows
    check_columns
    check_diagonals
  end

  def check_tie
    @state = 'tie' if @state != 'WON' && finished?
  end

  def check_continue
    @state = 'continue' if @state != 'WON' || @state != 'tie'
  end

  def toggle_players
    @current_player = if current_player == player1
                        player2
                      else
                        player1
                      end
    @next_player = if current_player == player1
                     player2
                   else
                     player1
                   end
  end

  def compute_state
    check_continue
    check_tie
    check_win
  end

  def display
    ui
  end

  def display_status
    status_ui
  end

  def assign_cell
    cells[player_move][0] = current_player.symbol
    cells[player_move][1] = ' '
  end
end
