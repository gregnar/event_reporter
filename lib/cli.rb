require_relative 'csv_parser'
class CLI

  def initialize
    @attendees_list = CSVPaser.new.make_csv
  end





end


gets_command
interpreted_command = CommandInterpreter.interpret(@command)
UserCommands.new.execute_command(interpreted_command)



def gets_command
  @command = gets.chomp
end
