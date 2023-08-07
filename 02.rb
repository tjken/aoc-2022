# frozen_string_literal: true

$scores = {
  A: 1,
  B: 2,
  C: 3,
  X: 1,
  Y: 2,
  Z: 3
}

$results = {
  LOSS: 0,
  DRAW: 3,
  WIN: 6
}
def score(game)
  $scores.fetch(game[1].to_sym) +
    case ($scores.fetch(game[1].to_sym) - $scores.fetch(game[0].to_sym)) % 3
    when 1
      $results.fetch(:WIN)
    when 0
      $results.fetch(:DRAW)
    when 2
      $results.fetch(:LOSS)
    end
end

def day_02(input_file)
  File.readlines(input_file, chomp:true)
      .map { |line| line.split(/ /)  }
      .map { |game| score(game) }
end

puts day_02('inputs/02.txt').sum