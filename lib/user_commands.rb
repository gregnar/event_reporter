class UserCommands

  attr_reader :current_queue

  def initialize
    @current_queue = []
    @primary_command = ""
    @secondary_command = ""
    @third_command = ""
  end

  def primary_command
    @primary_command
  end

  def secondary_command
    @secondary_command
  end

  def third_command
    @third_command
  end

  def queue(command, third_command="")
    commands = command.split
    primary_command = commands[0]
    secondary_command  = commands[1]
    third_command = commands[2] if commands

    options = {
      clear: @current_queue = [],
      count: current_queue.count,
      print: ,
      print_by: ,
      save_to: save_to
    }
    options.fetch(command)
  end

  def

  def find(command, third_command)
  end

  def parse_for_by(commands)
    commands

  def print
    printer = MessagePrinter.new
    message = :queue_print
    printer.send(message)
  end

  def save_to(filename)

  end


end
