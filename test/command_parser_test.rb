require_relative 'test_helper'
require 'command_parser'

class CommandParserTest < Minitest::Test

  def setup
    @parser = CommandParser.new
  end

  def test_parser_cleans_print_by_properly
    by_command = "queue print by first_name".split
    assert_equal ["queue", "print by", "first_name"], @parser.account_for_by(by_command, true)
  end

  def test_account_for_by_leaves_unrelated_commands
    assert_equal %w(queue count), @parser.account_for_by("queue count".split, true)
  end

  def test_parser_cleans_long_third_commands
    long_command = "find address 147-77 225th street".split
    assert_equal ["find", "address", "147-77 225th street"], @parser.account_for_long_criteria(long_command, true)
  end

  def test_account_for_long_criteria_leaves_unrelated_commands
    assert_equal %w(find last_name Joseph), @parser.account_for_long_criteria("find last_name Joseph".split, true)
  end

  def test_parser_successfully_cleans_for_both_conditions
    true_test = "queue find address 890 Dexter Apt 101"
    assert_equal ["queue", "find", "address", "890 Dexter Apt 101"], @parser.modify_commands(true_test)
  end

  def test_parsed_commands_are_correctly_stored
    @parser.evaluate("find first_name Herbert")

    assert_equal "find", @parser.primary_command
    assert_equal "first_name", @parser.secondary_command
    assert_equal "Herbert", @parser.third_command
  end
end
