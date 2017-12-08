input = File.read("input.txt")

tree = {} of String => String

input.each_line do |line|
  values = line.split(" ")
  current = values.first
  weight = values[1][1..2]

  tree[current] ||= ""


  if (values.size > 2)
    (3...values.size).each do |x|

      holding = values[x].gsub(",","")
      tree[holding] = current
    end
  end
end

result = tree.select do |x|
  tree[x] == ""
end

puts "Result: #{result.keys.first}"
