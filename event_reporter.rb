$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'cli'

loop do
  CLI.new($stdout,$stdin).evaluate
end
