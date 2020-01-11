require 'pry'

class TicTacToe
  WIN_COMBINATIONS=[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  # binding.pry
  def initialize
    @board = Array.new(9, " ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, players_token = "X")
    @board[index] = players_token
  end

  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter=0
    @board.each do |cell|
      #binding.pry
      if cell == "X" || cell == "O"
      counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    counter=0
    board_count = 0
    while counter < 9
        if position_taken?(counter) == true
            board_count += 1
        end
        counter += 1
    end
    if board_count < @board.length
        return false
    else
        return true
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def draw?
    if !won? && full?
      true
    elsif (!won? && !full?) || won?
      false
    end
  end

  def over?
    if  won? && !full?
      return true
    elsif draw?
      return true
    elsif won? && full?
      return true
    elsif !won? && !full?
      return false
    else
      return false
    end
  end

  def turn
    #valid = false
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def winner
    if winning_array = won?
      player = @board[winning_array[0]]
      return player
    end
  end

  def play
<<<<<<< HEAD
    until over? == true do
=======
    until over? == false do
>>>>>>> 64374ea16a357446906e41e5b6dd5157792fc008
      turn
    end

    if over?
      if draw?
        puts "Cat's Game!"
      elsif won?
        if winner == "X"
          puts "Congratulations X!"
        else
           puts "Congratulations O!"
         end
      end
      #binding.pry
    end
  end #play end


end # class end
