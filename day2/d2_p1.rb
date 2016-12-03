class D2P1
  ROWS = 3
  COLUMNS = 3
  BOARD_SIZE = Array.new(ROWS) { Array.new(COLUMNS) }
  STARTING_SPOT = 5

  def self.find_start_index(board_size, start_number)
    start_num = start_number
    start_row = 0
    row_length = board_size[0].length

    until start_num <= row_length
      start_num = start_num - row_length
      start_row += 1
    end

    start_col = (start_num - 1)
    [start_row, start_col]
  end

  def self.bathroom
    current_place ||= self.find_start_index(BOARD_SIZE, STARTING_SPOT)
    File.readlines('d2_input.txt').each do |line|
      current_place = enter_code(line, current_place)
      puts translate_to_keypad(current_place)
    end
  end

  def self.translate_to_keypad(current_place)
    (current_place[0]*ROWS) + (current_place[1]+1)
  end


  def self.enter_code(line, current_place)
    line.each_char { |chr|  current_place = next_step(chr, current_place) }
    current_place
  end

  def self.next_step(chr, current_place)
    if valid_spot?(chr, current_place)
      current_place = move_place(chr, current_place)
    end
    current_place
  end

  def self.valid_spot?(chr, current_place)
    result = false
    case chr
    when 'U'
      result = (current_place[0]-1) > -1
    when 'D'
      result = (current_place[0]+1) < ROWS
    when 'R'
      result = (current_place[1]+1) < COLUMNS
    when 'L'
      result = (current_place[1]-1) > -1
    end
    result
  end

  def self.move_place(chr, current_place)
    case chr
    when 'U'
      current_place = [(current_place[0]-1), current_place[1]]
    when 'D'
      current_place = [(current_place[0]+1), current_place[1]]
    when 'R'
      current_place = [current_place[0], (current_place[1]+1)]
    when 'L'
      current_place = [current_place[0], (current_place[1]-1)]
    end
    current_place
  end

  def self.find_start_index(board_size, start_number)
    start_num = start_number
    start_row = 0
    row_length = board_size[0].length

    until start_num <= row_length
      start_num = start_num - row_length
      start_row += 1
    end

    start_col = (start_num - 1)
    [start_row, start_col]
  end
  D2P1.bathroom
end
