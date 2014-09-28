class CLI

end


gets_command
interpreted_command = CommandInterpreter.interpret(@command)
UserCommands.new.execute_command(interpreted_command)



def gets_command
  @command = gets.chomp
end
