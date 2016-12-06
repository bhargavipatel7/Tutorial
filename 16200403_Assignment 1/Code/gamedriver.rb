class GameDriver

  attr_reader :NUM_OF_RUNS , :oracle
  def initialize(num_of_runs,oracle)
     @NUM_OF_RUNS = num_of_runs
     @max_num_attempts = num_of_runs * 5
     @oracle = oracle
     @total_num_failures = 0
     @total_num_attempts = 0
   end

  def select_play
    linear = LinearGame.new
    random = RandomSelection.new
    smart_random = Play_smart_random.new
    binary = BinarySearch.new
    @game_obj = [linear,random,smart_random,binary]
    return    @game_obj.sample
  end

  def play_template
    selected_method = select_play
    1.upto(@NUM_OF_RUNS) do |i|
      @oracle.secret_number = i

      selected_method.reset
      if (selected_method.play_template(@NUM_OF_RUNS,@oracle,@max_num_attempts) == :success)
        # puts "play randomly found #{i} in #{homer.num_attempts} attempts"
        @total_num_attempts += selected_method.num_attempts
      else
        # puts "play randomly failed to find #{i} after #{homer.num_attempts} attempts"
        @total_num_failures += 1
      end
    end
    puts " #{selected_method} play took on average #{@total_num_attempts/(@NUM_OF_RUNS-@total_num_failures)} attempts to succeed"

  end
  end
