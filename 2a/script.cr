input = File.read("input.txt")

result = 0

input.each_line do |line|
  a,b = line.split.map(&.to_i).minmax
  result += b - a
end

puts "Result: #{result}"
result
