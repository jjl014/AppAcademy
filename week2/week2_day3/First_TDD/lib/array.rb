def my_uniq(arr)
  new_arr = []
  arr.each do |el|
    new_arr << el unless new_arr.include?(el)
  end
  new_arr
end

def two_sum(arr)
  pairs = []
  arr.each_index do |idx1|
    (idx1+1...arr.length).each do |idx2|
      pairs << [idx1,idx2] if (arr[idx1] + arr[idx2]) == 0
    end
  end
  pairs
end

def my_transpose(arr)
  transposed_arr = Array.new(arr.length) {Array.new(arr.length)}
  arr.each_with_index do |row, row_idx|
    row.each_index do |col_idx|
      transposed_arr[row_idx][col_idx] = arr[col_idx][row_idx]
    end
  end
  transposed_arr
end

def pick_stocks(prices)
  best_dates = nil
  best_profit = 0

  prices.each_index do |buy_date|
    prices.each_index do |sell_date|
      next if sell_date < buy_date
      profit = prices[sell_date] - prices[buy_date]
      if profit > best_profit
        best_dates = [buy_date,sell_date]
        best_profit = profit
      end
    end
  end
  best_dates
end
