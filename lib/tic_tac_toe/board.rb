module TicTacToe
  class Board
  	attr_reader :grid

    def initialize
      @grid = default_grid
    end


    def print_board
      grid.each do |x|
        print '   '
        for i in 0..2
          if x[i].value.empty? && i < 2
            print '| |'
          elsif x[i].value.empty? && i == 2
            puts '| |'
          elsif !x[i].value.empty? && i < 2
            print "|#{x[i].value}|"
          elsif !x[i].value.empty? && i == 2
            puts "|#{x[i].value}|"
          end
        end
      end
    end

  	def get_cell(x, y)
  	  grid[y][x]
  	end

  	def set_cell(x, y, value)
      if get_cell(x, y).value == ''
  	    get_cell(x, y).value = value
      else
        false
      end
  	end

  	def game_over
  	  return :winner if winner?
  	  return :draw if draw?
  	  false
  	end

  	def draw?
  		grid.flatten.map { |cell| cell.value }.none_empty?
  	end

  	def winner?
  	  winning_positions.each do |winning_position|
  	    next if winning_position_values(winning_position).all_empty?
  	    return true if winning_position_values(winning_position).all_same?
  	  end
  	  false
  	end

  	def winning_position_values(winning_position)
  	  winning_position.map { |cell| cell.value }
  	end

  	private

	  def winning_positions
      #"+" are adding all arrays together in final output
  		grid + # rows
  		grid.transpose + # columns
  		diagonals # two diagonals
  	end

  	def diagonals
  		[
  		  [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
  		  [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)]
  		]
  	end

  	def default_grid
  	  Array.new(3) { Array.new(3) { Cell.new }}
  	end

  end
end