require_relative 'test_helper'
require 'attendee_repository'
require 'csv_parser'
require 'pry'

class AttendeeRepositoryTest < Minitest::Test

  def setup
    @attendee_repo = AttendeeRepository.new
    csv = CSVParser.new.load_csv("event_attendees.csv")
    @attendee_repo.populate_repository(csv)
  end

  def test_csv_parser_correctly_loads_attendee_csv
    assert @attendee_repo.repository.count > 5000
  end

  def test_find_attendee_by_attribute_works
    refute @attendee_repo.find("first_name", "Sarah").empty?
    assert @attendee_repo.find("last_name", "SUPERGLUE").empty?
  end

  def test_find_attendee_criteria_is_case_insensitive
    johnsons = @attendee_repo.find("last_name", "jOhNsOn")
    assert "Johnson", johnsons.first.last_name
  end

  def test_repository_correctly_parses_attendee_class
    assert_equal Attendee, @attendee_repo.find("last_name", "johnson").first.class
  end

  def test_attendee_class_correctly_represents_attributes
    johnsons = @attendee_repo.find("last_name", "Johnson")
    assert_equal "Johnson", johnsons.first.last_name

    sarahs = @attendee_repo.find("first_name", "Sarah")
    assert_equal "Sarah", sarahs.first.first_name

    onndys = @attendee_repo.find("email", "onndy@jumpstartlab.com")
    assert_includes onndys.first.email, "jumpstartlab"

    fl_zipcodes = @attendee_repo.find("zip_code", "33559")
    assert_equal 33559, fl_zipcodes.first.zip_code

    raptors = @attendee_repo.find("city", "Toronto")
    assert_equal "Toronto", raptors.first.city

    pale_people = @attendee_repo.find("state", "WV")
    assert_equal "WV", pale_people.first.state

    hood_in_the_capital = @attendee_repo.find("address", "3155 19th St NW")
    assert_equal "3155 19th St NW", hood_in_the_capital.first.address

    the_718 = @attendee_repo.find("phone", "718-290-6000")
    assert_equal "718-290-6000", the_718.first.phone
  end

end
