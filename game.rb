class Game
  def initialize
    @code = CodeGenerator.new.code
    @round = 1
    @guess = nil
    puts "The computer has set the 'master code' and now it's time for you to break the code.\n\n"
  end

  def game_over?
    if @guess == @code.join("").to_i
      puts <<-HEREDOC

      \rYou broke the code! Congratulations, you win!
      \rThe code was:

      \r#{@code[0]}       #{@code[1]}       #{@code[2]}       #{@code[3]}

      HEREDOC
      return true
    elsif @round == 13
      puts <<-HEREDOC
      
      \rGame over. That was a hard code to break! ¯\\_(ツ)_/¯
      \rHere is the 'master code' that you were trying to break:
      
      \r#{@code[0]}       #{@code[1]}       #{@code[2]}       #{@code[3]}

      HEREDOC
      return true
    end
  end

  def player_turn
    puts "Turn ##{@round}: Type in four numbers (1-6) to guess the code."
    @guess = gets.chomp.to_i
    until @guess.digits.length == 4 && @guess.digits.map(&:to_i).all? { |num| num.between?(1,6)}
      puts "Sorry, your code must be a combination of 4 digits from 1-6. Please, try again."
      @guess = gets.chomp.to_i
    end
    display_code(@guess)
    @round += 1
  end

  def display_code(int)
    int = int.to_s.split("")
    puts "#{int[0]}\t#{int[1]}\t#{int[2]}\t#{int[3]}\tClues: #{clues}"
  end

  def clues 
    clue = ''
    guess_array = @guess.digits.reverse
    
    @code.each_with_index do |e, i|
      if guess_array[i] == e
        clue += '● '
      elsif guess_array.include?(@code[i])
        clue += '○ '
      end
    end
    clue.split("").sort.reverse.join(" ")
  end
  
  def play_game
    until game_over? == true
      player_turn
    end
  end
end