class CodeGenerator
  attr_reader :code
  def initialize
    @code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  end

  def code 
    @code
  end
end