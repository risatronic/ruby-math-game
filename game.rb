class Game
  attr_reader :current_player

  def initialize
    @current_player = nil
  end

  def play
    player1 = Player.new("Player 1")
    player2 = Player.new("Player 2")

    @current_player = player1
    game_over = false
    round = 1

    puts "Welcome to ~Ruby Math Game~!"

    while(!game_over)
      question = Question.new
      puts "---ROUND #{round}---"
      puts "#{@current_player.name}: #{question.ask_question}"
      answer = gets.chomp.to_i

      if question.correct_answer?(answer)
        puts "Yup, good job!"
      else
        puts "Nope, sorry :("
        @current_player.lose_life
      end

      puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

      if(@current_player.lives == 0)
        puts "Oh no, you lost!"
        game_over = true
      elsif(@current_player == player1)
        @current_player = player2
      else 
        @current_player = player1
      end
      if(!game_over)
        round += 1
      end
    end

    if player1.lives == 0
      puts "Player 2 wins in #{round} rounds with #{player2.lives}/3 lives remaining"
    elsif player2.lives == 0
      puts "Player 1 wins in #{round} rounds with #{player1.lives}/3 lives remaining"
    end
  end
end