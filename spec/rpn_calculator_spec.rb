require 'rpn_calculator'

RSpec.describe RpnCalculator do
  let(:calculator) { RpnCalculator.new }
  describe 'test case #1' do
    it '5 should return 5' do
      res = calculator.parse('5')
      expect(res).to eq(5)
    end

    it '8 should return 8' do
      res = calculator.parse('5', '8')
      expect(res).to eq(8)
    end

    it '+ should return 13' do
      res = calculator.parse('5', '8', '+')
      expect(res).to eq(13)
    end
  end
  describe 'test case #2' do
    it 'should return -13' do
      res = calculator.parse('5 5 5 8 + + -')
      expect(res).to eq(-13.0)
    end
  end
end
