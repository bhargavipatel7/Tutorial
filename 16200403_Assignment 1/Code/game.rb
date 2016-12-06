class Game

  attr_accessor :num_attempts, :total_num_attempts, :total_num_failures

  def initialization
    @total_num_attempts = 0
    @total_num_failures = 0
    @num_attempts = 0
    $num_of_runs = 0
  end

  def reset
    @num_attempts = 0
  end

  #Algorithm for Template method
  def play_template(num,oracle,max_num_attempts)
    init_stats
    guess_num
    check_guessed_num(num,oracle,max_num_attempts)
    return evaluate_num(num,oracle,max_num_attempts)
  end

  def init_stats
    @lower = 1
    @upper = $num_of_runs = 15
  end

  def guess_num
  end

  def check_guessed_num(num,oracle,max_num_attempts)
    if oracle.is_this_the_number?(num)!=:correct && ( @num_attempts <= max_num_attempts)
      return true
    else
      return false
    end

  end

  def evaluate_num(num,oracle,max_num_attempts)
  end

end
