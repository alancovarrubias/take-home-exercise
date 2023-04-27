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
    if str.integer?
      @stack.push(str.to_i)
      str.to_i
    else
      @stack.pop + @stack.pop
    end
  end
end
