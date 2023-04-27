require 'rpn_cli'

def simulate_user_input(*inputs)
  allow_any_instance_of(Object).to receive(:gets).and_return(*inputs)
end

def verify_output(text)
  cli = RpnCli.new
  expect { cli.run }.to output(text).to_stdout
end

RSpec.describe 'process_input' do
  it 'outputs result from valid input' do
    simulate_user_input("1 1 +\n", "q\n")

    verify_output("> 2\n> ")
  end

  it 'outputs nothing with empty input' do
    simulate_user_input("1\n", " \n", "\n", "q\n")

    verify_output("> 1\n> \n> \n> ")
  end

  it 'outputs error message with invalid input', :focus do
    simulate_user_input("1 0 /\n", "q\n")

    verify_output("> Divide by zero error. Clearing stack.\n> ")
  end
end
