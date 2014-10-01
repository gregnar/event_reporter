require 'attendee'

class AttendeeRepository

  def populate_repository(csv_array)
    @repository = csv_array.map do |hash|
      Attendee.new(hash)
    end
  end

  def repository
    @repository
  end

  def find(attribute, criteria)
    @repository.find_all do |attendee|
      attendee.send(attribute.to_sym) == criteria
    end
  end

end
