#! /usr/bin/env ruby

OP_ADD = 1
OP_MULTI = 2
OP_HALT = 99

def run(program)
  pos = 0
  while 1
    case program[pos]
    when OP_HALT
      return program
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

program = ""

while l = gets
  program = l.strip.split(",").map(&:to_i)
end

result = run(program)
p result.join(",")
