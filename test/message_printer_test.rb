require_relative 'test_helper'
require_relative '../lib/message_printer'
require 'stringio'

class MessagePrinterTest < Minitest::Test

  def setup
    @tester = StringIO.new
    @message_printer = MessagePrinter.new(@tester)
  end

  def test_clear_console_sequence
    @message_printer.clear_console
    assert @tester.string.include?("2J")
  end

  def test_welcome_message
    @message_printer.welcome
    assert @tester.string.include?("Event Reporter!")
  end

  def test_loading_complete_message
    @message_printer.load_complete
    assert @tester.string.include?("Load successful.")
  end

  def test_number_of_attendees_in_queue_currently_message_works
    @message_printer.queue_count(Array.new(22))
    assert @tester.string.include?("22 matches")
  end

  def test_queue_has_been_cleared_message
    @message_printer.queue_clear
    assert @tester.string.include?("Queue emptied.")
  end

  def test_filename_input_prompt_message
    @message_printer.ask_filename
    assert @tester.string.include?("file's name to be")
  end

  def test_queue_has_successfully_saved_message
    @message_printer.queue_saved_to("booty")
    assert @tester.string.include?("Saved as 'booty.csv'")
  end

  def test_number_of_matches_found
    @message_printer.matches_found([1,2,3,4,5,6,7,8,9,10])
    assert @tester.string.include?("10 matches")
  end

  def test_invalid_command_message
    @message_printer.invalid_command("gibberjabber")
    assert @tester.string.include?("Invalid command: gibberjabber")
  end

  def test_available_commands_message
    @message_printer.available_commands
    assert @tester.string.include?("help <command>")
  end

  def test_instructions_for_queue_command_message
    @message_printer.queue_instructions
    assert @tester.string.include?("queue holds the stored results")
  end

  def test_instructions_for_find_command_message
    @message_printer.find_instructions
    assert @tester.string.include?("Here's how the find command works:")
  end

  def test_all_queue_command_help_messages
    @message_printer.queue_command_help(:clear)
    assert @tester.string.include?("Queue clear removes anything")

    @message_printer.queue_command_help(:count)
    assert @tester.string.include?("how many records")

    @message_printer.queue_command_help(:print)
    assert @tester.string.include?("tab-delimited data table")

    @message_printer.queue_command_help(:print_by)
    assert @tester.string.include?("by the specified attribute")

    @message_printer.queue_command_help(:save_to)
    assert @tester.string.include?("Exports the current queue")
  end

  def test_attributes_help_command
    @message_printer.attributes
    assert @tester.string.include?("4. zip_code")
  end

end
