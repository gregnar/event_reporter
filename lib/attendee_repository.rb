require_relative 'attendee'

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
    repository.find_all {|attendee| attendee.attribute.downcase == criteria.downcase}
  end

  

end
