# spec..lib/game.rb
require '../lib/game'

# rubocop: disable Metrics/ModuleLength

describe Game do
  describe '#add' do
    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board(['x', 'x', 'x', 4, 5, 6, 7, 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board([1, 2, 3, 'x', 'x', 'x', 7, 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board([1, 2, 3, 4, 5, 6, 'x', 'x', 'x'])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board(['x', 2, 3, 'x', 5, 6, 'x', 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board([1, 'x', 3, 4, 'x', 6, 7, 'x', 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board([1, 2, 'x', 4, 5, 'x', 7, 8, 'x'])
      expect(game.game_ended?).to eql(1)
    end
  end

  describe '#add' do
    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board(['x', 2, 3, 4, 'x', 6, 7, 8, 'x'])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 1 if a player won the game' do
      game = Game.new('jaar', 'eri')
      game.only_board([1, 2, 'x', 4, 'x', 6, 'x', 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns return 2 if there are no more space availables' do
      game = Game.new('jaar', 'eri')
      game.only_board(%w[x o x o o x x x o])
      expect(game.game_ended?).to eql(2)
    end

    it 'returns return 0 if no one wins and if there is still chance for more movements' do
      game = Game.new('jaar', 'eri')
      game.only_board([1, 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])
      expect(game.game_ended?).to eql(0)
    end
  end
end

# rubocop: enable Metrics/ModuleLength
