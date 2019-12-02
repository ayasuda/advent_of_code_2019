#! /usr/bin/env ruby

def calc(mass)
  fuel = mass / 3 - 2
  return 0 if fuel <= 0
  fuel + calc(fuel)
end

a = 0
while l = gets
  f = calc(l.to_i)
  p f
  a += f
end
p a
