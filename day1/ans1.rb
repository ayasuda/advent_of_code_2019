#! /usr/bin/env ruby

a = 0
while l = gets
  f = l.to_i / 3 - 2
  p f
  a += f
end
p a
