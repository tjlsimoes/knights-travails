current_children = queue.select { |array| array[1] == current[1] + 1}
if current_children.length != 0 && queue.length != current_children.length

    previous_current = current[2]

    queue.map! do |array|

        if array[1] == current[1] + 1 && !(array.include?(previous_current))
            
            array.push(previous_current)
            
        else
            array
        end
    end

    p "New queue"
    p queue.map{ |array| [array[0].coordinates, array[1], array[2..]]}

end



# p current[0].coordinates
        # p "Select array[1] == current[1] + 1"
        # p queue.select { |array| array[1] == current[1] + 1}.map{ |array| [array[0].coordinates, array[1], array[2]]}
        # p "Queue"
        # p queue.map{ |array| [array[0].coordinates, array[1], array[2..]]}

        # if queue.select { |array| array[1] == current[1] + 1}.length != 0 && current[1] != 0
        #     last_el_ind = queue.find { |array| array[1] == current[1]}
        #     p "Previous current"
        #     previous_current = last_el_ind[2]
        #     p previous_current

        #     queue.map! do |array|

        #         if array[1] == current[1] + 1 && !(array.include?(previous_current))

        #             array.push(previous_current)

        #         else
        #             array
        #         end
        #     end

        #     p "New queue"
        #     p queue.map{ |array| [array[0].coordinates, array[1], array[2], array[3], array[4]]}


        # end



        # def knight_moves(insq, endsq, queue = [], visited = [], steps = 0, path = [])

    #     if !(visited.include?(insq))

    #         node = build_tree(insq)

    #         queue << [node, steps]

    #         while !(queue.empty?)
    #             current = queue.shift

    #             return "#{path} #{current[1]} steps!" if current[0].coordinates == endsq

    #             for i in children(current[0]) do
    #                 visited << i
    #                 queue.push([build_tree(i), current[1] + 1, current[0].coordinates])
    #                 knight_moves(i, endsq, queue, visited, steps + 1, path.push(current[0].coordinates))
    #             end
    #         end

    #     end

    # end