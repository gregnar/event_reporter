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
    account_for_long_criteria(commands, false, commands[1])
    commands
  end

  def account_for_by(commands, testing=false)
    if commands[2] == "by" || commands[2] == "to"
      commands[1] = commands[1..2].inject { |sum, command|  sum += " #{command}" }
      commands.delete_at(2)
    end
    commands if testing
  end

  def account_for_long_criteria(commands, testing=false, filter="")
    last_element = commands.length - 1
    if commands.length > 3
      criteria = commands.index(filter) + 1
      commands[criteria] = commands[criteria..last_element].inject { |sum, command| sum += " #{command}" }
      commands.pop(last_element-criteria)
    end
    commands if testing
  end

end
