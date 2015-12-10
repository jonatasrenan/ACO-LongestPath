class Ant
	attr_accessor :visited_states, :neighbour_count,
				  :solution,
				  :adjacency_matrix, :pheromone_matrix,
				  :alpha, :beta,
                  :pheromone_deposit_amount,
                  :exploitation_factor,
                  :start_node, :end_node

	def initialize(adjacency_matrix, pheromone_matrix, alpha, beta,
                   pheromone_deposit_amount, neighbour_count, exploitation_factor,
                   start_node, end_node)
		@adjacency_matrix = adjacency_matrix
		@pheromone_matrix = pheromone_matrix
		@solution = Solution.new(adjacency_matrix)
		@alpha = alpha
		@beta = beta
		@pheromone_deposit_amount = pheromone_deposit_amount
		@neighbour_count = neighbour_count
		@exploitation_factor = exploitation_factor
        @start_node = start_node
		@end_node = end_node
        @visited_states = Array.new(@adjacency_matrix.size){false}

	end

	def size
		return @adjacency_matrix.size
	end

	def find_available_neighbours (current_node)
		neighbours = Array.new
		@adjacency_matrix.size.times do |neighbour|
			if @adjacency_matrix[current_node][neighbour] > 0
                if @visited_states[neighbour] == false
                    neighbours.insert(-1,neighbour)
                end
            end
        end

		return neighbours
	end

	def get_random_node_index(probability_distribution)
		cumulative_distribution = Array.new
		index = 0
		sum = 0.0
		cumulative_distribution.insert(-1,0.0)

		probability_distribution.each do |p|
			sum += p
			cumulative_distribution.insert(-1,sum)
		end

		r = rand(0.0 .. 1.0)
		cumulative_distribution.size.times do |i|
			if r > cumulative_distribution[i] and r <= cumulative_distribution[i+1]
				index = i
				break
			end
		end
		return index

	end

	def get_next_node(current_node, neighbours)
		st_max_neighbour = Struct.new(:id, :value)
		max_neighbour = st_max_neighbour.new(0,0)

		sum = 0
		probability_distribution = Array.new

		#se somente um vizinho, retorna ele
		if (neighbours.size == 1) then return neighbours[0] end

		neighbours.each do |neighbour|
			edge_cost = @adjacency_matrix[current_node][neighbour]
			pheromone = @pheromone_matrix[current_node][neighbour]
			product = pheromone**alpha * edge_cost**beta
			if product > max_neighbour.value then max_neighbour = st_max_neighbour.new(neighbour, product) end
			sum +=product
		end

		if (rand (0.0 .. 1.0)) <= exploitation_factor then return max_neighbour.id end

		neighbours.each do |neighbour|
			edge_cost = @adjacency_matrix[current_node][neighbour]
			pheromone = @pheromone_matrix[current_node][neighbour]
			probability = pheromone**alpha * edge_cost**beta / sum
			probability_distribution.insert(-1,probability)
		end

		return neighbours[get_random_node_index(probability_distribution)]
	end

	def update_visited
		@solution.node_list.each { |node| visited_states[node] = true }
	end

	def find_solution(current_node,  first_call)
		@visited_states[current_node] = true
		@solution.append_node(current_node)
		possible_neighbours = find_available_neighbours(current_node)

		if possible_neighbours.empty? then return end

        if current_node == @end_node then return end

		next_node = get_next_node(current_node, possible_neighbours)
		find_solution(next_node, false)

		if first_call
			possible_neighbours = find_available_neighbours(current_node)

			if possible_neighbours.empty? then return end

			next_node= get_next_node(current_node, possible_neighbours)

			@solution.reverse_order
			find_solution(next_node, false)
			@solution.reverse_order
		end
    end

	def deposit_pheromone(max_pheromone_threshold)
		@solution.size-1.times do |i|
			v1 = @pheromone_matrix[@solution.node_list[i]][@solution.node_list[i+1]]
			v2 = @pheromone_matrix[@solution.node_list[i+1]][@solution.node_list[i]]
			v1 += @pheromone_deposit_amount
			v2 += @pheromone_deposit_amount
			if v1<max_pheromone_threshold then @pheromone_matrix[@solution.node_list[i]][@solution.node_list[i+1]] =v1 end
			if v2<max_pheromone_threshold then @pheromone_matrix[@solution.node_list[i+1]][@solution.node_list[i]] =v2 end
		end
	end
end

