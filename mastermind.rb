require 'pry-byebug'

# computer sets the secret
# player choose the try
# send feedback to player
#   if color and sequence are right:
#     feedback_arr << 'X'
#   if color is right:
#     feedback_arr << 'O'

class Game
  attr_reader :secret, :feedback_arr
  def initialize
    @game_over = false
    @avaiable_numbers = [1, 2, 3, 4, 5, 6, 7, 8]
    # @secret = @avaiable_numbers.shuffle.take(4)
    @secret = [1,3,5,6]
  end
  
  def feedback
    feedback_arr = []
    for guess in @player_move
      if @secret.include?(guess)
        i = @secret.index(guess)
        for element in @secret
          if guess == element
            feedback_arr.push('X')
          end
        end
      end
    end
    return feedback_arr
  end
  
  def get_player_move
    # @player_move = gets.chomp.split('').map(&:to_i)
    @player_move = [1,2,3,4]
  end

end

game = Game.new

puts 'Guess the correct sequence by choosing 4 numbers in the correct order'
until @game_over do 
  player_move = game.get_player_move
  puts "player_move = #{player_move}"
  puts "secret      = #{game.secret}"
  puts "feedback    = #{game.feedback}"
  break
end