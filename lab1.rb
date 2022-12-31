def mfp(n)
  all_pm = 0
  (1..n).each { |i|
    x = i
    pm = 1
    while x > 0
      pm *= (x % 10) unless (x % 10) == 0
      x /= 10
    end
    all_pm += pm
  }
  result = 1
  2.upto(n**0.5) do |i|
    while all_pm % i == 0 do
      result = i
      all_pm /= i
    end
    break if all_pm == 1
  end
  result = all_pm unless all_pm == 1
  return result
end
