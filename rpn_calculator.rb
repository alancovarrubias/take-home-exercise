class RpnException < StandardError
  def initialize(message = 'My custom exception message')
    super(message)
  end
end

module ExpressionParser
  INTEGER_REGEX = /\A([-+]?[0-9]+)\z/.freeze
  FLOAT_REGEX = /\A([-+]?[0-9]*\.?[0-9]+)\z/.freeze
  OPERATOR_REGEX = %r{[+\-*/]}.freeze

  def parse_expression(expression)
    case expression
    when INTEGER_REGEX
      expression.to_i
    when FLOAT_REGEX
      expression.to_f
    when OPERATOR_REGEX
      perform_operation(expression)
    else
      raise RpnException, 'Invalid expression'
    end
  end

  def perform_operation(operator)
    raise RpnException, 'Not enough operands' if @stack.length < 2

    operand1 = @stack.pop
    operand2 = @stack.pop
    if operator == '/'
      raise RpnException, 'Divide by zero error' if operand1.zero?

      operand1 = operand1.to_f
      operand2 = operand2.to_f
    end

    operand2.send(operator, operand1)
  end
end

class RpnCalculator
  include ExpressionParser

  def initialize
    @stack = []
  end

  def parse(*inputs)
    inputs.each { |input| parse_input(input) }
    @stack.last
  end

  def parse_input(input)
    input.split(' ').each do |expression|
      result = parse_expression(expression)
      @stack.push(result)
    end
  end
end
