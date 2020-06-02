module Play
  def read_input
    @player_move = gets.chomp
  end

  def check_input_validity
    if player_move == ''
      'no input'
    elsif !%w[1 2 3 4 5 6 7 8 9 e E r R].include?(player_move)
      'wrong input'
    else
      'good'
    end
  end

  def check_input_availability
    if (player_move == 'e') || (player_move == 'E')
      'exit'
    elsif (player_move == 'r') || (player_move == 'R')
      'restart'
    elsif cells[player_move][0] != ' '
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
    when 'taken'
      position_taken_error
    when 'no_input'
      no_input
    end
  end

  def wrong_input
    board.message = 'Wrong Input , Please choose form 1-9'
    update
  end

  def position_taken_error
    board.message = 'That position is taken, choose form the available ones'
    update
  end

  def no_input
    board.message = 'Please choose form the available cells '
    update
  end

  def update
    assign_cell compute_state decide
  end

  def assign_cell
    cells[player_move][0] == current_player.symbol
  end

  def compute_state
    check_rows check_columns check_diagonals check_draw check_continue
  end

  def check_tie
    'tie' if state != 'win' and no_of_moves == 9
  end

  def check_continue
    ' continue' if state! win and no_of_moves < 9
  end

  def decide
    if check_state == 'win'
      board.message = "#{current_player} has Won"
      restart
    elsif check_state == 'tie'
      board.message = "It's a tie"
      restart
    elsif check_state == 'continue'
      continue
    end
  end

  def restart
    board.display read_input check_input_validity check_input_availability process_input process_error
  end
end
