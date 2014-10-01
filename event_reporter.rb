$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'cli'

cli = CLI.new($stdout,$stdin)

loop do
  cli.evaluate
end
