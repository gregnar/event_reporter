class CommandParser

  def initialize
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

  def evaluate(command)
    commands = modify_commands(command)
    @primary_command = commands.first if commands[0] != nil
    @secondary_command = commands[1] if commands[1] != nil
    @third_command = commands[2] if commands[2] != nil
  end

  def modify_commands(command)
    commands = command.split
    if commands.length > 3
      extra_commands = commands.pop(commands.length-3)
      extra_commands.each { |command| commands[2] += " #{command}" }
      extra_commands = 0
    end
    commands.
    commands
  end
end
