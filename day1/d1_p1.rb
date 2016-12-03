def quick_blocks(directions)
  dir = directions.split(", ")
  x_axis = 0
  y_axis = 0

  twice = 0

  north = true
  east = (dir.first[0] == "R")
  visited = {}

  dir.each_with_index do |step, index|
    step_dir = step[0]
    step_num = step[1..-1].to_i

    if visited.has_key?(x_axis) && visited[x_axis].first.has_key?(y_axis)
      twice = visited[x_axis].first[y_axis]
      puts twice
    elsif visited.has_key?(x_axis)
      visited[x_axis].first[y_axis] = (x_axis.abs + y_axis.abs)
    else
      visited[x_axis]= [Hash.new { |hash, key| hash[y_axis] = (x_axis.abs + y_axis.abs) }]
    end

    if index%2 == 0
      if north
        if (step_dir == "R")
          x_axis += step_num
          east = true
        elsif(step_dir == "L")
          x_axis -= step_num
          east = false
        end
      else
        if (step_dir == "R")
          x_axis -= step_num
          east = false
        else
          x_axis += step_num
          east = true
        end
      end
    else
      if east
        if (step_dir == "L")
          y_axis += step_num
          north = true
        else
          y_axis -= step_num
          north = false
        end
      else
        if (step_dir == "")
          y_axis -= step_num
          north = false
        else
          y_axis += step_num
          north = true
        end
      end
    end
    # if visited.has_key?(x_axis) && visited[x_axis].first.has_key?(y_axis)
    #   twice = visited[x_axis].first[y_axis]
    #   puts twice
    # elsif visited.has_key?(x_axis)
    #   visited[x_axis].first[y_axis] = (x_axis.abs + y_axis.abs)
    # else
    #   visited[x_axis]= [Hash.new { |hash, key| hash[y_axis] = (x_axis.abs + y_axis.abs) }]
    # end
  end
  return twice
end
directions = "R5, L5, R5, L5, R3"
dir2= "R4, R3, R5, L3, L5, R2, L2, R5, L2, R5, R5, R5, R1, R3, L2, L2, L1, R5, L3, R1, L2, R1, L3, L5, L1, R3, L4, R2, R4, L3, L1, R4, L4, R3, L5, L3, R188, R4, L1, R48, L5, R4, R71, R3, L2, R188, L3, R2, L3, R3, L5, L1, R1, L2, L4, L2, R5, L3, R3, R3, R4, L3, L4, R5, L4, L4, R3, R4, L4, R1, L3, L1, L1, R4, R1, L4, R1, L1, L3, R2, L2, R2, L1, R5, R3, R4, L5, R2, R5, L5, R1, R2, L1, L3, R3, R1, R3, L4, R4, L4, L1, R1, L2, L2, L4, R1, L3, R4, L2, R3, L1, L5, R4, R5, R2, R5, R1, R5, R1, R3, L3, L2, L2, L5, R2, L2, R5, R5, L2, R3, L5, R5, L2, R4, R2, L1, R3, L5, R3, R2, R5, L1, R3, L2, R2, R1"
dir3 = "R4, R3, R5, L3, L5, R2, L2, R5"
quick_blocks("R4, R3, R5, L3, L5, R2, L2, R5, L2, R5, R5, R5, R1, R3, L2, L2, L1, R5, L3, R1, L2, R1, L3, L5, L1, R3, L4, R2, R4, L3, L1, R4, L4, R3, L5, L3, R188, R4, L1, R48, L5, R4, R71, R3, L2, R188, L3, R2, L3, R3, L5, L1, R1, L2, L4, L2, R5, L3, R3, R3, R4, L3, L4, R5, L4, L4, R3, R4, L4, R1, L3, L1, L1, R4, R1, L4, R1, L1, L3, R2, L2, R2, L1, R5, R3, R4, L5, R2, R5, L5, R1, R2, L1, L3, R3, R1, R3, L4, R4, L4, L1, R1, L2, L2, L4, R1, L3, R4, L2, R3, L1, L5, R4, R5, R2, R5, R1, R5, R1, R3, L3, L2, L2, L5, R2, L2, R5, R5, L2, R3, L5, R5, L2, R4, R2, L1, R3, L5, R3, R2, R5, L1, R3, L2, R2, R1")
