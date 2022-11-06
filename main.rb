require_relative 'code_generator.rb'
require_relative 'game.rb'

puts <<-HEREDOC 

How to play Mastermind:

This is a 1-player game against the computer.
You can choose to be the code maker or the code breaker.

There are six different numbers that can be used:

  1     2     3     4     5     6   


The code maker will choose four to create a 'master code'. For example,

  1     3     4     1   

As you can see, there can be more then one of the same number.
In order to win, the code breaker needs to guess the 'master code' in 12 or less turns.


Clues:
After each guess, there will be up to four clues to help crack the code.

 ● This clue means you have 1 correct number in the correct location.

 ○ This clue means you have 1 correct number, but in the wrong location.


Clue Example:
To continue the example, using the above 'master code' a guess of "1463" would produce 3 clues:

  1     4     6     3     Clues: ● ○ ○ 


The guess had 1 correct number in the correct location and 2 correct numbers in a wrong location.

It's time to play!

HEREDOC

puts 'Would you like to be the code MAKER or code BREAKER?'

puts "Press '1' to be the code MAKER"
puts "Press '2' to be the code BREAKER"
answer = gets.chomp.to_i
until answer == 1 || answer == 2
  puts "Sorry, you must enter either '1' or '2'. Please try again."
  answer = gets.chomp.to_i
end

Game.new.play_game