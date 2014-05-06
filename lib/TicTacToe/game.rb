module TicTacToe
	class Game
		attr_accessor :players, :board, :current_player, :second_player, :move_list
		def initialize(players, board = Board.new)
			@players = players
			@board = board
			@current_player, @second_player = players.shuffle
			@move_list = Array.new
		end

		def switch_players
			@current_player, @second_player = @second_player, @current_player
		end

		def ask_for_move
			"#{current_player.name}: Enter a number from 1 to 9 to make your move"
		end

		def get_move(move = gets.chomp)
			move_to_coordinate(move)
		end

		def message
			return "#{current_player.name} won!" if board.game_over == :winner
			return "It's a draw!" if board.game_over == :draw
		end

		def play
			puts "#{current_player.name} is the first player"
			while true
				board.formatted_grid
				puts ""
				puts ask_for_move
				x,y = get_move
				board.set_cell(x,y,current_player.token)
				if board.game_over
					puts message
					board.formatted_grid
					return
				else
					switch_players
				end
			end
		end

		private

		def move_to_coordinate(move)
			mapping = {
				"1" => [0, 0],
				"2" => [1, 0],
				"3" => [2, 0],
				"4" => [0, 1],
				"5" => [1, 1],
				"6" => [2, 1],
				"7" => [0, 2],
				"8" => [1, 2],
				"9" => [2, 2]
			}
			if !move_list.include?(move) and mapping.include?(move)
				move_list.push(move)
				return mapping[move]				
			else				
				puts "Error: invalid move!"
				puts ask_for_move
				x, y = get_move
			end
		end
	end
end