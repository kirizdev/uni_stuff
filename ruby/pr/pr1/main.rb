def determine_game_result(player_choice, opponent_choice)
  if player_choice == opponent_choice
    "The game is a tie! 🤝"
  elsif (player_choice == "rock" && opponent_choice == "scissors") ||
        (player_choice == "paper" && opponent_choice == "rock") ||
        (player_choice == "scissors" && opponent_choice == "paper")
    "Congratulations! You win the game! 🏆"
  else
    "Unfortunately, you lose the game. 😞"
  end
end

def valid_choices?(player_choice, opponent_choice)
  valid_choices = ["rock", "paper", "scissors"]
  valid_choices.include?(player_choice) && valid_choices.include?(opponent_choice)
end

if ARGV.length != 2
  puts "Usage: ruby game.rb [your_choice] [opponent_choice]"
else
  player_choice = ARGV[0].downcase
  opponent_choice = ARGV[1].downcase
  
  puts "You: #{player_choice}"
  puts "Opponent: #{opponent_choice}"

  if valid_choices?(player_choice, opponent_choice)
    result = determine_game_result(player_choice, opponent_choice)
    puts result
  else
    puts "Invalid choice!"
  end
end

