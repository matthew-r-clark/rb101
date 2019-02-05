arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

def sort_by_odds(arr)
  arr.sort_by do |sub_arr|
    sub_arr.select { |val| val.odd? }.reduce(:+)
  end
end

p sort_by_odds(arr)
