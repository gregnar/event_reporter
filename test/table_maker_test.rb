require_relative 'test_helper'
require 'table_maker'
require 'csv_parser'
require 'attendee_repository'
#require 'cli'

class TableMakerTest < Minitest::Test

  def test_it_outputs_the_right_info
    tester = StringIO.new
    maker = TableMaker.new(tester)
    #cli = CLI.new
    csv_reader = CSVParser.new
    attendee_repo = AttendeeRepository.new
    csv = csv_reader.load_csv('event_attendees.csv')
    attendee_repo.populate_repository(csv)
    data = attendee_repo.find(:first_name, "John")
    assert_includes "John", maker.print_table(data)
  end
end
