require 'stringio'
require_relative '../lib/game'
require_relative '../lib/board'
describe Game do
  let(:game) { Game.new }

  describe '#decide' do
    it 'it changes the boad message when its a tie' do
      game.board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => %w[X 3], '4' => %w[O 4],
                           '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[O 8], '9' => %w[X 9] }
      game.board.check_tie
      game.decide
      expect(game.board.message).to eql("          It's a tie")
    end
  end

  describe '#process_error' do
    it 'changes the message to wrong input for input outside 1-9' do
      game.board.player_move = 'p'
      game.board.check_input_validity
      game.wrong_input
      game.process_input
      expect(game.board.message).to eql("\n   Wrong Input , Please choose form 1-9")
    end
  end

  describe '#position_taken_error' do
    it 'changes the message to taken input when player chooses a taken cell' do
      game.board.cells = { '1' => %w[X 1], '2' => %w[O 2], '3' => %w[X 3], '4' => %w[O 4],
                           '5' => %w[X 5], '6' => %w[O 6], '7' => %w[O 7], '8' => %w[O 8], '9' => %w[X 9] }
      game.board.player_move = '1'
      game.board.check_input_availability
      game.process_input
      expect(game.board.message).to eql("\n       That position is taken,\n" + '    choose form the available ones')
    end
  end

  describe '#read_input' do
    let(:input) { StringIO.new('1') }
    it 'should take input from user' do
      $stdin = input
      game.read_input
      expect(game.board.player_move).to eql('1')
      $stdin = STDIN
    end
  end
end
