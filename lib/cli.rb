require 'csv_parser'
class CLI
  def initialize
    @attendees_list = CSVPaser.new.make_csv
  end
end
