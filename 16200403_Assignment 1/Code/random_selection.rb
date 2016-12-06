
class RandomSelection < Game
  def initialize
    @num_attempts = 0

    @total_num_attempts = 0
    @total_num_failures = 0
  end

  def guess_num
    num = Kernel.rand(@lower..@upper)
    @num_attempts+=1
    return num
  end

  def evaluate_num(num,oracle,max_num_attempts)
    @num_attempts+=1
    num=@lower

    while !(check_guessed_num(num,oracle,max_num_attempts)) do
      num = guess_num
    end
    if (@num_attempts <= max_num_attempts)
      # puts "#{__method__}: Yippee, I guessed #{num} and won!"
      :success
    else
      :fail
    end
  end


end