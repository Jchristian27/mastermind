puts <<-HEREDOC 

How to play Mastermind:

This is a 1-player game against the computer.
You can choose to be the code maker or the code breaker.

There are six different number/color combinations:

  1     2     3     4     5     6   


The code maker will choose four to create a 'master code'. For example,

  1     3     4     1   

As you can see, there can be more then one of the same number/color.
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

# Would you like to be the code MAKER or code BREAKER?

# Press '1' to be the code MAKER
# Press '2' to be the code BREAKER


def code_generator
  code = []
  4.times do 
    code.push(rand(1..6))
  end
end

code_generator