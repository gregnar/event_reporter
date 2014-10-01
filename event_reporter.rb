$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'cli'

cli = CLI.new($stdout,$stdin)

while cli.running?
  cli.evaluate
end
