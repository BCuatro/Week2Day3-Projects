class Player
    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`:  '
        user_input = gets.chomp.split
        user_input.map(&:to_i)
    end
end
