class Factorial
  def self.calculate(n)
    if n < 0
      raise ArgumentError, "Факторіал не визначений для від'ємних чисел"
    elsif n == 0
      return 1
    else
      return (1..n).reduce(:*)       # голанг таких приколів ще не бачив...
    end
  end
end

def main
  puts "Введіть число: "
  user_input = gets.chomp.to_i

  begin
    result = Factorial.calculate(user_input)
    puts "Факторіал числа #{number} дорівнює #{result} :)"
  rescue ArgumentError => e
    puts "Помилка: #{e.message}"
  rescue
    puts "Введіть ціле число :)"
  end
end

main
