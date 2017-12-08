input = File.read("test1.txt")

tree = {} of String => Array(String)

input.each_line do |line|
  values = line.split(" ")
  current = values.first
  weight = values[1][1..2]

  tree[current] = [] of String

  if (values.size > 2)
    (3...values.size).each do |x|
      holding = values[x].gsub(",","")
      tree[current].push(holding)
    end
  end
end

result = tree.reduce(nil) do |base, val|
  if !base && val[1].size > 0
    val[0]
  else
    val[1].includes?(base) ? val[0] : base
  end
end

puts "Result: #{result}"
