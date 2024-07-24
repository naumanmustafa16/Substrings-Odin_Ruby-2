def substrings(*sentence, dictionary)
  # first of all make the down case of both the dictionary and the sentence and convert the strings in the sentence to single characters to make the combinations.

  dictionary = dictionary.map { |value| value.downcase }
  sentence = sentence.map do |value|
               value.downcase
             end.map { |value| value.split(' ') }.flatten.reduce([]) { |result, item| result.push(item.split('')) }
  # Here we will make a array of all possible combinations
  result = []
  for value in sentence
    i = 1

    while i <= value.length
      result.push(value.combination(i).to_a)
      i += 1
    end
  end
  # Then this all Combinations are converted into the strings and pushed into an all_combination array
  all_combination_array = result.flatten(1).reduce([]) do |result, value|
    result.push(
      value.join
    )
  end
  # Here a hashed is formed while counting the number of occurrences

  substrings_hash = all_combination_array.each_with_object(Hash.new(0)) do |value, result|
    result[value] += 1 if dictionary.include?(value)
  end
  p substrings_hash
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

substrings('howdy you should go below the horn and sit there for most part of the day.', dictionary)

