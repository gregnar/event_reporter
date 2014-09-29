require 'csv'
class CSVParser

  # CSV::Converters[:blank_to_nil] = lambda do |field|
  # field && field.empty? ? nil : field
  # end

  def make_csv
    puts Dir.pwd
    puts File.exists?('../csv/event_attendees2.csv')
    file = '../csv/event_attendees.csv'
    csv = CSV.table(file, :header_converters => :symbol, :converters => :all)
  require 'pry'
    binding.pry

    #csv.to_a.map { |row| row.to_hash }
  end
end

csv = CSVParser.new.make_csv

# ls -s some_object       <-- show method names/instance vars
# edit -p some_method     <-- open the code in an editor
# show-source some_method <-- display the source code of the method
# show-doc some_method    <-- display docs for the method (if they're written)
# cd some_obj             <-- change self to be some_obj
# whereami                <-- show me the code I'm in the middle of
