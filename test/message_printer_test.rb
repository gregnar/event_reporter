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
    assert_includes @tester.string, "2J"
  end

  def test_welcome_message
    @message_printer.welcome
    assert_includes @tester.string, "Event Reporter!"
  end

  def test_loading_complete_message
    @message_printer.load_complete
    assert_includes @tester.string, "Load successful."
  end

  def test_number_of_attendees_in_queue_currently_message_works
    @message_printer.show_count(Array.new(22).size)
    assert_includes @tester.string, "22 records"
  end

  def test_queue_has_been_cleared_message
    @message_printer.queue_clear
    assert_includes @tester.string, "Queue emptied."
  end

  def test_filename_input_prompt_message
    @message_printer.ask_filename
    assert_includes @tester.string, "file's name to be"
  end

  def test_queue_has_successfully_saved_message
    @message_printer.queue_saved_to("booty")
    assert_includes @tester.string, "Saved as 'booty.csv'"
  end

  def test_correct_number_of_matches_found
    @message_printer.matches_found([1,2,3,4,5,6,7,8,9,10].count)
    assert_includes @tester.string, "10 matches"
  end

  def test_invalid_command_message
    @message_printer.invalid_command
    assert_includes @tester.string, "Invalid command"
  end

  def test_available_commands_message
    @message_printer.available_commands
    assert_includes @tester.string, "help <command>"
  end

  def test_instructions_for_queue_command_message
    @message_printer.queue_instructions
    assert_includes @tester.string, "queue holds the stored results"
  end

  def test_instructions_for_find_command_message
    @message_printer.find_instructions
    assert_includes @tester.string, "Here's how the find command works:"
  end

  def test_all_queue_command_help_messages
    @message_printer.queue_command_help("clear")
    assert_includes @tester.string, "Queue clear removes anything"

    @message_printer.queue_command_help("count")
    assert_includes @tester.string, "how many records"

    @message_printer.queue_command_help("print")
    assert_includes @tester.string, "tab-delimited data table"

    @message_printer.queue_command_help("print_by")
    assert_includes @tester.string, "by the specified attribute"

    @message_printer.queue_command_help("save_to")
    assert_includes @tester.string, "Exports the current queue"
  end

  def test_attributes_help_command
    @message_printer.attributes
    assert @tester.string.include?("4. zipcode")
  end

  def test_waiting_for_command
    @message_printer.waiting_for_command
    assert_includes @tester.string, "Waiting for command"
  end
end
