$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'cli'

cli = CLI.new
loop do
  $stdout.print "Enter an input: "
  user_input = $stdin.gets.strip
  to_print   = cli.evaluate user_input
  $stdout.puts to_print
end
