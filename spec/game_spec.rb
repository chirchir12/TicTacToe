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
end
