module TicTacToe
	class Player
		attr_accessor :name, :token
		def initialize(input)
			@name = input.fetch(:name)
			@token = input.fetch(:token)
		end
	end
end