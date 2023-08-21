class Game
  def initialize
    @players = [Player.new('Player 1'), Player.new('Player 2')]
    @game_over = false
    @curr_player_idx = 0
    @curr_player = @players[@curr_player_idx]
  end

  def switch_player
    @curr_player_idx = (@curr_player_idx + 1) % 2
    @curr_player = @players[@curr_player_idx]
  end

  def display_scores
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
  end

  def evaluate_answer(player_answer, answer)
    if player_answer == answer
      puts "#{@curr_player.name}: YES! You are correct."
    else
      puts "#{@curr_player.name}: Seriously? No!"
      @curr_player.lose_life
    end
  end

  def game_over?
    if @curr_player.lives == 0
      @game_over = true
      switch_player
      puts "#{@curr_player.name} wins with a score of #{@curr_player.lives}/3 \n----- GAME OVER -----\nGood bye!"
      true
    else
      false
    end
  end

  def play
    until @game_over
      turn = Turn.new

      puts "#{@curr_player.name}: #{turn.question}"
      player_answer = gets.chomp.to_i
      evaluate_answer(player_answer, turn.answer)

      unless game_over?
        display_scores
        switch_player
      end
    end
  end
end