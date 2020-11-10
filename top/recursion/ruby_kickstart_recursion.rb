# frozen_string_literal: true

def append(ary, n)
  return ary.push(n) if n.zero?

  ary.push(n)
  append(ary, n - 1)
end

p append([], 2)
p append([], 3)

def reverse_append(ary, n)
  return ary if n < 0
  return ary.unshift(n) if n.zero?

  ary.unshift(n)
  reverse_append(ary, n - 1)
end

p reverse_append([], -1)
p reverse_append([], 0)
p reverse_append([], 1)
p reverse_append([], 2)
