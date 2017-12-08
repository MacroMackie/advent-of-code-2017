input = File.read("input.txt")

ints = input.split(" ").map(&.to_i)
matches = [] of String
counter = 0

match_index = 0

loop do
  matches.push(ints.join("."))

  max = ints.max
  loc = ints.index(max) || 0

  ints[loc] = 0
  (0...max).each do |i|
    ints[(loc + (i+1)) % ints.size] += 1
  end

  match_index = matches.index(ints.join("."))

  counter += 1
  break if (match_index)
end

match_index ||= 0

puts "Result: #{counter - match_index}"
counter
