require 'solution'
require 'ant'

class ACO
    attr_accessor :adjacency_matrix, :pheromone_matrix,
                  :neighbour_count,
                  :alpha, :beta, :total_vertices,
                  :initial_pheromone_amount, :ant_pheromone_deposit_amount,
                  :daemon_pheromone_deposit_amount,
                  :pheromone_evaporation_rate,
                  :min_pheromone_threshold, :max_pheromone_threshold,
                  :global_best_solution,
                  :num_iterations, :num_ants,
                  :ants, :start_node, :destination_vertex, :exploitation_factor

    def initialize(input, num_iterations, num_ants, initial_pheromone_amount, ant_pheromone_deposit_amount,
                   pheromone_evaporation_rate, daemon_pheromone_deposit_amount, max_pheromone_threshold, min_pheromone_threshold, alpha, beta,
                   exploitation_factor)

        @num_iterations = num_iterations
        @num_ants = num_ants
        @initial_pheromone_amount = initial_pheromone_amount
        @ant_pheromone_deposit_amount = ant_pheromone_deposit_amount
        @pheromone_evaporation_rate = pheromone_evaporation_rate
        @daemon_pheromone_deposit_amount = daemon_pheromone_deposit_amount
        @max_pheromone_threshold = max_pheromone_threshold
        @min_pheromone_threshold = min_pheromone_threshold
        @alpha = alpha
        @beta = beta
        @exploitation_factor = exploitation_factor
        @ants = Array.new
        @neighbour_count = Hash.new
        @pheromone_matrix = Hash.new{ |h,k| h[k] = Array.new(&h.default_proc) }

        @total_vertices = input.num_vertexes
        @start_node = input.start_node
        @end_node = input.end_node
        @adjacency_matrix = input.nodes

        #vetor de número de vizinhos do vertice
        #inicializa matriz de feromonio com o valor inicial previsto
        @total_vertices.times do |i|
            @neighbour_count[i]=0
            @total_vertices.times do |j|
                if @adjacency_matrix[i][j] > 0
                    @neighbour_count[i]+=1
                    @pheromone_matrix[i][j] = initial_pheromone_amount
                else
                    @pheromone_matrix[i][j] = 0
                end
            end
        end

        @global_best_solution = Solution.new (@adjacency_matrix)
    end

    def run
        @num_iterations.times do |iteration|
            local_best_solution = Solution.new(@adjacency_matrix)

            @num_ants.times do |num_ant|
                ant = Ant.new(@adjacency_matrix, @pheromone_matrix, @alpha, @beta,
                              @ant_pheromone_deposit_amount, @neighbour_count,
                              @exploitation_factor, @start_node, @end_node)

                ant.find_solution(@start_node, true)

                if ant.solution.valid_solution?(@start_node, @end_node)
                    ant.deposit_pheromone(@max_pheromone_threshold)

                    if (ant.solution.cost > local_best_solution.cost)
                        local_best_solution = ant.solution
                    end

                    global_pheromone_update(local_best_solution)
                end

            end
            if local_best_solution.valid_solution?(@start_node, @end_node)
                if (local_best_solution.cost > @global_best_solution.cost) then @global_best_solution = local_best_solution end
            end
        end
    end

    def global_pheromone_update (local_best_solution)
        @total_vertices.times do |i|
            @total_vertices.times do |j|
                if i!=j
                    value = @pheromone_matrix[i][j]
                    value = value * (1-@pheromone_evaporation_rate)
                    if value > @min_pheromone_threshold
                        @pheromone_matrix[i][j]=value
                    end
                end
            end
        end

        #depositar mais feromonio na melhor solução
        local_best_solution.node_list.size-1.times do |i|
            v1 = pheromone_matrix[i][i+1]
            v2 = pheromone_matrix[i+1][i]
            v1 += daemon_pheromone_deposit_amount
            v2 += daemon_pheromone_deposit_amount
            if (v1 < max_pheromone_threshold)
                pheromone_matrix[local_best_solution.node_list[i]][local_best_solution.node_list[i+1]] = v1
                pheromone_matrix[local_best_solution.node_list[i+1]][local_best_solution.node_list[i]] = v2
            end

        end
    end
end
