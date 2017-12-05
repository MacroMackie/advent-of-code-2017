input = File.read("input.txt")

inputs = [] of Int32

input.each_line { |line| inputs.push(line.to_i) }

last_location = 0
location = 0
steps = 0

loop do
  break if location < 0 || location >= inputs.size

  last_location = location

  location = location + inputs[location]
  inputs[last_location] += 1
  steps += 1
end

puts "Steps: #{steps}"
