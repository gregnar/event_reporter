require 'csv'  # => true

class CSVParser

  CSV::Converters[:blank_to_nil] = lambda do |field|                                                                                             # => :blank_to_nil
  field && field.empty? ? nil : field
  end

  def make_csv                                                                                                                                     # => #<Proc:0x007ff229212910@/Users/herbertjoseph/TuringSchool/event_reporter/lib/csv_parser.rb:5 (lambda)>
    csv = CSV.new(File.read('../csv/event_attendees.csv'), :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])  # ~> Errno::ENOENT: No such file or directory @ rb_sysopen - ../csv/event_attendees.csv
    csv.to_a.map { |row| row.to_hash }
  end
end

# ~> Errno::ENOENT
# ~> No such file or directory @ rb_sysopen - ../csv/event_attendees.csv
# ~>
# ~> /Users/herbertjoseph/TuringSchool/event_reporter/lib/csv_parser.rb:8:in `read'
# ~> /Users/herbertjoseph/TuringSchool/event_reporter/lib/csv_parser.rb:8:in `<class:CSVParser>'
# ~> /Users/herbertjoseph/TuringSchool/event_reporter/lib/csv_parser.rb:3:in `<main>'
