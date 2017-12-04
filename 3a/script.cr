target = File.read("input.txt").to_i

def calculate_circle(num)
  return 0 if num <= 1

  circle = 0

  loop do
    circle += 1
    return circle if (circle*2 + 1)**2 >= num
  end
end

def calculate_distance(num)
  return 0 if num <= 1

  circle = calculate_circle(num)
  circle_pow = (circle*2 + 1)

  circle_starting_num = (circle*2 - 1)**2 + 1
  circle_ending_num = (circle*2 + 1)**2
  circle_full_size = circle_ending_num - circle_starting_num
  circle_interval_num = (circle_full_size + 1)/4
  circle_offset_num = num - circle_starting_num

  middles = (1..4).map { |x| x*circle_interval_num + circle_starting_num - circle - 1 }

  closest_match = middles.min_by { |x| (x - num).abs }
  closest_diff = (closest_match - num).abs
  closest_diff + circle
end

result = calculate_distance(target)
puts "Result: #{result}"
result
