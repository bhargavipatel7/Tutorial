class BinarySearch < Game
  def initialize
    @num_attempts = 0
    @total_num_attempts = 0
    @total_num_failures = 0
  end

  def guess_num
    num = (@lower+@upper)/2
    @num_attempts+=1
    return num
  end


  def evaluate_num(num,oracle,max_num_attempts)
    guess_num
    while ((result = oracle.is_this_the_number?(num)) != :correct) && (@num_attempts <= max_num_attempts) do
      if result == :less_than
        @upper = num-1
      elsif result == :greater_than
        @lower = num+1
      end
      guess_num
    end
    if (@num_attempts <= max_num_attempts)
      # puts "#{__method__}: Yippee, I guessed #{num} and won!"
      :success
    else
      :fail
    end

  end
end