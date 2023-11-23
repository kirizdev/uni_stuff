def word_count(input_string)
  word_hash = Hash.new(0)
  words = input_string.split(/\W+/) # Розбиваємо рядок на слова, ігноруючи неалфавітні символи

  words.each do |word|
    word_hash[word.downcase] += 1  # Знижуємо регістр і обчислюємо кількість кожного слова
  end

  word_hash
end

# Зчитуємо введення
puts "Введіть рядок:"
user_input = gets.chomp

result = word_count(user_input)
puts result