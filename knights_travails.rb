# Assignment

# Build a function knight_moves that shows the shortest possible way
# to get from one square to another by outputting all squares the
# knight will stop along the way.

# Think of the board as having 2-dimensional coordinates.

# Examples:

# knight_moves([0,0], [1,2]) == [[0,0], [1,2]]
# knight_moves([0,0], [3,3]) == [[0,0], [1,2], [3,3]]
# knight_moves([3,3], [0,0]) == [[3,3], [1,2], [0,0]]


# Notes:

# [0,0] doesn't have to be the middle of the board.
# It can be, for example, the left down edge of the board.

# That said: board is 8x8.
# Which implies that coordinates for each side 
# range from 0-7.

# In light of examples provided and interpretation of [0,0]
# how could the axis for the two coordinates be set?

# Knight basic move: 2 steps forward and 1 step to the side.

# If [0,0] is left down edge, then [1,2] would define the
# horizontal axis first and then the vertical axis.

# Hence, coordinates can be defined as [x,y] where 
# x is the horizontal axis and y the vertical axis
# in a 0-7 axis to another 0-7 axis.


# The question now seems to be:
# How to produce a graph of all the possible knight positions?

# Assignment instructions only say as regards to this point:
# Put together a script that creates a game board and a knight.
# Treat all possible moves the knight could make as children
# in a tree. Don't allow any moves to go off the board.

# In principle one should be able to derive all possible knight 
# positions from the transformation of any given coordinate 
# in accordance to some rule which expresses the knight's basic 
# move.

# How could one mathematically express the knight's basic move?

# Given [x, y] one would get another possible position thus:
# x + 1, y + 2

# Given [x, y] one would also get another possibile position thus:
# x + 2, y + 1

# An perhaps even:
# x - 1, y - 2
# x - 2, y - 1

# Of course all values will have to be: value mod 7 

# This being said, let us focus on coordinates [0,0]
# [1,2] and [2,1] are real possible coordinates
# [6,5] and [5,6] though possible coordinates would not
# be actually possible coordinates.
# Why is that?
# It seems to be because the values are negative.

# For if one were to consider the coordinates [3,3]
# Possible coordinates would be:
# [4,5], [5,4], [2,1], [1,2]
# Which would be all actually possible coordinates.

# In accordance to this line of thought:
# derivable coordinates would be actual so long as 
# result of the transforming operations would not 
# result in negative values.

# However is this the only actual restriction?
# What about when resulting values from the 
# transforming operation surpass 7?

# Let's take, for example, coordinates [7,5],
# a derivable position from [4,5].

# Considered visually coordinates [7,5]
# place the knight on the farthermost horizontal square
# to the right of the board, fives squares up.
# That seems to mean: addition to the x-axis should not
# be possible.

# To sum up: actually possible derivable coordinates
# from the above operations will result so long
# as output values are:
    # not negative and/or not greater to 7.


# Done: How to mathematically extract all possible 
# positions on the board from any given coordinate.

# Question now seems to be:
# How to translate all this into code?

# Again:
# Assignment instructions only say as regards to this point:
# 1. Put together a script that creates a game board and a knight.
# 2. Treat all possible moves the knight could make as children
# in a tree. Don't allow any moves to go off the board.

# First instruction suggests the creation of a board and 
# knight separately.
# Second instruction suggests to «treat all possible moves the 
# knight could make as children in a tree.»

# As regards to the second instruction:
# "Worst case scenario": knight position would admit 4 actual possible 
# transformations of given position.
# That is:
# "Worst case scenario": given position will be root to 4 branches.
# Guessing, "best case scenario": given position will be root to 2 branches.

# Second instruction thus suggests, in light of what was done with
# binary search trees:
# creation of node class and tree class

# Examples suggest arrays as input.


class KnightNode
    attr_accessor :coordinates, :child1, :child2,
                    :child3, :child4

    def initialize(coordinates)

        @coordinates = coordinates
        @child1 = nil
        @child2 = nil
        @child3 = nil
        @child4 = nil
    end
end


class KnightTree
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

        root_node
    end
end

knight = KnightTree.new([0,0])
p knight