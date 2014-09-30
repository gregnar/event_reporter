array = [
  ["This code", "is", "indeed"],
  ["very", "compact", "and"],
  ["I hope you will", "find", "it helpful!"] ]


max_lengths = array.map { |item| item.length }
array.map do |item|
  item.each_with_index do |thing, index|
    size = thing.size
    max_lengths[index] = size if size > max_lengths[index]
  end
end

array.map do |item|
  format = max_lengths.map { |thing| "%#{thing}s" }.join(" " * 5)
  puts format % item
end

puts "%15s %7s %8s" % ["This code", "is", "indeed"]
