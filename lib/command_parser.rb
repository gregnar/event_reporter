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
    account_for_by(commands)
    account_for_long_criteria(commands)
    return commands
  end

  def account_for_by(commands, testing=false)
    if commands[2] == "by"
      commands[1] = commands[1..2].inject { |sum, command|  sum += " #{command}" }
      commands.delete_at(2)
    end
    return commands if testing
  end

  def account_for_long_criteria(commands, testing=false)
    address = commands.index("address")
    if commands.length > 3
      commands[address+1] = commands[address+1..commands.length-1].inject { |sum, command| sum += " #{command}" }
      commands.pop((commands.length-1)-(address+1))
    end
    return commands if testing
  end
end
