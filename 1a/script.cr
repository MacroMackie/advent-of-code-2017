# Read only integers from file
input = File.read("input.txt").gsub(/[^0-9]+/i, "")

# Allow number comparisons to "wrap"
wrapped_input = input + input[0]

# Iterate, adding to the sum if a match is found
result = (0...input.size).reduce(0) do |sum, i|
  a,b = wrapped_input[i..i+1]
  sum + (a == b ? a.to_i : 0)
end

puts "Result: #{result}"
result
