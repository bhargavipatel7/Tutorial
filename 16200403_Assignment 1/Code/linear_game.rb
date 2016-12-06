require_relative 'game.rb'
class LinearGame < Game
  def initialize
    @num_attempts = 0
    @total_num_attempts = 0
    @total_num_failures = 0
  end

  def guess_num
  end

  def evaluate_num(num,oracle,max_num_attempts)
 #   puts "Linear Game | Values in Linear Game #{num} and #{oracle} and #{max_num_attempts}"
    @num_attempts+=1
    num=@lower
    while !(check_guessed_num(num,oracle,max_num_attempts)) do
 #     puts "Linear Game | #{__method__}:I guessed #{num}"
      num+=1
      @num_attempts+=1
 #     puts"Linear Game | num_attempts: #{@num_attempts}"
    end
    if (@num_attempts <= max_num_attempts)
 #     puts "Linear Game | #{__method__}: Yippee, I guessed #{num} and won!"

      return :success
    else
      return :fail
    end

  end


end