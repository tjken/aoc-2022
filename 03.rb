# frozen_string_literal: true

module Day03

  def self.priorities(items)
    items.swapcase.bytes # Lowercase letters need lower priority values,
                         # but the bytes have higher values than uppercase ones
      .map { |item| Day03.adjust_byte_value(item) }
  end

  module Part1
    def self.run(input_file)
      rucksacks =
        File.readlines(input_file, chomp:true)
            .map { |sack| Day03.priorities(sack) }
            .map { |sack| Day03.split_array(sack) }

      priority_items = []
      rucksacks.each { |sack| priority_items.append(sack[0] & sack[1])}

      puts priority_items.flatten.sum
    end
  end

  module Part2
    def run

    end
  end

  private

  def self.adjust_byte_value(item)
    return item - 70 if item > 95
    item - 64
  end

  def self.split_array(array)
    length = array.length
    return array[0, length / 2], array[length / 2, length / 2]
  end

end

puts "--- Day 3: Rucksack Reorganization ---"
puts Day03::Part1.run("inputs/03.txt")