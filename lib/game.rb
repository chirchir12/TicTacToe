class Game
  attr_accessor :board
  def initialize
    @board = Board.new
  end

  def display
    @board.ui.display
  end

  def display_status
    system('clear')
    @board.status_ui.display
  end

  def read_input
    board.player_move = gets.chomp
  end

  def process_input
    case board.check_input_availability
    when 'continue'
      update
    when 'exit'
      quit
    when 'taken'
      position_taken_error
    when 'restart'
      system('clear')
      restart
    end
  end

  def quit
    system('clear')
  end

  def process_error
    case board.check_input_validity
    when 'wrong_input'
      wrong_input
    when 'no_input'
      no_input
    end
  end

  def wrong_input
    board.message = "\n   Wrong Input , Please choose form 1-9"
  end

  def position_taken_error
    board.message = "\n       That position is taken,\n" + '    choose form the available ones'
  end

  def no_input
    board.message = "\n   Please choose form the available cells "
  end

  def update
    board.toggle_players
    board.assign_cell
    board.message = "\n   Please choose from the available cells"
    board.compute_state
    decide
    act_on_decision
  end

  def decide
    if board.state == 'WIN'
      board.message = "         #{board.current_player.name} has Won"
    elsif board.state == 'tie'
      board.message = "          It's a tie"
    end
  end

  def act_on_decision
    if board.state == 'WIN'
      restart
    elsif board.state == 'tie'
      restart
    elsif board.state == 'continue'
      continue
    end
  end

  def continue
    system('clear')
    display
    read_input
    process_input
    process_error
    continue
  end

  def restart
    display_status if board.state == 'WIN' || board.state == 'tie'

    system('ruby main')
  end

  def start
    Game.new
    continue
  end
end
