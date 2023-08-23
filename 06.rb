# frozen_string_literal: true

def run(file)
  File.readlines(file, chomp: true)
      .map { |line| find_packet_start_index(line) }
end

def find_packet_start_index(string)
  string.chars.each_with_index do |letter, index|
    next if index < 3

    return index + 1 unless string[index - 3, 4].chars.uniq.length < 4
  end
end

puts '--- Day 6: Tuning Trouble ---'
puts run('inputs/06.txt')
