input = File.read("input.txt")

ints = input.split(" ").map(&.to_i)
matches = [] of String
counter = 0

loop do
  matches.push(ints.join("."))

  max = ints.max
  loc = ints.index(max) || 0

  ints[loc] = 0
  (0...max).each do |i|
    ints[(loc + (i+1)) % ints.size] += 1
  end

  break if (matches.size != matches.uniq.size)
  counter += 1
end

puts "Result: #{counter}"
counter
