require_relative "board"
require_relative "player"



class Battleship
    attr_accessor :player, :board
    def initialize (n)
        @n = n 
        @player = Player.new
        @board = Board.new(@n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts "Ships Remaining: #{@board.num_ships}"
        puts""
        @board.print
    end

    def lose?
        return false if @remaining_misses > 0
        print "you lose"
        true
    end

    def win?
        return false if @board.num_ships > 0
        print "you win"
        true
    end

    def game_over?
        return true if win? || lose?
        false 
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(move) 
        puts " Remaining misses: #{@remaining_misses}"
        puts ""
        @board.print
    

    end


end
