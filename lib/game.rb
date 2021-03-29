# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

require_relative 'displayprint'

class Game
  def initialize(player1, player2)
    @first_player = player1
    @second_player = player2
    @symbol = 'X'
    @current_player = nil
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @display = Display.new
  end

  def only_board(array = nil)
    @board = array unless array.nil?
    @board
  end

  def game_ended?
    return 1 if @board[0] == @board[4] && @board[4] == @board[8]
    return 1 if @board[2] == @board[4] && @board[4] == @board[6]

    i = 0
    while i < 7
      return 1 if @board[i + 0] == @board[i + 1] && @board[i + 1] == @board[i + 2]

      i += 3
    end
    i = 0
    while i < 3
      return 1 if @board[i + 0] == @board[i + 3] && @board[i + 3] == @board[i + 6]

      i += 1
    end

    return 2 if @board.none?(Integer)

    0
  end

  def next_player
    if @symbol == 'X'
      @current_player = @second_player
      @symbol = 'O'
    else
      @current_player = @first_player
      @symbol = 'X'
    end
  end

  def p_player
    @current_player
  end

  def p_symbol
    @symbol
  end
end

# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
