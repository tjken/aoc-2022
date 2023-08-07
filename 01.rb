# frozen_string_literal: true

def day_01(input_file)
  numbers = [0]
  File.foreach(input_file) do |line|
    case line
    when "\n"
      numbers.append(0)
    else
      numbers[-1] = numbers.last + line.to_i
    end

  end

  elves = numbers.map.with_index.to_a
           .sort_by { | v, _ | -v }

  elves[0, 3]
end

elves = day_01('inputs/01.txt')
puts elves[0]
puts elves.reduce(0) { |sum, elf| sum + elf[0] }