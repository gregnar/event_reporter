require 'pry'

class MessagePrinter

  def clear_console
    "\e[2J\e[f"
  end

  #print to user
  def welcome
    "Welcome to Event Reporter! For help, use the help command."
  end

  def load_complete(file)
    "#{file} loaded sucessfully."
  end

  def queue_count(attendees)
    "#{attendees.count} matches currently in the queue."
  end

  def queue_clear
    "The queue has been cleared. There are no matches currently stored."
  end

  def queue_print
    #print attendee data according to table and attributes
  end

  def ask_filename
    "What do you wish the file's name to be saved as?"
  end

  def queue_saved_to(filename)
    "Saved successful! Saved as ''#{filename}.csv' in the program's 'saves' directory"
  end

  def matches_found(matches)
    "#{matches.count} matches found!"
  end

  #invalid/incorrect prompts
  def no_matches(criteria, attribute)
    "No matches found for #{criteria} in #{attribute} attribute."
  end

  def invalid_command(command)
    "Invalid command: #{command}. Use help command for available commands and instructions"
  end

  #help commands
  def available_commands
    "Here are the available commands.

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
    "The queue holds the stored results from a previous search.
    As the user, you issue a search command to find records, then later issue
    another command to do work with those results. The queue is not cleared
      until the user runs the command queue clear or a new find command.

        The queue commands are: count, clear, print, print by <attribute>, and
        save to <filename.csv>.

      To see what attributes are available to you, use the 'help attributes' command"
  end

  def find_instructions
    "The find command acts as a way to pinpoint the information you want within
    the database of attendees.

      Here's how the find command works: 'find <attribute> <criteria>'.
      Ex. 'find last_name Johnson'.

    To see what attributes are available to you, use the 'help attributes' command."
  end

  def queue_command_help(command)
    options = {
      clear: "Queue clear removes anything currently in the queue.",
      count: "Output how many records are in the current queue.",
      print: "Print out a tab-delimited data table with a header row following
              this format: LAST_NAME  FIRST_NAME  EMAIL  ZIPCODE  CITY  STATE
              ADDRESS PHONE",
      print_by: "Prints the data table sorted by the specified attribute like zipcode.",
      save_to: "Exports the current queue to the specified filename as a CSV.
                The file includes data and headers for last name, first name,
                email, zipcode, city, state, address, and phone number."
    }
    options.fetch(command)
  end

  def attributes
    "There are 8 different attributes to utilize in this program:

        1.last_name
        2.first_name
        3.email
        4.zipcode
        5.city
        6.state
        7.address
        8.phone

    These are the categories that the attendee data is separated by."
  end

end
