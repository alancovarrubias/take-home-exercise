require './rpn_calculator'

class RpnCli
  def initialize
    @calculator = RpnCalculator.new
  end

  def run
    process_input do |input|
      @calculator.parse(input)
    end
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
