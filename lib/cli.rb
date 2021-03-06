require 'csv_parser'
require 'message_printer'
require 'queue'
require 'command_parser'
require 'attendee_repository'
require 'pry'
require 'table_maker'

class CLI


  attr_reader :queue, :attendee_repo, :printer, :command_reader, :csv_reader

  def initialize(interface, input)
    @csv_reader       = CSVParser.new
    @queue            = Queue.new
    @attendee_repo    = AttendeeRepository.new
    @printer          = MessagePrinter.new(interface)
    @command_reader   = CommandParser.new
    @table_maker      = TableMaker.new

    @loaded           = false
    @running          = true
    @input            = input
    @first_command    = nil
    @second_command   = nil
    @third_command    = nil
    @printer.welcome
  end

  def running?
    @running
  end

  def first_command
    @first_command
  end

  def second_command
    @second_command
  end

  def third_command
    @third_command
  end

  def input
    @input
  end

  def prepped_table(ordered=false, attribute="")
    return @table_maker.prepare_table(queue.ordered_queue(attribute.to_sym)) if ordered
    return @table_maker.prepare_table(queue.current_queue) if ordered == false
  end

  def call_queue(command, attribute=nil)
    case command
    when "clear"    then queue.clear
    when "count"    then printer.show_count(queue.count)
    when "print"    then printer.print_queue(prepped_table)
    when "print_by" then printer.print_queue(prepped_table(true, third_command))
    when "find"     then find(true)
    when "save_to"
      queue.save_to(third_command)
      File.exists?("csv/#{third_command}") ? printer.save_successful : printer.save_error
    end
  end

  def help(command)
    printer.available_commands if command == nil
    case command
    when "attributes" then printer.attributes
    when "find"       then printer.find_instructions
    when "queue"      then printer.queue_command_help(third_command)
    else                   printer.available_commands
    end
  end

  def load_csv
    second_command ||= "event_attendees.csv"
    csv = csv_reader.load_csv(second_command)
    attendee_repo.populate_repository(csv)
    printer.load_complete
    @loaded = true
  end

  def loaded?
    @loaded
  end

  def find(queue_find=false)
    if loaded?
      if queue_find == false
        queue.clear
        matches = attendee_repo.find(second_command, third_command)
      elsif queue_find
<<<<<<< HEAD
        matches = queue.find(third_command)
=======
        matches = queue.find(third_command).dup
>>>>>>> 9c74c21e1676291c191e2e656ae134b3c34660f4
        queue.clear
      end
      queue << matches
      printer.matches_found(matches.count)
    else
      printer.not_loaded
    end
  end

  def get_command
    user_input = input.gets.strip
    command_reader.evaluate(user_input)
    set_commands
  end

  def set_commands
    @first_command  = command_reader.primary_command
    @second_command = string_format(command_reader.secondary_command) if command_reader.secondary_command != nil
    @third_command  = command_reader.third_command if command_reader.third_command != nil
  end

  def string_format(string)
    string.gsub(/\s+/, "_").downcase
  end

  def quit
    printer.goodbye
    @running = false
  end

  def quit_commands(command)
    %w(q Q quit Quit QUIT).include?(command)
  end

  def execute_first_commands(command)
    case command
    when "queue"        then call_queue(second_command, third_command)
    when "find"         then find
    when "load"         then load_csv
    when "help"         then help(second_command)
    else                     printer.invalid_command
    end
  end

  def evaluate
    while running?
      printer.waiting_for_command
      get_command
      if quit_commands(first_command)
        quit; exit
      end
      execute_first_commands(first_command)
    end
  end

end
