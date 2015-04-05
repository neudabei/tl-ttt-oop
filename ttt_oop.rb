# Write out a description of the program and then extract the nouns and the verbs. Group common verbs into nouns

class CreateBoard

  def initialize
    @board = {} # notfalls global variable daraus machen @@
    (1..9).each { |position| @board[position] = ' '}
    @board
  end

  def draw_board
    system 'clear'
    puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"
    puts "---------"
    puts "#{@board[4]} | #{@board[5]} | #{@board[6]}"
    puts "---------"
    puts "#{@board[7]} | #{@board[8]} | #{@board[9]}"
  end

  def empty_positions
    @board.select {|k, v| v == ' ' }.keys
  end

end

class Player

  def initialize
    player = @player
    computer = @computer
  end

  def player_picks_square
    puts "Pick a square (1-9)"
    position = gets.chomp.to_i
    @board[position] = 'X'
  end

  def computer_picks_square
    position = empty_positions(@board).sample
    @board[position] = 'O'
  end

  def check_winner
    winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_lines.each do |line|
      return "Player" if @board[line[0]] == 'X' && @board[line[1]] == 'X' && @board[line[2]] == 'X'
      return "Computer" if @board[line[0]] == 'O' && @board[line[1]] == 'O' && @board[line[2]] == 'O'
    end
    nil
  end

end

board = CreateBoard.new

board.draw_board

players = Player.new

begin
  players.player_picks_square
  players.computer_picks_square
  players.check_winner
end




# begin
#   player_picks_square(board)
#   computer_picks_square(board)
#   draw_board(board)
#   winner = check_winner(board)
# end until winner || empty_positions(board).empty?

# if winner
#   puts "#{winner} won!"
# else
#   puts "It's a tie!"
# end
