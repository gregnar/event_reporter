require 'csv'
class CSVParser

  def make_csv
    puts Dir.pwd
    puts File.exists?('../csv/event_attendees.csv')
    file = '../csv/event_attendees.csv'
    csv = CSV.table(file, :header_converters => :symbol, :converters => :all)
  end
end
