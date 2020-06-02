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

  def process_error
    case check_input_validity
    when 'wrong_input'
      wrong_input
    when 'taken'
      position_taken_error
    end
  end

  def update
    assign_cell
    compute_state
    decide
  end

  def assign_cell
    cells[player_move][0] == current_player.symbol
  end

  def compute_state
    check_draw?
    check_rows
    check_columns
    check_diagonals
  end

  def check_rows
    extract_rows.each do |i|
      return 'win' if i.all? 'X' or i.all? 'O'
    end
  end

  def check_columns
    extract_columns.each do |i|
      return 'win' if i.all? 'X' or i.all? 'O'
    end
  end

  def check_diagonals
    extract_diagonals.each do |i|
      return 'win' if i.all? 'X' or i.all? 'O'
    end
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
end
