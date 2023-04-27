def process_input
  while true
    print '> '
    input = gets.chomp
    break if input.downcase == 'q'

    result = yield input
    puts result
  end
end
