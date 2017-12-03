# Read only integers from file
input = File.read("input.txt").gsub(/[^0-9]+/i, "")

# Get number of steps to go halfway around
halfway_steps = input.size/2

# Iterate, adding to the sum if a match is found
result = (0...input.size).reduce(0) do |sum, i|
  a = input[i]
  b = input[(i+halfway_steps) % input.size]
  sum + (a == b ? a.to_i : 0)
end

puts "Result: #{result}"
result
