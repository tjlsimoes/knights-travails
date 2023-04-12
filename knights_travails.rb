

class KnightNode
    attr_accessor :coordinates, :child1, :child2,
                    :child3, :child4, :child5, 
                    :child6, :child7, :child8

    def initialize(coordinates)

        @coordinates = coordinates
        @child1 = nil
        @child2 = nil
        @child3 = nil
        @child4 = nil
        @child5 = nil
        @child6 = nil
        @child7 = nil
        @child8 = nil
    end

    def children(node)
        [node.child1, node.child2, node.child3, node.child4, 
            node.child5, node.child6, node.child7, node.child8].compact
    end
end


class KnightTree < KnightNode
    def initialize(coordinates)
        @root = build_tree(coordinates)
    end

    def build_tree(coordinates)
        return nil if !coordinates.kind_of?(Array) || coordinates.empty?

        root_node = KnightNode.new(coordinates)

        if coordinates[0] + 1 <= 7 && coordinates[1] + 2 <= 7
            root_node.child1 = [coordinates[0] + 1, coordinates[1] + 2]
        end
        
        if coordinates[0] + 2 <= 7 && coordinates[1] + 1 <= 7
            root_node.child2 = [coordinates[0] + 2, coordinates[1] + 1]
        end
        
        if coordinates[0] - 1 >= 0 && coordinates[1] - 2 >= 0
            root_node.child3 = [coordinates[0] - 1, coordinates[1] - 2]
        end
        
        if coordinates[0] - 2 >= 0 && coordinates[1] - 1 >= 0
            root_node.child4 = [coordinates[0] - 2, coordinates[1] - 1]
        end

        # Possibilities previously ignored:

        if coordinates[0] + 1 <= 7 && coordinates[1] - 2 >= 0
            root_node.child5 = [coordinates[0] + 1, coordinates[1] - 2]
        end
        
        if coordinates[0] + 2 <= 7 && coordinates[1] - 1 >= 0
            root_node.child6 = [coordinates[0] + 2, coordinates[1] - 1]
        end
        
        if coordinates[0] - 1 >= 0 && coordinates[1] + 2 <= 7
            root_node.child7 = [coordinates[0] - 1, coordinates[1] + 2]
        end
        
        if coordinates[0] - 2 >= 0 && coordinates[1] + 1 <= 7
            root_node.child8 = [coordinates[0] - 2, coordinates[1] + 1]
        end

        root_node
    end


end




class Board < KnightTree

    def initialize
        
    end
    

    def knight_moves(insq, endsq)
        
        node = build_tree(insq)

        queue = [[node, 0]]

        visited = [node.coordinates]


        while !(queue.empty?)
            current = queue.shift

            if current[0].coordinates == endsq
                puts "You made it in #{current[1]} moves! Here's your path:"
                path_flat = current[2..].flatten
                path = []
                i = 0
                while i < path_flat.length
                    
                    puts "#{[path_flat[i], path_flat[i + 1]]}"
                    path << [path_flat[i], path_flat[i + 1]]

                    i += 2
                end
                return [current[1], path]
            end
            
            for i in children(current[0]) do
                if !(visited.include?(i))
                    visited << i

                    # for every new cylcle, for every new current, append previous current,
                    # to indication of current present on queue sub-arrays
                    el_to_add = [build_tree(i), current[1] + 1]

                    p "Current [2..]"
                    p current[2..]

                    if !(current[2..].empty?)
                        el_to_add[2] = [current[2..] + current[0].coordinates]
                    else
                        el_to_add[2] = [current[0].coordinates]
                    end
                    queue.push(el_to_add)
                end
            end


            p current[0].coordinates
            p "Select array[1] == current[1] + 1"
            p queue.select { |array| array[1] == current[1] + 1}.map{ |array| [array[0].coordinates, array[1], array[2..]]}
            p "Queue"
            p queue.map{ |array| [array[0].coordinates, array[1], array[2..]]}
            puts " "

        end
    end
            
end




board = Board.new

board.knight_moves([3,3],[4,3])




