def initialize_board
  board = {}
  (1..9).each { |position| board[position] = ' '}
  board
end

def draw_board(board)
  system 'clear'
  puts "#{board[1]} | #{board[2]} | #{board[3]}"
  puts "---------"
  puts "#{board[4]} | #{board[5]} | #{board[6]}"
  puts "---------"
  puts "#{board[7]} | #{board[8]} | #{board[9]}"
end

def empty_positions(board)
  board.select {|k, v| v == ' ' }.keys
end

def player_picks_square(board)
  puts "Pick a square (1-9)"
  position = gets.chomp.to_i
  board[position] = 'X'
end

def computer_picks_square(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board[line[0]] == 'X' && board[line[1]] == 'X' && board[line[2]] == 'X'
    return "Computer" if board[line[0]] == 'O' && board[line[1]] == 'O' && board[line[2]] == 'O'
  end
  nil
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end