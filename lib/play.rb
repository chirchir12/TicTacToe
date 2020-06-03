module Play
  def read_input
    board.player_move = gets.chomp
  end

  def check_input_validity
    if board.player_move.empty?
      'no_input'
    elsif !%w[1 2 3 4 5 6 7 8 9 e E r R].include?(board.player_move)
      'wrong_input'
    else
      'good'
    end
  end

  def check_input_availability
    return unless check_input_validity == 'good'

    if board.player_move == 'e'
      'exit'
    elsif board.player_move == 'r'
      'restart'
    elsif board.cells[board.player_move][0] != ' '
      'taken'
    else
      'continue'
    end
  end

  def process_input
    case check_input_availability
    when 'continue'
      update
    when 'exit'
      quit
    when 'taken'
      position_taken_error
    when 'restart'
      restart
    end
  end

  def quit
    system('clear')
  end

  def process_error
    case check_input_validity
    when 'wrong_input'
      wrong_input
    when 'no_input'
      no_input
    end
  end

  def wrong_input
    board.message = "\n   Wrong Input , Please choose form 1-9"
    continue
  end

  def position_taken_error
    board.message = "\n       cleaThat position is taken,\n" + '    choose form the available ones'
    continue
  end

  def no_input
    board.message = "\n   Please choose form the available cells "
    continue
  end

  def update
    board.toggle_players
    board.assign_cell
    board.message = "\n   Please choose from the available cells"
    board.compute_state
    decide
  end

  def decide
    if board.state == 'WIN'
      board.message = "         #{board.current_player.name} has Won"
      restart
    elsif board.state == 'tie'
      board.message = "It's a tie"
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
  end

  def display
    game.display
  end

  def display_status
    game.display_status
  end

  def restart
    display_status if board.state == 'WIN'
    system('ruby main')
  end

  def start
    Game.new
    continue
  end
end
