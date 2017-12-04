target = File.read("input.txt").to_i

storage = Hash(String, Hash(String, String)).new

def arr_set(store, x, y, val)
  store[x.to_s] ||= Hash(String, String).new
  store[x.to_s][y.to_s] = val.to_s
  val
end

def arr_get(store, x, y)
  store[x.to_s] ||= Hash(String, String).new
  store[x.to_s].fetch(y.to_s, "0")
end


def move_next(store, x, y, current_dir)
  # go up
  return [x,y+1,2] if current_dir == 1 && arr_get(store, x,y+1).to_i == 0

  # go left
  return [x-1,y,3] if current_dir == 2 && arr_get(store, x-1,y).to_i == 0

  # go down
  return [x,y-1,4] if current_dir == 3 && arr_get(store, x,y-1).to_i == 0

  # go right
  return [x+1,y,1] if current_dir == 4 && arr_get(store, x+1,y).to_i == 0

  return [x,y+1,2] if current_dir == 2
  return [x-1,y,3] if current_dir == 3
  return [x,y-1,4] if current_dir == 4
  return [x+1,y,1]
end


arr_set(storage, 0,0,1)

counter = 1
current_x = 1
current_y = 0
current_dir = 1

loop do
  current_sum = [-1,0,1].product([-1,0,1]).reduce(0) do |sum, x|
    a,b = x
    sum + arr_get(storage, current_x + a,current_y + b).to_i
  end

  arr_set(storage, current_x, current_y, current_sum)

  current_x, current_y, current_dir = move_next(storage, current_x, current_y, current_dir)



  if current_sum > target
    puts "Success."
    puts current_sum
    break
  end
end
