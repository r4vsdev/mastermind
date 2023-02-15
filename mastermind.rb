class Game
  attr_reader :secret, :feedback_arr, :game_over

  def initialize
    @game_over = false
    @avaiable_numbers = [1, 2, 3, 4, 5, 6, 7, 8]
    @secret = @avaiable_numbers.shuffle.take(4)
  end

  def get_player_move
    @player_move = gets.chomp.split('').map(&:to_i).uniq
  end
  
  def feedback
    feedback_arr = []
    @player_move.each do |guess|
      if @secret.include?(guess)
        i = @secret.index(guess)
        if @secret[i] == @player_move[i]
          feedback_arr << 'X'
        else
          feedback_arr << 'O'
        end 
      end
    end
    return feedback_arr
  end

  def is_over?
    if self.feedback == ['X', 'X', 'X', 'X']
      @game_over = true
      puts "Congratulations! You Won"
    else
      @game_over = false
    end
  end
end

game = Game.new

until game.game_over do
  puts 'Guess the correct sequence by choosing 4 numbers in the correct order'
  player_move = game.get_player_move
  puts "player_move = #{player_move}"
  puts "secret      = #{game.secret}"
  puts "feedback    = #{game.feedback}"
  game.is_over?
end