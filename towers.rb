class TowerOfHanoi
  
  def initialize(number_of_pieces) 
    # Sets up number of game pieces in the correct positions in array
    @number_of_pieces = number_of_pieces
    @position_of_pieces = [[], [], []]
    @position_of_pieces[0] = (1..@number_of_pieces).to_a

    @keep_playing = true
  end

  def play
    #Initializes play.
    self.instructions
    self.render
    self.game_loop
    
  end

  def instructions
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to in the format [1,3]. Enter 'q' to quit"
  end

  def render
    # Renders current board.
    puts "Current Board:"
    puts "o"
    puts "oo"
    puts "ooo"
    puts "1     2     3"
    p @position_of_pieces
  end

  def exit_game
    puts "Thanks for playing!"
    @keep_playing = false
  end

  def get_input
    puts "Enter move >"
    player_input = gets.chomp
    exit_game if player_input == "q"
    player_input
  end

  def game_loop
    while @keep_playing do
      #take_input and adjusts board
      change_board(get_input)

      puts "in game_loop"
      # render board

      #check for win
    end
  end

end

t = TowerOfHanoi.new(6)
t.play