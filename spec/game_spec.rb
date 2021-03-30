# spec..lib/game.rb
require './lib/game'

describe Game do
  let(:game) { Game.new('jaar', 'eri') }

  describe '#game_eneded?' do
    it 'returns 1 if one of player fill the first horisontal line' do
      game.only_board(['x', 'x', 'x', 4, 5, 6, 7, 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill the middle horisontal line' do
      game.only_board([1, 2, 3, 'x', 'x', 'x', 7, 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill the last horisontal line' do
      game.only_board([1, 2, 3, 4, 5, 6, 'x', 'x', 'x'])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill the left vertical line' do
      game.only_board(['x', 2, 3, 'x', 5, 6, 'x', 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill the middle vertical line' do
      game.only_board([1, 'x', 3, 4, 'x', 6, 7, 'x', 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill the rigth vertical line' do
      game.only_board([1, 2, 'x', 4, 5, 'x', 7, 8, 'x'])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill a diagonal line from left-up to right-bottom' do
      game.only_board(['x', 2, 3, 4, 'x', 6, 7, 8, 'x'])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 1 if one of player fill a diagonal line from left-bottom to right-top' do
      game.only_board([1, 2, 'x', 4, 'x', 6, 'x', 8, 9])
      expect(game.game_ended?).to eql(1)
    end

    it 'returns 2 if is a tie' do
      game.only_board(%w[x o x o o x x x o])
      expect(game.game_ended?).to eql(2)
    end

    it 'returns 0 if the game is still going' do
      game.only_board([1, 'o', 'x', 'o', 'o', 'x', 'x', 'x', 'o'])
      expect(game.game_ended?).to eql(0)
    end
  end

  describe '#next_player?' do
    it 'returns the of the player wheter if currentplayer is empty of if not' do
      game.next_player
      expect(game.p_player).to eql('jaar')
    end

    it 'returns X if current player is empty' do
      game.next_player
      expect(game.p_symbol).to eql('X')
    end

    it 'returns the name of the second player if the first one was slected' do
      game.next_player
      game.next_player
      expect(game.p_player).to eql('eri')
    end

    it 'returns the symbol O if the symbol X was selected' do
      game.next_player
      game.next_player
      expect(game.p_symbol).to eql('O')
    end
  end

  describe '#only_board' do
    it 'returns a array from 0 to 9' do
      expect(game.only_board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
    it 'returns the array entered as parameter' do
      expect(game.only_board([1, 2, 3, 'x', 5, 6, 'o', 8, 9])).to eql([1, 2, 3, 'x', 5, 6, 'o', 8, 9])
    end
  end
end
