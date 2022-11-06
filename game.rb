class Game
  def initialize
    @code = CodeGenerator.new.code
    @round = 1
    @guess = nil
  end

  def game_over?
    if @guess == @code.join("").to_i
      puts <<-HEREDOC

      You broke the code! Congratulations, you win!
      The code was:

      #{@code[0]}       #{@code[1]}       #{@code[2]}       #{@code[3]}

      HEREDOC
      return true
    elsif @round == 13
      puts <<-HEREDOC
      
      Game over. That was a hard code to break! ¯\\_(ツ)_/¯
      Here is the 'master code' that you were trying to break:
      
      #{@code[0]}       #{@code[1]}       #{@code[2]}       #{@code[3]}

      HEREDOC
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
    display_code(@guess)
    @round += 1
  end

  def display_code(int)
    int = int.to_s.split("")
    puts "#{int[0]}\t#{int[1]}\t#{int[2]}\t#{int[3]}\tClues: #{clues}"
  end

  def clues 
    clue = ''
    # clue_array = []
    guess_array = @guess.digits.reverse
    # code_array = @code.clone
    # code = [6, 5, 2, 2]
    # code_array = [6, 5, 2, 2]
    # guess = [2, 2, 2, 1]
    @code.each_with_index do |e, i|
      if guess_array[i] == e
        clue += '● '
        # clue_array.push('● ')
        # code_array.delete(guess_array[i])
      elsif guess_array.include?(@code[i])
        clue += '○ '
        # clue_array.push('○ ')
        # code_array.delete(guess_array[i])
      end
    end
    # @code.each_with_index do |e, i|
    #   if guess_array[i] != e && @code.include?(guess_array[i]) && code_array.include?(guess_array[i])
    #     clue += '○ '
    #     code_array.delete(guess_array[i])
    #   end
    # end
    # clue_array.sort.reverse.to_s
    clue.split("").sort.reverse.join(" ")
  end

  def play_game
    until game_over? == true
      player_turn
    end
  end
end