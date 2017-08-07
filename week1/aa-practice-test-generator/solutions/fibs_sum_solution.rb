def fibs_sum(n)
  return 0 if n == 0
  return 1 if n == 1

  fibs_sum(n-1) + fibs_sum(n-2) + 1
end

# fibs_sum(3)
# fibs_sum(2) + fibs_sum(1) + 1
# fibs_sum(1) + fibs_sum(0) + 1, 1
# 2, 1
# 4
