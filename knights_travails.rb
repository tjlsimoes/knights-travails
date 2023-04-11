

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

    # def knight_moves(insq, endsq, i = 0)

    #     node = build_tree(insq)

    #     p insq 
    #     p endsq 

    #     p node
        
    #     if insq == endsq
    #         return p "#{endsq} #{i}"
    #     elsif insq[0] > endsq[0]
    #         array = [node.child3,node.child4,node.child7,node.child8]
    #         p array

    #         for x in array do
    #             if x != nil 
    #                 build_tree(x)
    #                 i += 1
    #                 knight_moves(x, endsq, i) if i < 5
    #             end
    #         end
    #     elsif insq[0] < endsq[0]
    #         array = [node.child1,node.child2,node.child5,node.child6]
    #         p array

    #         for x in array do
    #             if x != nil 
    #                 build_tree(x)
    #                 i += 1
    #                 knight_moves(x, endsq, i) if i < 5
    #             end
    #         end

    #     elsif insq[0] == endsq[0]
    #         array = [node.child1,node.child2, node.child3, node.child4, node.child5,node.child6,
    #                     node.child7, node.child8]
    #         p array

    #         for x in array do
    #             if x != nil 
    #                 build_tree(x)
    #                 i += 1
    #                 knight_moves(x, endsq, i) if i < 5
    #             end
    #         end
    #     end

    # end

    def knight_moves(insq, endsq)
        
        node = build_tree(insq)

        queue = [[node, 0]]


        path = []
        visited = [node.coordinates]

        while !(queue.empty?)
            current = queue.shift

            path << [current[0].coordinates, current[1]]
            
            return "#{path}; #{current[1]} steps!" if current[0].coordinates == endsq
            
            for i in children(current[0]) do
                if !(visited.include?(i))
                    visited << i
                    queue.push([build_tree(i), current[1] + 1])
                end
            end
        # p current[0].coordinates

        # p queue.map{ |array| [array[0].coordinates, array[1]]}
        end
    end

    
end




board = Board.new

p board.knight_moves([3,3],[4,3])




