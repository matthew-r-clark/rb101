produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(h)
  keys = h.keys
  fruit_hash = {}
  counter = 0

  loop do
    break if counter == keys.size

    current_key = keys[counter]
    current_value = h[current_key]

    if current_value == 'Fruit'
      fruit_hash[current_key] = current_value
    end

    counter += 1
  end

  fruit_hash
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
