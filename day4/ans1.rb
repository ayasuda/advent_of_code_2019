#! /usr/bin/env ruby

range = 246515..739105

res = []
range.count do |n|
  na = n.to_s.split("").map(&:to_i)
  next if na.size != 6
  if (na[0] <= na[1]) && (na[1] <= na[2]) && (na[2] <= na[3]) && (na[3] <= na[4]) && (na[4] <= na[5])
    if (na[0] == na[1]) || (na[1] == na[2]) || (na[2] == na[3]) || (na[3] == na[4]) || (na[4] == na[5])
      res << n
    end
  end
end

p res.size
