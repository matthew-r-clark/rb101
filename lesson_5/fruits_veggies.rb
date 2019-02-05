hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# colors of fruits, capitalized
# sizes of vegetables, uppercase

arr = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map { |word| word.capitalize }
  else
    value[:size].upcase
  end
end

p arr
