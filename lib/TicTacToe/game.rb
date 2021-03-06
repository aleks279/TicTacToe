module TicTacToe
  require 'observer'
  class Game
    include Observable
    attr_accessor :players, :board, :current_player, :second_player, :move_list
    PLAYER1 = Player.new(token: "X", name: "Player 1")
    PLAYER2 = Player.new(token: "O", name: "Player 2")
    MAPPING = { 
      "1" => [0, 0], "2" => [1, 0], "3" => [2, 0],
      "4" => [0, 1], "5" => [1, 1], "6" => [2, 1],
      "7" => [0, 2], "8" => [1, 2], "9" => [2, 2] }

      def initialize(board = Board.new)
        add_observer(Notifier.new)
        @players = [PLAYER1, PLAYER2]
        @board = board
        @current_player, @second_player = players.shuffle
        @move_list = Array.new
      end

      def play
        puts "#{current_player.name} is the first player"
        next_turn until board.game_over
        print_formatted_grid
        puts ""
      end

      def next_turn
        print_formatted_grid
        ask_for_move
        row, column = get_move
        board.grid[column][row].value = current_player.token
        if board.game_over
          puts ""
          changed
          notify_observers(current_player, board.game_over)
        else
          switch_players
        end
      end

      private

      def switch_players
        @current_player, @second_player = @second_player, @current_player
      end

      def ask_for_move
        puts "#{current_player.name}: Enter a number from 1 to 9 to make your move"
      end

      def get_move(move = gets.chomp)
        move_to_coordinate(move)
      end

      def print_formatted_grid
        board.grid.each do |row|
          puts row.map {|cell| cell.value.empty? ? "_" : cell.value}.join(" ")
        end
      end

      def valid_move?(move)
        !move_list.include?(move) and MAPPING.include?(move)
      end

      def move_to_coordinate(move)
        if valid_move?(move)
          move_list.push(move)
          return MAPPING[move]
        else
          puts "Error: invalid move!"
          ask_for_move
          row, column = get_move
        end
      end
  end
end
