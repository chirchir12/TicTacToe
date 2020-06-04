require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#extract_values' do
    it 'returns an empty array values for the cells of board' do
      expect(board.extract_values).to eql([' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#finished?' do
    it 'it returns true for a finished game' do
      expect(board.finished?).to eql(false)
    end
  end

  describe '#extract_rows' do
    it 'returns an empty array values for the rows of a cell' do
      expect(board.extract_rows).to eql([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#extract_columns' do
    it 'returns an empty array values for the columns of a cell' do
      expect(board.extract_columns).to eql([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#extract_diagonals' do
    it 'returns an empty array values for the diagonals of a cell' do
      expect(board.extract_diagonals).to eql([[' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#check_win' do
    board = Board.new
    board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => [' O', '4'],
                    '5' => [' X', '5'], '6' => ['O ', '6'], '7' => [' O', '7'], '8' => ['X ', '8'], '9' => ['O ', '9'] }
    it 'return true for empty set of rows' do
      expect(board.check_win).not_to eql('WIN')
    end
  end

  describe '#check_win' do
    board = Board.new
    board.cells = { '1' => %w[X 1], '2' => %w[X 2], '3' => %w[X 3], '4' => %w[O 4],
                    '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => %w[O 9] }
    board.check_win
    it 'return true for empty set of rows' do
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
    board = Board.new
    board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => ['X ', '3'], '4' => %w[O 4],
                    '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => %w[O 9] }
    it 'returns tie for no-win finished game' do
      expect(board.check_tie).to eql('tie')
    end
  end

  describe '#check_continue' do
    board = Board.new
    board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => %w[X 3], '4' => %w[O 4],
                    '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => [' ', '9'] }
    it 'returns "continue" for a non-finished ,no win game' do
      expect(board.check_continue).to eql('continue')
    end
  end

  describe '#toggle_players' do
    board = Board.new
    board.toggle_players
    it 'returns "player2" for current player' do
      expect(board.current_player).to eql(board.player2)
    end
  end

  describe '#compute_state' do
    board = Board.new

    board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => %w[X 3], '4' => %w[O 4],
                    '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[X 8], '9' => %w[O 9] }
    board.compute_state
    it 'returns "tie" for no-win end' do
      expect(board.state).to eql('tie')
    end
  end

  describe '#check_input_availability' do
    board = Board.new
    board.player_move = 'e'
    board.check_input_validity
    it 'returns exit for e' do
      expect(board.check_input_availability).to eql('exit')
    end
  end
end
