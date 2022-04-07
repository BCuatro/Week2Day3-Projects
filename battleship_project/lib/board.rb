require "byebug"
class Board
    attr_accessor :size, :grid
    def self.print_grid(array)
        array.each {|subarray| puts  subarray.join(" ")}
    end
   
  
    def initialize (n)
        @n = n
        @grid= Array.new(@n)  {Array.new(@n, :N)}
        @size = @n * @n
    end
    def [] (pos)
        @grid[pos[0]][pos[1]]
    end
    def []= (pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
       
        @grid.flatten.count(:S)
    end
    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos]= :X
            return false
        end
    end

    def place_random_ships
        number_of_ships = (@n * @n)/4
        
        while num_ships < number_of_ships
            @grid[rand(0...@n)][rand(0...@n)] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |subarray|
            subarray.map do |ele| 
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end
    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
