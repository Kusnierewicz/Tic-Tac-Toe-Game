module TicTacToe
  class Game
  	attr_reader :players, :board, :current_player, :other_player

  	def initialize(players, board = Board.new)
  	  @players = players
  	  @board = board
  	  @current_player, @other_player = players.shuffle
  	end

  	def switch_players
  	  @current_player, @other_player = @other_player, @current_player
  	end

  	def solicit_move
  	  "#{current_player.name}: Enter a number between 1 and 9 to make your move"
  	end

  	def game_over_message(result)
      return ">>> #{current_player.name} has won the game!!!".upcase if result == :winner
      return '>>> The game ended in a draw!!!'.upcase if result == :draw
  	end

  	def get_move(human_move = gets.chomp)
  	  human_move_to_coordinate(human_move)
  	end

  	def human_move_to_coordinate(human_move)
  	  mapping = {
  	  	'1' => [0, 0],
  	  	'2' => [1, 0],
  	  	'3' => [2, 0],
  	  	'4' => [0, 1],
  	  	'5' => [1, 1],
  	  	'6' => [2, 1],
  	  	'7' => [0, 2],
  	  	'8' => [1, 2],
  	  	'9' => [2, 2],
  	  }
  	  mapping[human_move]
  	end

  	def play
  	  puts "#{current_player.name} has been randomly selected as the first player!"
      #board.winning_positions.each { |pos| puts pos.inspect}
  	  while true
        puts ''
  	  	board.print_board
  	  	puts ''
  	  	puts solicit_move
  	  	x, y = get_move
  	  	until board.set_cell(x, y, current_player.color)
          puts 'This seat is taken!! Try again!'
          x, y = get_move
        end
  	  	if board.game_over
  	  	  puts game_over_message(board.game_over)
  	  	  board.print_board
  	  	  return
  	  	else
  	  	  switch_players
  	  	end
  	  end
  	end

  end
end