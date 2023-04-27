require './process_input'
require './rpn_calculator'

calculator = RpnCalculator.new
process_input do |input|
  calculator.parse(input)
end
