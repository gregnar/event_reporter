array = [
  ["This code", "is", "indeed"],                # => ["This code", "is", "indeed"]
  ["very", "compact", "and"],                   # => ["very", "compact", "and"]
  ["I hope you will", "find", "it helpful!"] ]  # => [["This code", "is", "indeed"], ["very", "compact", "and"], ["I hope you will", "find", "it helpful!"]]


max_lengths = array.map { |item| item.length }              # => [3, 3, 3]
array.map do |item|                                         # => [["This code", "is", "indeed"], ["very", "compact", "and"], ["I hope you will", "find", "it helpful!"]]
  item.each_with_index do |thing, index|                    # => ["This code", "is", "indeed"], ["very", "compact", "and"], ["I hope you will", "find", "it helpful!"]
    size = thing.size                                       # => 9, 2, 6, 4, 7, 3, 15, 4, 11
    max_lengths[index] = size if size > max_lengths[index]  # => 9, nil, 6, nil, 7, nil, 15, nil, 11
  end                                                       # => ["This code", "is", "indeed"], ["very", "compact", "and"], ["I hope you will", "find", "it helpful!"]
end                                                         # => [["This code", "is", "indeed"], ["very", "compact", "and"], ["I hope you will", "find", "it helpful!"]]

array.map do |item|                                                # => [["This code", "is", "indeed"], ["very", "compact", "and"], ["I hope you will", "find", "it helpful!"]]
  format = max_lengths.map { |thing| "%#{thing}s" }.join(" " * 5)  # => "%15s     %7s     %11s", "%15s     %7s     %11s", "%15s     %7s     %11s"
  puts format % item                                               # => nil, nil, nil
end                                                                # => [nil, nil, nil]

puts "%15s %7s %8s" % ["This code", "is", "indeed"]  # => nil
