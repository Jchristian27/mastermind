class ComputerGame
  def initialize 
    puts "Please enter a 4-digit 'master code' for the computer to break."
    answer = gets.chomp
    until answer.length == 4 && answer.to_i > 0
      puts "Sorry, you must enter a 4 digit number to continue. Please try again."
      answer = gets.chomp
    end
    @round = 1
    @master_code = answer
  end
end