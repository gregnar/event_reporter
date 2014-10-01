def gets_command
  @command = gets.strip
end

def evaluate(input)
  input.downcase
  check_input_valid(input)
  splitted = input.split
  if splitted.include?("load")
    CSVParser.load(splitted[1])
  elsif splitted.include?("help")
    if splitted.count == 1
      printer.help_general
    else
      printer.help(splitted[1])
    end
  elsif splitted.include?("queue")
    evaluate_queue(splitted)
end

def evaluate_queue(splitted)
  queue.count if splitted[1] == "count"
  queue.clear if splitted[1] == "clear"
  queue.save_to if splitted[1] == "save"
  if splitted[1] = "print"
    queue.print_by(splitted[3]) if splitted.count == 4
    queue.print if splitted.count ==3
  end
end
end

def check_valid_input(input)
  valid_input = ["load",
                 "help",
                 "queue count",
                 "queue clear",
                 "queue print",
                 "queue print",
                 "queue save to",
                 "find"
                 ]
  if !valid_input.any? {|item| input.start_with?(item)}
    puts "Invalid!"
  else puts "valid!"
  end
end

check_valid_input("queue count")
check_valid_input("search")
check_valid_input("help quit")
