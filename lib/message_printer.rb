require 'colorize'

class MessagePrinter

  def initialize(interface)
    @stream = interface
  end

  def clear_console
    @stream.puts "\e[2J\e[f"
  end

  #print to user
  def welcome
    @stream.puts "\n\n\nooooooo__________________________oo_______ooooooo______________________________________oo____________________
oo______oo____o__ooooo__oo_ooo___oo_______oo____oo___ooooo_____ooooo___ooooo__oo_ooo___oo_____ooooo__oo_ooo__
oooo____oo____o_oo____o_ooo___o_oooo______oo____oo__oo____o____o___oo_oo___oo_ooo___o_oooo___oo____o_ooo___o_
oo______oo___o__ooooooo_oo____o__oo_______ooooooo___ooooooo___oo___oo_oo___oo_oo_______oo____ooooooo_oo______
oo_______oo_o___oo______oo____o__oo__o____oo____oo__oo________oo___oo_oo___oo_oo_______oo__o_oo______oo______
ooooooo___oo_____ooooo__oo____o___ooo_____oo_____oo__ooooo__o_ooooo____ooooo__oo________ooo___ooooo__oo______
____________________________________________________________oooo_____________________________________________
\n\n\n".yellow
    @stream.puts "Welcome to Event Reporter! For help, use the help command."
  end

  def save_successful
    @stream.puts "Save successful!"
  end

  def save_error
    @stream.puts "Error! Something went wrong with the saving process!"
  end

  def show_count(count)
    @stream.puts "There are #{count} records currently in queue."
  end

  def waiting_for_command
    @stream.puts "Waiting for command..."
  end

  def invalid_file_name(filename)
    @stream.puts "Invalid filename '#{filename}'. Not found in CSV directory."
  end

  def load_complete
    @stream.puts "Load successful."
  end

  def queue_clear
    @stream.puts "Queue emptied. There are no matches currently stored."
  end

  def print_queue(data)
    data.each_entry { |entry| @stream.puts entry }
  end

  def ask_filename
    @stream.puts "What do you wish the file's name to be saved as?"
  end

  def queue_saved_to(filename)
    @stream.puts "Saved successful! Saved as '#{filename}.csv' in the program's 'saves' directory"
  end

  def matches_found(matches)
    @stream.puts "#{matches} matches found!"
  end

  def goodbye
    @stream.puts "Thanks for using Event Reporter! Goodbye!"
  end

  #invalid/incorrect prompts
  def no_matches(criteria, attribute)
    @stream.puts "No matches found for #{criteria} in #{attribute} attribute."
  end

  def invalid_command
    @stream.puts "Invalid command. Use help command for available commands and instructions"
  end

  def not_loaded
    @stream.puts "No file loaded! Try loading first."
  end

  #help commands
  def available_commands
    @stream.puts "Here are the available commands.

      1. load <filename>
      2. help
      3. help <command>
      4. queue count
      5. queue clear
      6. queue print
      7. queue print by <attribute>
      8. queue save to <filename.csv>
      9. find <attribute> <criteria>

    For help with a specific command, please use 'help (insert wanted command)'."
  end

  def queue_instructions
    @stream.puts "The queue holds the stored results from a previous search.
    As the user, you issue a search command to find records, then later issue
    another command to do work with those results. The queue is not cleared
      until the user runs the command queue clear or a new find command.

        The queue commands are: count, clear, print, print by <attribute>, and
        save to <filename.csv>.

      To see what attributes are available to you, use the 'help attributes' command"
  end

  def find_instructions
    @stream.puts "The find command acts as a way to pinpoint the information you want within
    the database of attendees.

      Here's how the find command works: 'find <attribute> <criteria>'.
      Ex. 'find last_name Johnson'.

    To see what attributes are available to you, use the 'help attributes' command."
  end

  def queue_command_help(command)
    case command
    when "clear"      then @stream.puts("Queue clear removes anything currently in the queue.")
    when "count"      then @stream.puts("Shows how many records are in the current queue.")
    when "print"      then @stream.puts("Print out a tab-delimited data table with a header row following this format:

              LAST_NAME  FIRST_NAME  EMAIL  ZIPCODE  CITY  STATE  ADDRESS  PHONE\n\n")
    when "print_by"   then @stream.puts("Prints the data table sorted by the specified attribute like zip code.")
    when "save_to"    then @stream.puts("Exports the current queue to the specified filename as a CSV.
                The file includes data and headers for last name, first name,
                email, zip code, city, state, address, and phone number.")
    end
  end

  def attributes
    @stream.puts "There are 8 different attributes to utilize in this program:

        1. last_name
        2. first_name
        3. email
        4. zipcode
        5. city
        6. state
        7. address
        8. phone

    These are the categories that the attendee data is separated by."
  end
end
