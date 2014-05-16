class Notifier
	def update(player, game_result)
		puts "#{player.name} won!" if game_result == :winner
		puts "It's a draw!" if game_result == :draw
	end
end