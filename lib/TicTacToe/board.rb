module TicTacToe
	class Board
		attr_accessor :grid
		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		def game_over
			return :winner if winner?
			return :draw if draw?
			false
		end

		private

		def default_grid
			Array.new(3) {Array.new(3) {Cell.new}}
		end

		def winner?
			winning_positions.each do |winning_position|
				next if all_empty?(winning_position_values(winning_position))
				return true if all_same?(winning_position_values(winning_position))
			end
			false
		end

		def winning_position_values(winning_position)
			winning_position.map {|cell| cell.value}
		end

		def winning_positions
			grid + grid.transpose + diagonals
		end

		def draw?
			none_empty?(grid)
		end

		def diagonals
			[
				[grid[0][0], grid[1][1], grid[2][2]],
				[grid[2][0], grid[1][1], grid[0][2]]
			]
		end

		def all_empty?(input)
			input.all? { |element| element.to_s.empty?}
		end

		def all_same?(input)
			input.all? {|element| element == input[0]}
		end

		def any_empty?(input)
			input.each do |element|
				return true if element.any? { |ele| ele.to_s.empty? }
			end
		end

		def none_empty?(input)
			!any_empty?(input)
		end

	end
end
