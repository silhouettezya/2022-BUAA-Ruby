def count_ones(n)
  result = 0
  while n != 0
    result += n & 1
    n = n >> 1
  end
  return result
end
