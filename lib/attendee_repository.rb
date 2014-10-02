require 'attendee'

class AttendeeRepository

  def initiailize
    @repository = []
  end

  def populate_repository(csv_array)
    @csv_array = csv_array
    @repository = csv_array.map do |hash|
      Attendee.new(hash)
    end
  end

  def repository
    @repository
  end

  def find(attribute, criteria, repo=@repository)
    result = repo.find_all do |attendee|
      attendee.send(attribute.to_sym).to_s.downcase == criteria.downcase
    end
    result
  end

end
