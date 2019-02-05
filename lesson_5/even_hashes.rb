arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

def even_hashes(arr)
  arr.select do |hsh|
    hsh.values.flatten.all? { |val| val.even? }
  end
end

p even_hashes(arr)
