arr = ['10', '11', '9', '7', '8']

def numeric_string_sort(arr)
  arr.sort { |a,b| b.to_i <=> a.to_i }
end

p numeric_string_sort(arr)
