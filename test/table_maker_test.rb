require_relative 'test_helper'
require 'table_maker'
require 'csv_parser'
require 'attendee_repository'
#require 'cli'

class TableMakerTest < Minitest::Test

  def test_prepare_table
    tester = StringIO.new
    maker = TableMaker.new
    csv_reader = CSVParser.new
    attendee_repo = AttendeeRepository.new
    csv = csv_reader.load_csv('event_attendees.csv')
    attendee_repo.populate_repository(csv)
    data = attendee_repo.find(:first_name, "John")

    prepared_table = maker.prepare_table(data)

    assert prepared_table.all? {|entry| entry.downcase.include?("john")}

    #check table format by ensuring entry lengths are the same
    assert prepared_table[1].length == prepared_table[2].length
  end
end
