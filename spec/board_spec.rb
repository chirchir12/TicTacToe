require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#extract_values' do
    it 'returns an empty array values for the cells of board' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                      '5' => [' X', '5'], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8],
                      '9' => %w[O 9] }
      expect(board.extract_values).to eql(['X', 'O', 'X ', 'O', ' X', 'O', 'O', 'X', 'O'])
    end
  end

  describe '#finished?' do
    it 'it returns true for a finished game' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                      '5' => [' X', '5'], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8],
                      '9' => %w[O 9] }
      expect(board.finished?).not_to eql(false)
    end
  end

  describe '#extract_rows' do
    it 'returns an empty array values for the rows of a cell' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                      '5' => [' X', '5'], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8],
                      '9' => %w[O 9] }
      expect(board.extract_rows).to eql([['X', 'O', 'X '], ['O', ' X', 'O'], %w[O X O]])
    end
  end

  describe '#extract_columns' do
    it 'returns an empty array values for the columns of a cell' do
      expect(board.extract_columns).to eql([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#extract_diagonals' do
    it 'returns an empty array values for the diagonals of a cell' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                      '5' => [' X', '5'], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8],
                      '9' => %w[O 9] }
      expect(board.extract_diagonals).to eql([['X', ' X', 'O'], ['X ', ' X', 'O']])
    end
  end

  describe '#check_win' do
    it 'returnS "WIN" for empty set of rows' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                      '5' => [' X', '5'], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8],
                      '9' => %w[O 9] }
      expect(board.check_win).not_to eql('WIN')
    end
  end

  describe '#check_win' do
    it 'return true for empty set of rows' do
      board.cells = { '1' => %w[X 1], '2' => %w[X 2], '3' => %w[X 3], '4' => %w[O 4],
                      '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => %w[O 9] }
      board.check_win
      expect(board.state).to eql('WIN')
    end
  end

  describe '#check_columns' do
    it 'doesn\'t return "WIN"for empty column' do
      expect(board.check_columns).not_to eql('WIN')
    end
  end

  describe '#check_rows' do
    it 'doesn\'t return "WIN"for empty row' do
      expect(board.check_rows).not_to eql('WIN')
    end
  end

  describe '#check_diagonals' do
    it 'doesn\'t return "WIN"for empty diagonal' do
      expect(board.check_diagonals).not_to eql('WIN')
    end
  end

  describe '#check_tie' do
    it 'returns tie for no-win finished game' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                      '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => %w[O 9] }
      expect(board.check_tie).to eql('tie')
    end
  end

  describe '#check_continue' do
    it 'returns "continue" for a non-finished ,no win game' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => %w[X 3], '4' => %w[O 4],
                      '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => [' ', '9'] }
      expect(board.check_continue).to eql('continue')
    end
  end

  describe '#toggle_players' do
    it 'returns "player2" for current player' do
      board.toggle_players
      expect(board.current_player).to eql(board.player2)
    end
  end

  describe '#compute_state' do
    it 'returns "tie" for no-win end' do
      board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => %w[X 3], '4' => %w[O 4],
                      '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => %w[O 9] }
      board.compute_state
      expect(board.state).to eql('tie')
    end
  end

  describe '#check_input_availability' do
    it 'returns exit for e' do
      board.player_move = 'e'
      board.check_input_validity
      expect(board.check_input_availability).to eql('exit')
    end
  end
end
