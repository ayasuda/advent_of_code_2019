#! /usr/bin/env ruby

def get_group(na)
  ga = []
  i = 0
  while i < na.size
    c = na[i]

    g = [c]
    j = 1
    while true
      break unless c == na[i + j]
      g << na[i + j]
      j += 1
    end
    ga << g if g.size > 1
    i += j
  end
  ga
end

range = 246515..739105

res = []
range.count do |n|
  na = n.to_s.split("").map(&:to_i)
  next if na.size != 6
  next unless (na[0] <= na[1]) && (na[1] <= na[2]) && (na[2] <= na[3]) && (na[3] <= na[4]) && (na[4] <= na[5])
  next unless (na[0] == na[1]) || (na[1] == na[2]) || (na[2] == na[3]) || (na[3] == na[4]) || (na[4] == na[5])
  gs = get_group(na)
  next unless gs.any?{|g| g.size == 2}
  res << n
end

p res.size
