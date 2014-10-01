require 'csv'
require 'attendee_repository' #temporary dependency to make sure it works
class CSVParser
  def load_csv(file_name)
    file_name = File.join "csv", file_name
    csv = CSV.table(file_name, :header_converters => :symbol, :converters => :all)
  end
end
