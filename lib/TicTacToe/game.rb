module TicTacToe
	class Game
		attr_accessor :players, :board, :current_player, :second_player, :move_list, :mapping
		def initialize(players, board = Board.new)
			@players = players
			@board = board
			@current_player, @second_player = players.shuffle
			@move_list = Array.new
			@mapping = { 
				"1" => [0, 0], "2" => [1, 0], "3" => [2, 0],
				"4" => [0, 1], "5" => [1, 1], "6" => [2, 1],
				"7" => [0, 2], "8" => [1, 2], "9" => [2, 2] }
		end

		def switch_players
			@current_player, @second_player = @second_player, @current_player
		end

		def ask_for_move
			puts "#{current_player.name}: Enter a number from 1 to 9 to make your move"
		end

		def get_move(move = gets.chomp)
			move_to_coordinate(move)
		end

		def message
			puts "#{current_player.name} won!" if board.game_over == :winner
			puts "It's a draw!" if board.game_over == :draw
		end

		def play
			puts "#{current_player.name} is the first player"
			while true
				formatted_grid
				puts ""
				ask_for_move
				row,column = get_move
				board.set_cell(row,column,current_player.token)
				if board.game_over
					message
					formatted_grid
					return
				else
					switch_players
				end
			end
		end

		private

		def formatted_grid
			return board.grid.each do |row|
				puts row.map {|cell| cell.value.empty? ? "_" : cell.value}.join(" ")
			end
		end

		def move_to_coordinate(move)
			if !move_list.include?(move) and mapping.include?(move)
				move_list.push(move)
				return mapping[move]
			else
				puts "Error: invalid move!"
				puts ask_for_move
				row, column = get_move
			end
		end
	end
end