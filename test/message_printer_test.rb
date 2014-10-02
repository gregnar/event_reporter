require_relative 'test_helper'
require 'message_printer'
require 'stringio'

class MessagePrinterTest < Minitest::Test

  def setup
    @tester = StringIO.new
    @message_printer = MessagePrinter.new(@tester)
  end

  def test_clear_console_sequence
    @message_printer.clear_console
    assert_includes "2J", @tester.string
  end

  def test_welcome_message
    @message_printer.welcome
    assert_includes "Event Reporter!", @tester.string
  end

  def test_loading_complete_message
    @message_printer.load_complete
    assert_includes "Load successful.", @tester.string
  end

  def test_number_of_attendees_in_queue_currently_message_works
    @message_printer.queue_count(Array.new(22))
    assert_includes "22 matches", @tester.string
  end

  def test_queue_has_been_cleared_message
    @message_printer.queue_clear
    assert_includes "Queue emptied.", @tester.string
  end

  def test_filename_input_prompt_message
    @message_printer.ask_filename
    assert_includes "file's name to be", @tester.string
  end

  def test_queue_has_successfully_saved_message
    @message_printer.queue_saved_to("booty")
    assert_includes "Saved as 'booty.csv'", @tester.string
  end

  def test_correct_number_of_matches_found
    @message_printer.matches_found([1,2,3,4,5,6,7,8,9,10])
    assert_includes "10 matches", @tester.string
  end

  def test_invalid_command_message
    @message_printer.invalid_command("gibberjabber")
    assert_includes "Invalid command: gibberjabber", @tester.string
  end

  def test_available_commands_message
    @message_printer.available_commands
    assert_includes "help <command>", @tester.string
  end

  def test_instructions_for_queue_command_message
    @message_printer.queue_instructions
    assert_includes "queue holds the stored results", @tester.string
  end

  def test_instructions_for_find_command_message
    @message_printer.find_instructions
    assert_includes "Here's how the find command works:", @tester.string
  end

  def test_all_queue_command_help_messages
    @message_printer.queue_command_help(:clear)
    assert_includes "Queue clear removes anything", @tester.string

    @message_printer.queue_command_help(:count)
    assert_includes "how many records", @tester.string.include?()

    @message_printer.queue_command_help(:print)
    assert_includes "tab-delimited data table", @tester.string

    @message_printer.queue_command_help(:print_by)
    assert_includes "by the specified attribute", @tester.string

    @message_printer.queue_command_help(:save_to)
    assert_includes "Exports the current queue", @tester.string
  end

  def test_attributes_help_command
    @message_printer.attributes
    assert @tester.string.include?("4. zipcode")
  end

  def test_waiting_for_command
    @message_printer.waiting_for_command
    assert_includes "Waiting for command", @tester.string
  end
end
