input = File.read("input.txt")

state = {} of String => Int32

directionMappings = {
  "inc" => 1,
  "dec" => -1
}

maximum = 0

input.each_line do |line|
  x = line.split(" ")

  register = x[0] || "a"
  direction = x[1] || "inc"
  amount = x[2].to_i || 0
  compReg = x[4] || "a"
  compOp = x[5] || "<"
  compNum = x[6].to_i || 0

  # Set defaults
  state[register] ||= 0
  state[compReg] ||= 0

  a = state[compReg]
  b = compNum

  result =  case compOp
  when ">"  then a > b
  when ">=" then a >= b
  when "==" then a == b
  when "<=" then a <= b
  when "<"  then a < b
  when "!=" then a != b
  else false
  end

  if result
    state[register] += directionMappings[direction]*amount
  end

  largest = state.values.max
  maximum = Math.max(maximum, largest)
end

puts "Result: #{maximum}"
maximum
