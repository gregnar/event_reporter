require 'csv'

class Queue

  def initialize
    @current_queue = []
  end

  def current_queue
    @current_queue
  end

  def clear
    current_queue = []
  end

  def << (attendee_array)
    attendee_array.map do |attendee|
      current_queue.push(attendee)
    end
  end

  def count
    current_queue.count
  end

  def order(attribute)
    ordered_queue = current_queue.sort_by { |item| item.attribute }
    print_queue(ordered_queue)
  end

  def print_queue(attribute=current_queue)
    puts current_queue
  end

  def save_to(filename)
    CSV.open("/csv/#{filename}.csv", "w") do |csv|
      current_queue.each{ }
      csv << ["row", "of", "CSV", "data"]
    end
    values_to_save = current_queue.map do |hash|
      select_values_to_save(hash)
    end
  end

  def select_values_to_save(hash)
    hash.values.select do
    end
  end

end
