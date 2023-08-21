# frozen_string_literal: true

def read_input(input_file)
  lines = File.read(input_file).split("\n")
  crates = initialize_crates(lines.slice(0, lines.index('')).reverse)
  moves = get_move_list(lines.slice(lines.index('') + 1, lines.length))
  [crates, moves]
end

def read_from_lines(index, lines)
  # line_index is to find where a value for a specific crate is in a
  # line, based on how the input file is written
  line_index = (4 * index) + 1
  output = []
  lines.each do |line|
    value = line[line_index]
    output.push(value) unless value.nil? || value == ' '
  end
  output
end

def initialize_crates(crate_lines)
  crates = []
  (0...crate_lines.shift.split(' ').last.to_i).each do |index|
    crates.push(read_from_lines(index, crate_lines))
  end

  crates
end

def get_move_list(move_lines)
  moves = []
  move_lines.each do |line|
    # Moves are written as 'move x from y to z'
    moves.push(line.delete('movefrt').strip.split(' ').map(&:to_i))
  end

  moves
end

def run(crates, moves)
  moves.each do |move|
    number = move[0]
    crates[move[1] - 1].pop(number).reverse.each do |crate|
      crates[move[2] - 1].push(crate)
    end
  end
end

crates, moves = read_input('inputs/05.txt')
run crates, moves

puts '--- Day 5: Supply Stacks ---'
p1_answer = []
crates.each do |crate|
  p1_answer.push(crate.last)
end
puts p1_answer.join