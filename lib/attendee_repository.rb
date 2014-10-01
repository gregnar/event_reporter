require 'attendee'

class AttendeeRepository

  def populate_repository(csv_array)
    @csv_array = csv_array
    @repository = csv_array.map do |hash|
      Attendee.new(hash)
    end
  end

  def repository
    @repository
  end

  def find(attribute, criteria)
    result = @repository.find_all do |attendee|
      attendee.send(attribute.to_sym).to_s.downcase == criteria
    end
    prepare_for_printing(result)
    require 'pry'
    binding.pry
    result
  end

  def prepare_for_printing(attendee_list)
    attendee_list.map do |a|
      [a.last_name,
        a.first_name,
        a.email,
        a.zip_code,
        a.state,
        a.address,
        a.phone]
    end
  end

end
