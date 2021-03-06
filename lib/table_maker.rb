
class TableMaker

  def determine_max_lengths(converted_attendees)
    @max_lengths = [0, 0, 0, 0, 0, 0, 0, 0]
    converted_attendees.map do |attendees|
      attendees.each_with_index do |thing, index|
        size                  = thing.size
        @max_lengths[index]   = size if size > @max_lengths[index]
      end
    end
    @max_lengths
  end

  def make_table(array, max_lengths)
    array.map do |item|
        formatter = max_lengths.map { |thing| "%#{thing}s" }.join(" " * 5)
        formatter.rjust(20) % item
    end
  end

  def turn_attendees_to_attr_array(attendee_list)
    array_for_table   = []
    attendee_list.map do |attendee|
      array_for_table << attribute_array.map do |attribute|
        attendee.send(attribute)
      end
    end
    array_for_table
  end

  def attribute_array
    %i(last_name first_name email zipcode city state address phone)
  end

  def prepare_table(array)
    converted_attendees = turn_attendees_to_attr_array(array)
    add_headers(converted_attendees)
    max_lengths         = determine_max_lengths(converted_attendees)
    make_table(converted_attendees, max_lengths)
  end

  def add_headers(converted_attendees)
    headers             = attribute_array.map { |att| att.to_s.capitalize }
    converted_attendees << headers
    converted_attendees.rotate!(-1)
  end
end
