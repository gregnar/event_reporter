require 'attendee'

class AttendeeRepository

  def populate_repository(csv_array)
    require
    @csv_array = csv_array
    @repository = csv_array.map do |hash|
      Attendee.new(hash)
    end
  end

  def repository
    @repository
  end

  def find(attribute, criteria)
<<<<<<< HEAD
    result = repository.find_all  do |attendee|
      attendee.attribute.downcase == criteria.downcase
    end
    prepare_for_printing(result)
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
=======
    @repository.find_all do |attendee|
      attendee.send(attribute.to_sym) == criteria
    end
  end

>>>>>>> c1c9562102e79d16cc5524ca8e5fd841d733a15e
end
