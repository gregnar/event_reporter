require_relative 'test_helper'
require 'cli'

class CLITest < Minitest::Test
  def test_happy_path
    cli = CLI.new($stdout, $stdin)
    # load event_attendees.csv
    cli.evaluate("load event_attendees.csv")

    # queue count should return 0
    assert_equal 0, cli.evaluate("queue count")

    # find first_name John
    johns = cli.evaluate("find first_name John")
    assert_equal 63, johns.size

    johns.each do |output_line|
      assert_includes "john", output_line
    end

    # queue count should return 63
    assert_equal 63, cli.evaluate("queue count")

    # queue clear
    cli.evaluate "queue clear"

    # queue count should return 0
    assert_equal 0, cli.evaluate("queue count")

    # help should list the commands
    command_list = cli.evaluate "help"
    assert_includes "help",        command_list
    assert_includes "queue count", command_list
    assert_includes "find",        command_list
    assert_includes "load",        command_list

    # help queue count should explain the queue count function
    command_list = cli.evaluate("help queue count")
    assert_includes "queue count:"

    # help queue print should explain the printing function
    command_list = cli.evaluate("help queue print")
    assert_includes "queue print:"
  end
end
