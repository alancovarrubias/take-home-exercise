require './rpn_calculator'

class RpnCli
  def initialize
    @calculator = RpnCalculator.new
  end

  def run
    process_input do |input|
      calculate_output(input)
    end
  end

  def calculate_output(input)
    @calculator.parse(input)
  rescue RpnException => e
    e.message
  end

  def process_input
    loop do
      print '> '
      input = gets.chomp
      break if input.downcase == 'q'

      result = yield input unless input.strip.empty?
      puts result
    end
  end
end
