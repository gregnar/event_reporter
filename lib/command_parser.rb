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
    commands = command.split
    @primary_command = commands.first
    @secondary_command = commands[1]
    @third_command = commands[2] if commands[2] != nil
  end

  def account_for_by
  end
end
