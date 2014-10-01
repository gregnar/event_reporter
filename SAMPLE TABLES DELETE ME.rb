array = [
  ["This code", "is", "indeed"],
  ["very", "compact", "and"],
  ["I hope you will", "find", "it helpful!"] ]

def determine_max_lengths(array)
  max_lengths = array.map { |item| item.length }
  array.map do |item|
    item.each_with_index do |thing, index|
      size = thing.size
      max_lengths[index] = size if size > max_lengths[index]
    end
  end
end

def 
array.map do |item|
  format = max_lengths.map { |thing| "%#{thing}s" }.join(" " * 5)
  puts format % item
end
