class ComputerGame
  def initialize 
    puts "Please enter a 4-digit 'master code' for the computer to break."
    answer = gets.chomp.to_s
    until answer.length == 4 && answer.to_i > 0
      puts "Sorry, you must enter a 4 digit number to continue. Please try again."
      answer = gets.chomp.to_s
    end
    @round = 1
    @master_code = answer
    @computer_guess = nil
  end

  def computer_turn
    @computer_guess = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    display_code(@computer_guess)
    @round += 1
  end 

  def display_code(arr)
    puts "#{arr[0]}\t#{arr[1]}\t#{arr[2]}\t#{arr[3]}\tClues: #{clues}"
  end

  def clues 
    clue = ''
    master_array = @master_code.split("").map(&:to_i)
    master_array.each_with_index do |e, i|
      if @computer_guess[i] == e
        clue += '● '
      elsif @computer_guess.include?(master_array[i])
        clue += '○ '
      end
    end
    clue.split("").sort.reverse.join(" ")
  end

  def game_over?
    if @computer_guess == @master_code.split('').map(&:to_i)
      puts "The computer broke your code. You lose :("
      return true
    elsif @round == 13
      puts "The computer was unable to break your code. You win!"
      return true
    end
  end

  def play_game
    until game_over? == true
      computer_turn
    end
  end
end