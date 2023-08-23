# frozen_string_literal: true

def run(file, offset)
  File.readlines(file, chomp: true)
      .map { |line| find_packet_start_index(line, offset) }
end

def find_packet_start_index(string, offset)
  string.chars.each_with_index do |_, index|
    next if index < offset - 1

    return index + 1 unless string[index - (offset - 1), offset].chars.uniq.length < offset
  end
end

puts '--- Day 6: Tuning Trouble ---'
file = 'inputs/06.txt'
puts run(file, 4)
puts run(file, 14)
