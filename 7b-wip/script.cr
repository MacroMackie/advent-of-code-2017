input = File.read("test1.txt")

weights = {} of String => Int32
tree = {} of String => String
tree_arr = {} of String => Array(String)


input.each_line do |line|
  values = line.split(" ")
  current = values.first
  weight = values[1][1..2]

  tree[current] ||= ""
  weights[current] = weight.to_i

  if (values.size > 2)
    (3...values.size).each do |x|

      holding = values[x].gsub(",","")
      tree[holding] = current
    end
  end
end

tree_arr = tree.reduce({} of String => Array(String)) do |s, x|
  s[x[1]] ||= [] of String
  s[x[1]].push(x[0])
  s
end

puts tree_arr

puts "Result: #{12}"
