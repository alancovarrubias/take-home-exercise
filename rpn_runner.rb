require './rpn_cli'
require './rpn_input_parser'

input_parser = RpnInputParser.new
RpnCli.new(input_parser).run
