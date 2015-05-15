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
    # puts "o"
    # puts "oo"
    # puts "ooo"
    # puts "1     2     3"
    p @position_of_pieces
  end

  def exit_game
    puts "Thanks for playing!"
    @keep_playing = false
  end

  def check_win?
    # Signals win if stack two or three is full
    if (@position_of_pieces[1].length == @number_of_pieces) || (@position_of_pieces[2].length == @number_of_pieces)
      puts "You won!"
      @keep_playing = false
    end
  end

  # Validates input. Returns two digits between 1-3 if input is valid or "false" if input is invalid.
  def validate_input
    puts "Enter move >"
    player_input = gets.chomp
    exit_game if player_input == "q"
    
    #Check for valid input
    player_input = player_input.gsub(/[^1-3]/, '') #Strip all but digits 1-3
    # puts player_input # testing

    player_input = player_input.split("")

    if player_input.length != 2 # Looking for only two digit answers
      puts "Please enter in the format '[1,3]'"
      return false #Signals invalid input
    elsif player_input[0] == player_input[1]
        puts "You can't move a piece to the same spot."
    else
      return player_input
    end

  end

  def change_board (moves)
    #Only change board if input is valid (true)
    if moves
      p moves

      piece_moved = @position_of_pieces[moves[0].to_i - 1][0].to_i # Gets piece to be moved
      piece_to_set_on = @position_of_pieces[moves[1].to_i - 1][0].to_i # Gets piece to sit it on.

      if (piece_to_set_on > piece_moved) || (piece_to_set_on == 0) # Avoids setting bigger pieces on smaller ones.
        piece_value = @position_of_pieces[moves[0].to_i - 1].shift # Remove piece from stack
        @position_of_pieces[moves[1].to_i - 1].unshift(piece_value) # Put it on second stack.
      else
        puts "You can't set a bigger piece on a smaller one."
      end
      p piece_moved

    end
  end

  def game_loop
    while @keep_playing do
      #take_input and adjusts board
      change_board(validate_input)

      # puts "in game_loop" #testing
      # render board
      render
      #check for win
      check_win?
    end
  end

end

t = TowerOfHanoi.new(3)
t.play