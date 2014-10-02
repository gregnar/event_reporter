require 'csv'
require 'table_maker'

class Queue

  def initialize
    @current_queue = []
    @table_maker = TableMaker.new
  end

  def current_queue
    @current_queue
  end

  def clear
    @current_queue = []
  end

  def << (attendee_array)
    attendee_array.map do |attendee|
      current_queue.push(attendee)
    end
  end

  def count
    current_queue.count
  end

  def ordered_queue(attribute)
    return current_queue.sort_by { |item| item.send(attribute) }
  end

  def prep_for_save
    header = [:last_name, :first_name, :email_address,
              :zipcode, :city, :state, :address,:phone]
    queue_csv = @table_maker.turn_attendees_to_attr_array(current_queue)
    queue_csv.unshift(header)
    return queue_csv
  end

  def save_to(filename)
    filename = File.join "csv", filename
    CSV.open("#{filename}.csv", "wb") do |csv|
      prep_for_save.each{ |row| csv << row }
    end
  end

end
