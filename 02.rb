# frozen_string_literal: true
module Day02

  $results = {
    LOSS: 0,
    DRAW: 3,
    WIN: 6
  }

  $scores = {
    A: 1,
    B: 2,
    C: 3,
    X: 1,
    Y: 2,
    Z: 3
  }

  module Part1

    def self.score(game)
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

  end

  module Part2
    def self.score(game)
      result = ($scores.fetch(game[1].to_sym) - 1) * 3 # X -> 0, Y -> 3, Z -> 6
      result += case result
                when 0
                  ($scores.fetch(game[0].to_sym) - 1)
                when 3
                  $scores.fetch(game[0].to_sym)
                when 6
                  ($scores.fetch(game[0].to_sym) % 3) + 1
                end

      return 3 if result == 0 # Resolves a bug with inputs [A, X]
      result
    end

  end

  def self.run(input_file, additional_method)
    File.readlines(input_file, chomp:true)
        .map { |line| line.split(/ /)  }
        .map { |game| additional_method.call(game) }
  end

end

puts Day02.run('inputs/02.txt', Day02::Part1.method(:score)).sum
puts Day02.run('inputs/02.txt', Day02::Part2.method(:score)).sum