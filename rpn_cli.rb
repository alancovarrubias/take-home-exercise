class RpnCli
  def initialize(input_parser)
    @input_parser = input_parser
  end

  def run
    process_input do |input|
      calculate_output(input)
    end
  end

  def calculate_output(input)
    @input_parser.parse(input)
  rescue RpnException => e
    e.message
  end

  def process_input
    loop do
      print '> '
      input = gets
      break unless input

      input.chomp!
      break if input.downcase == 'q'

      next if input.strip.empty?

      result = yield input
      puts result
    end
  end
end
