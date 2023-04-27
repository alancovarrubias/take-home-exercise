require 'rpn_calculator'

RSpec.describe RpnCalculator do
  subject { RpnCalculator.new }

  describe 'test case #1' do
    it 'should return 5' do
      expect(subject.parse('5')).to eq(5)
    end

    it 'should return 8' do
      expect(subject.parse('5', '8')).to eq(8)
    end

    it 'should return 13' do
      expect(subject.parse('5', '8', '+')).to eq(13)
    end
  end

  describe 'test case #2' do
    it 'should return -13' do
      expect(subject.parse('5 5 5 8 + + -')).to eq(-13.0)
    end
  end

  describe 'test case #3' do
    it 'should return 6' do
      expect(subject.parse('-3', '-2', '*')).to eq(6)
    end
    it 'should return 11' do
      expect(subject.parse('-3', '-2', '*', '5', '+')).to eq(11)
    end
  end

  describe 'test case #4' do
    it 'should return 0.625' do
      expect(subject.parse('5', '9', '1', '-', '/')).to eq(0.625)
    end
  end

  describe 'error cases' do
    it 'should raise "Divide by zero error" exception' do
      expect { subject.parse('1', '0', '/') }.to raise_error(RpnException, 'Divide by zero error')
    end
    it 'should raise "Invalid expression" exception' do
      expect { subject.parse('INVALID') }.to raise_error(RpnException, 'Invalid expression')
    end
    it 'should raise "Not enough operands" exception' do
      expect { subject.parse('1', '+') }.to raise_error(RpnException, 'Not enough operands')
    end
  end
end
