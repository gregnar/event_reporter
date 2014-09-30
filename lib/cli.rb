require 'csv_parser'
require 'attendee_repository'

class CLI
  def initialize
  end

  def evaluate(user_input)
    tokens  = user_input.split
    command = tokens.first
    if command == "load"
      raw_attendees = CSVParser.new.load_csv tokens.last
      repo = AttendeeRepository.new
      repo.populate_repository raw_attendees
    else
      0
    end
    require "pry"
    binding.pry
  end
end
