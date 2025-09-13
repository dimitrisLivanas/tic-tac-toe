require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  def play
    game_over = false
    until game_over
      @board.display
      make_move
      if @board.winner
        puts "#{@current_player.name} wins!"
        game_over = true
      elsif @board.draw?
        puts "It's a draw!"
        game_over = true
      end
      switch_player unless game_over
    end
    @board.display
  end

  def make_move
    loop do
      puts "#{@current_player.name}'s turn. Enter your move (row, COMMA, column): "
      input = gets.chomp.split(',').map(&:to_i)
      row, col = input[0], input[1]

      if row.between?(0, 2) && col.between?(0, 2) && @board.grid[row][col].nil?
        @board.update_grid(row, col, @current_player.symbol)
        break
      else
        puts "Invalid move. Please try again."
      end
    end
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end