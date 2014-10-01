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
    current_queue.push(attendee_array)
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

  def save_to

  end

end
