def to_rpn(exp)
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }
  output, operators = [], []

  exp.split.each do |token|
    if token.match?(/\A\d+\z/)
      output << token
    elsif %w[+ - * /].include?(token)
      process_operator(token, output, operators, precedence)
    elsif token == '('
      operators << token
    elsif token == ')'
      process_close_parenthesis(output, operators)
    end
  end

  output.concat(operators.reverse).join(' ')
end

def process_operator(token, output, operators, precedence)
  while operators.any? && precedence[operators.last] >= precedence[token]
    output << operators.pop
  end
  operators << token
end

def process_close_parenthesis(output, operators)
  output << operators.pop while operators.any? && operators.last != '('
  operators.pop if operators.any? && operators.last == '('
end

exp = "2 + 1 * 4"
rpn_exp = to_rpn(exp)

puts "#{exp}\t-->\t#{rpn_exp}"

