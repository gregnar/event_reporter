class UserCommands

  attr_reader :current_queue

  def initialize
    @current_queue = []
  end

  def queue(command, third_command="")
    options = {
      clear: @current_queue = [],
      count: current_queue.count,
      print: ,
      print_by: ,
      save_to: save_to
    }
    options.fetch(command)
  end

  def print
    printer = MessagePrinter.new
    message = :queue_print
    printer.send(message)
  end

  def save_to(filename)
  end

end
