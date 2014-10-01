require_relative 'test_helper'
require 'cli'
require "stringio"

class CLITest < Minitest::Test
  def test_happy_path
    tester = StringIO.new
    cli = CLI.new($stdout, tester)

    tester.string = "load event_attendees.csv"
    cli.evaluate(tester.string)

    tester.string = "queue count"
    assert_equal 0, cli.evaluate(tester.string)

    tester.string = "find first_name John"
    johns = cli.evaluate(tester.string)
    assert_equal 63, johns.size

    johns.each do |output_line|
      assert_includes "john", output_line
    end

    tester.string = "queue count"
    assert_equal 63, cli.evaluate(tester.string)

    tester.string = "queue clear"
    cli.evaluate(tester.string)

    tester.string = "queue count"
    assert_equal 0, cli.evaluate(tester.string)

    tester.string = "help"
    command_list = cli.evaluate(tester.string)
    assert_includes "help",        command_list
    assert_includes "queue count", command_list
    assert_includes "find",        command_list
    assert_includes "load",        command_list


    tester.string = "help queue count"
    command_list = cli.evaluate(tester.string)
    assert_includes "queue count:"

    tester.string = "help queue print"
    command_list = cli.evaluate(tester.string)
    assert_includes "queue print:"
  end
end
