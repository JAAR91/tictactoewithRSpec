# spec..bin/displayprint.rb
require '../bin/displayprint'

describe Display do
  describe '#just_board' do
    it 'returns the array teh array needed to print the board' do
      display = Display.new
      expect(display.just_board).to eql([['+---+---+---+'],
                                         ['| ', 1, ' | ', 2, ' | ', 3, ' |'],
                                         ['+---+---+---+'],
                                         ['| ', 4, ' | ', 5, ' | ', 6, ' |'],
                                         ['+---+---+---+'],
                                         ['| ', 7, ' | ', 8, ' | ', 9, ' |'],
                                         ['+---+---+---+']])
    end
  end
  describe '#transform_array' do
    it 'transform the board array using a new array as a parameter' do
      display = Display.new
      array = [['+---+---+---+'],
               ['| ', 'x', ' | ', 'x', ' | ', 'x', ' |'],
               ['+---+---+---+'],
               ['| ', 4, ' | ', 5, ' | ', 6, ' |'],
               ['+---+---+---+'],
               ['| ', 7, ' | ', 8, ' | ', 9, ' |'],
               ['+---+---+---+']]
      expect(display.transform_array('x', 'x', 'x', 4, 5, 6, 7, 8, 9)).to eql(array)
    end
  end
end
