# spec..bin/main.rb
require '../bin/main'

describe Main do
  describe '#add' do
    it 'returns the array of the board if the parameter is empty' do
      main = Main.new
      expect(main.board_print).to eql([['+---+---+---+'],
                                       ['| ', 1, ' | ', 2, ' | ', 3, ' |'],
                                       ['+---+---+---+'],
                                       ['| ', 4, ' | ', 5, ' | ', 6, ' |'],
                                       ['+---+---+---+'],
                                       ['| ', 7, ' | ', 8, ' | ', 9, ' |'],
                                       ['+---+---+---+']])
    end

    it 'returns the array of the board with a new array info' do
      calculator = Calculator.new
      expect(calculator.add('x', 1, 2, 3, 4, 5, 6, 7, 8, 9)).to eql([['+---+---+---+'],
                                                                     ['| ', 'x', ' | ', 2, ' | ', 3, ' |'],
                                                                     ['+---+---+---+'],
                                                                     ['| ', 4, ' | ', 5, ' | ', 6, ' |'],
                                                                     ['+---+---+---+'],
                                                                     ['| ', 7, ' | ', 8, ' | ', 9, ' |'],
                                                                     ['+---+---+---+']])
    end
  end
end
