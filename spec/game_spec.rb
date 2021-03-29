# spec..lib/game.rb
require './lib/game'

describe Game do
  describe '#game_eneded?' do
    it 'returns 1 if a player won the game or 2 if tie or 0 if game must keep going' do
      game = Game.new('jaar', 'eri')
      game.only_board(['x', 'x', 'x', 4, 5, 6, 7, 8, 9])
      expect(game.game_ended?).to eql(1)

      game.only_board([1, 2, 3, 'x', 'x', 'x', 7, 8, 9])
      expect(game.game_ended?).to eql(1)

      game.only_board([1, 2, 3, 4, 5, 6, 'x', 'x', 'x'])
      expect(game.game_ended?).to eql(1)

      game.only_board(['x', 2, 3, 'x', 5, 6, 'x', 8, 9])
      expect(game.game_ended?).to eql(1)

      game.only_board([1, 'x', 3, 4, 'x', 6, 7, 'x', 9])
      expect(game.game_ended?).to eql(1)

      game.only_board([1, 2, 'x', 4, 5, 'x', 7, 8, 'x'])
      expect(game.game_ended?).to eql(1)

      game.only_board(['x', 2, 3, 4, 'x', 6, 7, 8, 'x'])
      expect(game.game_ended?).to eql(1)

      game.only_board([1, 2, 'x', 4, 'x', 6, 'x', 8, 9])
      expect(game.game_ended?).to eql(1)

      game.only_board(%w[x o x o o x x x o])
      expect(game.game_ended?).to eql(2)

      game.only_board([1, 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])
      expect(game.game_ended?).to eql(0)

      game.only_board([1, 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])
      expect(game.game_ended?).to eql(0)
    end
  end

  describe '#next_player?' do
    it 'returns the of the player wheter if currentplayer is empty of if not' do
      game = Game.new('jaar', 'eri')
      game.next_player
      expect(game.p_player).to eql('jaar')
      expect(game.p_symbol).to eql('X')
      game.next_player
      expect(game.p_player).to eql('eri')
      expect(game.p_symbol).to eql('O')
    end
  end

  describe '#only_board' do
    it 'returns a array from 0 to 9 unless you send a array as a parameter' do
      game = Game.new('jaar', 'eri')
      expect(game.only_board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])

      expect(game.only_board([1, 2, 3, 'x', 5, 6, 'o', 8, 9])).to eql([1, 2, 3, 'x', 5, 6, 'o', 8, 9])
    end
  end
end
