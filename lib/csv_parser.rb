require 'csv'
require_relative 'attendee_repository' #temporary dependency to make sure it works
class CSVParser

  def make_csv
    puts Dir.pwd
    puts File.exists?('../csv/event_attendees.csv')
    file = '../csv/event_attendees.csv'
    csv = CSV.table(file, :header_converters => :symbol, :converters => :all)
  end
end

csv = CSVParser.new.make_csv
repo = AttendeeRepository.new.populate_repository(csv)
puts repo[1].first_name
