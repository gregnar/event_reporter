require 'csv'
require_relative 'attendee_repository' #temporary dependency to make sure it works
class CSVParser

  def load_csv(file_name)
    csv = CSV.table(file_name, :header_converters => :symbol, :converters => :all)
  end
end

csv = CSVParser.new.make_csv
repo = AttendeeRepository.new.populate_repository(csv)
puts repo[1].first_name
