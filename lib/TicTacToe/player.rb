module TicTacToe
  class Player
    attr_accessor :name, :token
    def initialize(input = {})
      @name = input[:name]
      @token = input[:token]
    end
  end
end
