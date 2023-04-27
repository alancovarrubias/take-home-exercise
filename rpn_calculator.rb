class String
  def integer?
    to_i.to_s == self
  end
end

class RpnCalculator
  def initialize
    @stack = []
  end

  def parse(*inputs)
    inputs.each do |input|
      parse_input(input)
    end
    @stack.last
  end

  def parse_input(input)
    input.split(' ').each { |element| parse_element(element) }
  end

  def parse_element(element)
    result = element.integer? ? element.to_i : perform_operation(element)
    @stack.push(result)
  end

  def perform_operation(operator)
    operand1 = @stack.pop.to_i
    operand2 = @stack.pop.to_i
    operand2.send(operator, operand1)
  end
end
