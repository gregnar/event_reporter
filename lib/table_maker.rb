class TableMaker

  def initialize(stdout = $stdout)
    @stdout = stdout
  end

  def determine_max_lengths(array)
    max_lengths = array.map { |item| item.length }
    array.map do |item|
      item.each_with_index do |thing, index|
        size = thing.size
        max_lengths[index] = size if size > max_lengths[index]
      end
    end
  end

  def make_table(array, max_lengths)
    array.map do |item|
      format = max_lengths.map { |thing| "%#{thing}s" }.join(" " * 5)
      format % item
    end
  end

#Array_for_table is an array of attendee attributes. take array of attendees
  def turn_attendees_to_attr_array(attendee_list)
    array_for_table = []
    attendee_list.map do |attendee|
      array_for_table << attribute_array.map do |attribute|
        attendee.attribute
      end
    end
    array_for_table
  end

  def attribute_array
    [last_name, first_name, email, zip_code, state, address, phone]
  end

  def print_table(array)
    converted_attendees = turn_attendees_to_attr_array(array)
    max_lengths = determine_max_lengths(converted_attendees)
    @stdout.puts make_table(coverted_attendees, max_lengths)
  end
end
