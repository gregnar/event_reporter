require 'csv_parser'           # ~> LoadError: cannot load such file -- csv_parser
require 'message_printer'
require 'queue'
require 'command_parser'
require 'attendee_repository'
require 'pry'

class CLI

  attr_reader :csv_parser, :queue, :attendee_repo, :printer, :command_reader,
              :input, :first_command, :second_command, :third_command, :csv_reader

  def initialize(interface, input)
    @csv_reader = CSVParser.new
    @queue = Queue.new
    @attendee_repo = AttendeeRepository.new
    @printer = MessagePrinter.new(interface)
    @command_reader = CommandParser.new

    @input = input
    @first_command = nil
    @second_command = nil
    @third_command = nil
  end

  def queue(command, attribute=nil)
    case command
    when "clear"    then queue.clear
    when "count"    then queue.count
    when "print"    then queue.print_queue
    when "print_by" then queue.print_by(attribute)
    when "save_to"  then queue.save_to
    end
  end

  def help(command)
    printer.available_commands if command == nil
    case command
    when "attributes" then printer.attributes
    when "find"       then printer.find_instructions
    when "queue"      then puts "yep"
    else                   printer.available_commands
    end
  end

  def load_csv
    second_command = "event_attendees.csv" if second_command == nil
    csv = csv_reader.load_csv(second_command)
    attendee_repo.populate_repository(csv)
    printer.load_complete
  end

  def find
    attendee_repo.find(second_command, third_command)
  end

  def get_command
    user_input = input.gets.strip
    command_reader.evaluate(user_input)
    commands_to_symbols
  end

  def commands_to_symbols
    @first_command = command_reader.primary_command.gsub(/\s+/, "_").downcase
    case
    when  command_reader.secondary_command != nil
      @second_command = command_reader.secondary_command.gsub(/\s+/,"_").downcase
    when  command_reader.third_command != nil
      @third_command  = command_reader.third_command.gsub(/\s+/, "_").downcase
    end
    binding.pry
  end

  def evaluate
    get_command
    case first_command
    when "queue" then queue(second_command, third_command)
    when "find"  then find
    when "load"  then load_csv
    when "help"  then help(second_command)
    end
  end
end
