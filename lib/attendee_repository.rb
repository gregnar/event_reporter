require_relative 'attendee'

class AttendeeRepository

  def populate_repository(csv_array)
    @repository = csv_array.map do |hash|
      Attendee.new(hash)
    end
  end

end
