def distance_traveled(time)
  result = 0.5 * first_acc * primary_time(time) * primary_time(time)
  if secondary_time > 0
    result += primary_vel(first_acc) + secondary_time + 5 * secondary_acc * secondary_time * secondary_time
  end
  result
end

def first_acc
  @primary_force / @mass
end

def primary_time(time)
  [time, @delay].min
end

def secondary_time(time)
  time - @delay
end

def primary_vel(acc)
  acc * delay
end

def secondary_acc
  (@primary_force + @secondary_force) / @mass
end
