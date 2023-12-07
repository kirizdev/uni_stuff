ROMAN_NUMERALS = {
  'I' => 1,
  'IV' => 4,
  'V' => 5,
  'IX' => 9,
  'X' => 10,
  'XL' => 40,
  'L' => 50,
  'XC' => 90,
  'C' => 100,
  'CD' => 400,
  'D' => 500,
  'CM' => 900,
  'M' => 1000
}

def convert_to_arabic(roman)
  arabic = 0

  ROMAN_NUMERALS.each do |numeral, value|
    while roman.start_with?(numeral)
      arabic += value
      roman = roman[numeral.length..-1]
    end
  end

  if !roman.empty?
    puts "Invalid Roman numeral: #{roman}"
    return
  end

  arabic
end

def convert_to_roman(arabic)
  roman = ''

  ROMAN_NUMERALS.values.sort.reverse.each do |value|
    while arabic >= value
      roman += ROMAN_NUMERALS.key(value)
      arabic -= value
    end
  end

  roman
end

print "Enter Roman or Arabic: "
user_input = gets.chomp

if user_input.match?(/^\d+$/)
  arabic_number = user_input.to_i
  puts "#{arabic_number} in Roman numerals: #{convert_to_roman(arabic_number)}"
elsif user_input.match?(/^[IVXLCDM]+$/i)
  roman_number = user_input.upcase
  puts "#{roman_number} in Arabic numerals: #{convert_to_arabic(roman_number)}"
else
  puts "Unknown number format"
end

