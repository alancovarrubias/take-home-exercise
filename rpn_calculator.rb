class String
  def integer?
    to_i.to_s == self
  end
end

class RpnCalculator
  def initialize
    @stack = []
  end

  def parse(str)
    str.split(' ').each { |element| parse_element(element) }
    @stack.last
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
