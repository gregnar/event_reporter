require 'csv'  # => true

class CSVParser

  CSV::Converters[:blank_to_nil] = lambda do |field|  # => :blank_to_nil
  field && field.empty? ? nil : field
  end                                                 # => #<Proc:0x007fec8a097f08@/Users/Greg/turing/event_reporter/lib/csv_parser.rb:5 (lambda)>

  def make_csv
    csv = CSV.new(File.read('../csv/event_attendees.csv'), :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])  # ~> Errno::ENOENT: No such file or directory @ rb_sysopen - ../csv/event_attendees
    csv.to_a.map { |row| row.to_hash }
  end
end

CSVParser.new.make_csv

# ~> Errno::ENOENT
# ~> No such file or directory @ rb_sysopen - ../csv/event_attendees
# ~>
# ~> /Users/Greg/turing/event_reporter/lib/csv_parser.rb:10:in `read'
# ~> /Users/Greg/turing/event_reporter/lib/csv_parser.rb:10:in `make_csv'
# ~> /Users/Greg/turing/event_reporter/lib/csv_parser.rb:15:in `<main>'
