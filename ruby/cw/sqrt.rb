def is_prime?(n)
  return false if n <= 1
  return true if n <= 3

  sqrt_n = Math.sqrt(n).to_i
  (2...sqrt_n).each do |i|
    return false if n % i == 0
  end

  return true
end


print "Введіть число: "
num = gets.chomp.to_i

if is_prime?(num)
  puts "#{num} - просте число"
else
  puts "#{num} - не просте число"
end
