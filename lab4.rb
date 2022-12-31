def decode_ways(code)
  str = "#{code}"
  dp = Array.new(5002)
  dp[0] = 1
  dp[1] = str[0] != '0' ? 1 : 0
  (2..str.length).each { |i|
    a = str[i - 1] != '0' ? 1 : 0
    b = 0
    b = 1 if str[i - 2] === '1' or (str[i - 2] === '2' and str[i - 1] <= '6' and str[i - 1] >= '0')
    dp[i] = a * dp[i - 1] + b * dp[i - 2]
  }
  return dp[str.length]
end
