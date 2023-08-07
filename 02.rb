# frozen_string_literal: true

def day_02(input_file)
  games =
    File.readlines(input_file, chomp:true)
        .map { |line| line.split(/ /)  }

  games
end

p day_02('inputs/02_sample.txt')