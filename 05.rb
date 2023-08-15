# frozen_string_literal: true

def read_input(input_file)
  lines = File.read(input_file).split("\n")
  crates = initialize_crates(lines.slice(0, lines.index('')).reverse)
  moves = get_move_list(lines.slice(lines.index('') + 1, lines.length))
  [crates, moves]
end

def read_from_lines(index, lines)
  # TODO: fix bug where an empty space will be added to an output
  # line_index is to find where a value for a specific crate is in a
  # line, based on how the input file is written
  line_index = (4 * index) + 1
  output = []
  lines.each do |line|
    value = line[line_index]
    output.push(value) unless value.nil? || value.empty?
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
    moves.push(line.delete('movefrt').strip.split(' ').map(&:to_i))
  end

  moves
end

crates, moves = read_input('inputs/05_sample.txt')

puts '--- Day 5: Supply Stacks ---'
p crates, moves
