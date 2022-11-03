class Game
  def initialize
    @code = CodeGenerator.new.code
    @round = 1
    @guess = nil
  end

  def game_over?
    if @guess == @code.join("").to_i
      puts "You won!"
      return true
    elsif @round == 13
      puts "You lost :("
      return true
    end
  end

  def player_turn
    puts "Turn ##{@round}: Type in four numbers (1-6) to guess the code."
    @guess = gets.chomp.to_i
    until @guess.digits.length == 4
      puts "Sorry, your code must be 4 digits long. Please, try again."
      @guess = gets.chomp.to_i
    end
    @round += 1
  end

  def play_game
    print @code
    until game_over? == true
      player_turn
    end
  end
end