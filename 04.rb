# frozen_string_literal: true

def read_assignment_pairs(input_file)
  File.read(input_file).split(/[\n,]/) # More useful to use a String here vs an Array
      .map { |pair| pair.split(/-/).map(&:to_i) }
      .each_slice(2).to_a
end


ranges = read_assignment_pairs("inputs/04.txt")
shared_ranges = []
ranges.each do |pair|
  first = Range.new(pair.first[0], pair.first[1]).to_a
  last = Range.new(pair.last[0], pair.last[1]).to_a
  shared_range = first & last

  if shared_range == first or shared_range == last
    shared_ranges.append(true)
  else
    shared_ranges.append(false)
  end
end

puts shared_ranges.count(true)