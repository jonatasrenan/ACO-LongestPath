# private ArrayList<Integer> nodeList;
# private Double cost;
# private ArrayList<ArrayList<Double>> adjacencyMatrix;

class Solution
    attr_accessor :node_list,
                  :cost,
                  :adjacency_matrix

    def initialize (adjacency_matrix)
        @node_list = Array.new
        @cost = 0.0
        @adjacency_matrix = adjacency_matrix
    end

    def append_node(node_index)
        if (!@node_list.empty?) then @cost += @adjacency_matrix[@node_list[-1]][node_index] end
        node_list.insert(-1, node_index)
    end

    def copy_from(source)
        @node_list.clear
        @node_list += source.node_list
        @cost = source.cost
    end

    def size
        return @node_list.size
    end

    def to_s
        puts "Solution: "+@node_list.join(",")+", Cost: "+@cost.to_s
    end

    def reverse_order()
        @node_list = @node_list.reverse
    end

    # public ArrayList<ArrayList<Double>> getAdjacencyMatrix() {
    #     return adjacencyMatrix;
    # }

    def get_partial_copy(size)
    #     copia a solução até o index (inclusive)
        partial_solution = Solution.new (@adjacency_matrix)
        size.times do |i|
            partial_solution.append_node(node_list[i])
        end
        return partial_solution
    end

    def reversed_copy
        reversed_solution = self
        reversed_solution.node_list = @node_list.reverse
        return reversed_solution
    end

    # Integer getNodeByIndex(int index) {
    #     return nodeList.get(index);
    # }

    def has_vertex(vertex)
        node_list.index(vertex).nil? ? false : true
    end

    def insert_after_vertex(prev_vertex, vertex_to_insert)
        index = node_list.index(prev_vertex)+1
        next_vertex = node_list[index]
        node_list.insert(index, vertex_to_insert)

        extra_cost = adjacency_matrix[prev_vertex][vertex_to_insert] + adjacency_matrix[vertex_to_insert][next_vertex]
        cost_to_remove = adjacency_matrix[prev_vertex][next_vertex]
        cost = cost + extra_cost - cost_to_remove
    end

    def get_three_neighbour_vertices_from_half_to_end
        three_neighbour_vertices = Array.new
        start_index = @size / 2 - 1
        end_index    = @size     - 2

        (start_index..end_index-1).each do |i|
            neighbours = 0
            @adjacency_matrix.size.times do |j|
                if adjacency_matrix[node_list[i]][j] > 0
                    neighbours+=1
                end
            end
            if (neighbours > 3 )
                three_neighbour_vertices.insert(-1, node_list[i])
            end
        end
        return three_neighbour_vertices
    end

    def valid_solution?(start_node, end_node)
        if end_node == @node_list.last
            if start_node == @node_list.first
                return true
            end
        end
        return false
    end
end

