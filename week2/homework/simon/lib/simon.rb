class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system('clear')
    until @game_over
      take_turn
      system('clear')
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
      sleep 1
    end
  end

  def show_sequence
    if sequence_length == 1
      prepare
    end
    system('clear')
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.7
      system('clear')
      sleep 0.3
    end
  end

  def prepare
    puts "Ready?"
    sleep 1
    system('clear')
    puts "Here we go!"
    sleep 1.5
  end

  def require_sequence
    puts "Enter the colors in the order you were given. (r, y, g, b)"
    @seq.each_with_index do |color, idx|
      puts "What was color number #{idx + 1}?"
      user_input = gets.chomp
      unless user_input == color[0]
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    system('clear')
    puts "You win this round! Here comes the next one:"
  end

  def game_over_message
    puts "Game Over."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
