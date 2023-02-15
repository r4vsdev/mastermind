# frozen_string_literal: true

class Game
  attr_reader :game_over, :attempts_left

  def initialize
    @game_over = false
    @attempts_left = 12
    @avaiable_numbers = [1, 2, 3, 4, 5, 6, 7, 8]
    @secret = @avaiable_numbers.shuffle.take(4)
  end

  def player_move
    @player_move = gets.chomp.split('').map(&:to_i).uniq
  end

  def feedback
    feedback_arr = []
    @player_move.each do |guess|
      if @secret.include?(guess)
        i = @secret.index(guess)
        feedback_arr << (@secret[i] == @player_move[i] ? 'X' : 'O')
      end
    end
    feedback_arr
  end

  def over?
    if feedback == %w[X X X X]
      @game_over = true
      puts 'Congratulations! You Won'
    elsif @attempts_left.zero?
      puts 'You Lost!'
      @game_over = true
    else
      @game_over = false
    end
  end

  def remove_attempt
    @attempts_left -= 1
  end
end

game = Game.new

until game.game_over
  puts 'Guess the correct sequence by choosing 4 numbers in the correct order'
  puts "You have #{game.attempts_left} attempts left"
  game.player_move
  puts
  puts "feedback    = #{game.feedback}"
  game.remove_attempt
  game.over?
  puts
end
