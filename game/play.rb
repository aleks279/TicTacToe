require_relative "../tictactoe.rb"

puts "Welcome!"
player1 = TicTacToe::Player.new({token: "X", name: "Player 1"})
player2 = TicTacToe::Player.new({token: "O", name: "Player 2"})
players = [player1, player2]
TicTacToe::Game.new(players).play