class Notifier
  def update(player, game_result)
    case game_result
    when :winner
      puts "#{player.name} won!"
    when :draw
      puts "It's a draw!"
    end
  end
end
