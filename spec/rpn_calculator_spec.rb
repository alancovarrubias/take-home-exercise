require 'rpn_calculator'

RSpec.describe RpnCalculator do
  describe 'test case #1' do
    let(:calculator) { RpnCalculator.new }
    it '5 should return 5' do
      res = calculator.parse('5')
      expect(res).to eq(5)
    end

    it '8 should return 8' do
      calculator.parse('5')
      res = calculator.parse('8')
      expect(res).to eq(8)
    end

    it '+ should return 13' do
      calculator.parse('5')
      calculator.parse('8')
      res = calculator.parse('+')
      expect(res).to eq(13)
    end
  end
end
