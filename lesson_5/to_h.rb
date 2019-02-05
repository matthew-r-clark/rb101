arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

def to_hash(arr)
  hsh = {}
  arr.each do |sub_arr|
    hsh[sub_arr[0]] = sub_arr[1]
  end
  hsh
end

p to_hash(arr)
