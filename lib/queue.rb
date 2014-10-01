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
<<<<<<< HEAD
=======
    print_queue(ordered_queue)
  end

  def print_queue(queue_to_print=current_queue)

>>>>>>> c1c9562102e79d16cc5524ca8e5fd841d733a15e
  end

  def save_to

  end

end
