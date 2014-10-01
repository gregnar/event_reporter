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

  def push(attendee_array)
    current_queue << attendee_array
  end

  def count
    current_queue.count
  end

  def order(attribute)
    ordered_queue = current_queue.sort_by { |item| item.attribute }
  end

  def save_to

  end

end
