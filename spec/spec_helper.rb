# This adds the root directory of your project to the load path
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', ''))
RSpec.configure do |config|
  config.filter_run_when_matching :focus
end
