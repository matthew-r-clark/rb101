arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

def dynamic_sorter(arr)
  arr.map do |sub_arr|
    sub_arr.sort do |a,b|
      b <=> a
    end
  end
end


p dynamic_sorter(arr)
