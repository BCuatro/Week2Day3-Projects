class Board

    def initialize

        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def valid?(position)
        position.all?{|n| n >= 0 && n <= 2}
    end

    def empty?(position)
        return true if @grid[position[0]][position[1]] == "_"
        false
    end

    def place_mark(position, mark)
        raise "Invalid Mark" if !valid?(position) || !empty?(position)
        @grid[position[0]][position[1]] = mark
        
    end
end