input = File.read("input.txt")

result = 0

input.each_line do |line|
  words = line.split(" ")
  words.map! do |word|
    word.chars.sort.join
  end

  valid = words.uniq.size == words.size
  result += (valid ? 1 : 0)
end

puts "Result: #{result}"
result
