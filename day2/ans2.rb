#! /usr/bin/env ruby

OP_ADD = 1
OP_MULTI = 2
OP_HALT = 99

def run(program, n, v)
  pos = 0
  program[1] = n
  program[2] = v
  while 1
    case program[pos]
    when OP_HALT
      return program[0]
    when OP_ADD
      i, j, o = program[pos+1], program[pos+2], program[pos+3]
      program[o] = program[i] + program[j]
      pos = pos + 4
    when OP_MULTI
      i, j, o = program[pos+1], program[pos+2], program[pos+3]
      program[o] = program[i] * program[j]
      pos = pos + 4
    else
      STDERR.puts "UNKWOWN OPERATION"
      exit -1
    end
  end
end

while l = gets
  program = l.strip.split(",").map(&:to_i)
end

target = 19690720

(0..99).each do |n|
  (0..99).each do |v|
    result = run(program.dup, n, v)
    if result == target
      puts 100 * n + v
      exit
    end
  end
end
STDERR.puts "NOT FOUND"
