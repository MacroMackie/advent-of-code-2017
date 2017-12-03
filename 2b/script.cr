input = File.read("input.txt")

result = 0

input.each_line do |line|
  values = line.split.map(&.to_i)
  a,b = find_evenly_divisible(values)
  result += (a>b ? a/b : b/a)
end

def find_evenly_divisible(values)
  values.each_with_index do |a, i|
    values.[(i+1)..-1].each do |b|
      return [a,b] if (a%b == 0 || b%a==0)
    end
  end

  return [0,-1]
end

puts "Result: #{result}"
result
