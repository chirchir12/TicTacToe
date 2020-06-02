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
end
