require 'rpn_calculator'
require 'process_input'

RSpec.describe 'process_input' do
  it 'outputs result from valid input' do
    # Simulate user input
    allow_any_instance_of(Object).to receive(:gets).and_return("1 1 +\n", "q\n")

    calculator = RpnCalculator.new

    expect(calculator).to receive(:parse).with('1 1 +').and_return(2.0)
    expect do
      process_input do |input|
        calculator.parse(input)
      end
    end.to output("> 2.0\n> ").to_stdout
  end
end
