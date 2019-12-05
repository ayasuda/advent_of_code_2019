#! /usr/bin/env ruby

def cordinates(directions)
  cordinates = []
  current = [0, 0]
  directions.each do |d|
    direction, magnitude = d[0], d[1,d.length()-1].to_i
    case direction
    when "U"
      magnitude.times do
        current[1] += 1
        cordinates << current.dup
      end
    when "R"
      magnitude.times do
        current[0] += 1
        cordinates << current.dup
      end
    when "D"
      magnitude.times do
        current[1] -= 1
        cordinates << current.dup
      end
    when "L"
      magnitude.times do
        current[0] -= 1
        cordinates << current.dup
      end
    else
      STDERR.puts = "UNKNOWN DIRECTION :" + d
    end
  end
  cordinates
end

paths = []

while l = gets
  directions = l.strip.split(",")
  paths << cordinates(directions)
end

crosses = paths[0] & paths[1]

steps = crosses.map{|c| paths[0].index(c) + paths[1].index(c) + 2 }

p steps.min
