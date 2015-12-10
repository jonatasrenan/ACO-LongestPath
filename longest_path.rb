require 'input'
require 'aco'
#Require: gem install parallel
require 'parallel'

class LongestPath
    attr_accessor :min_runs, :max_runs, :step_runs,
                  :min_ants, :max_ants, :step_ants,
                  :iterations,
                  :initial_pheromone_amount,
                  :ant_pheromone_deposit_amount,
                  :pheromone_evaporation_rate,
                  :max_pheromone_threshold,
                  :min_pheromone_threshold,
                  :alpha,
                  :beta,
                  :exploitation_factor,
                  :input_file_path,
                  :optimum_cost


    def initialize (min_runs, max_runs, step_runs, min_ants, max_ants, step_ants,
                    iterations, initial_pheromone_amount, ant_pheromone_deposit_amount,
                    pheromone_evaporation_rate, daemon_pheromone_deposit_amount,
                    max_pheromone_threshold, min_pheromone_threshold,
                    alpha, beta, exploitation_factor, input_file_path, optimum_cost,
                    with_header,output_file,description)

        @min_runs = min_runs
        @max_runs = max_runs
        @step_runs = step_runs
        @min_ants = min_ants
        @max_ants = max_ants
        @step_ants = step_ants
        @iterations = iterations
        @initial_pheromone_amount = initial_pheromone_amount
        @ant_pheromone_deposit_amount = ant_pheromone_deposit_amount
        @pheromone_evaporation_rate = pheromone_evaporation_rate
        @daemon_pheromone_deposit_amount = daemon_pheromone_deposit_amount
        @max_pheromone_threshold = max_pheromone_threshold
        @min_pheromone_threshold = min_pheromone_threshold
        @alpha = alpha
        @beta = beta
        @exploitation_factor = exploitation_factor
        @input_file_path = input_file_path
        @optimum_cost = optimum_cost
        @with_header = with_header
        @output_file = output_file
        @description = description

        input = Input.new(@input_file_path)

        #puts "Iterations, Ants, Runs, BestSol, %SuccCount, execTimeMean, totalExeTime, %Quality"
        #puts "Iterations, Ants, Runs, BestSol, ExecTimeMean, TotalExecTime,%Quality"

        output_header = ['Iterations',
                         'Ants',
                         'Runs',
                         'Initial pheromone amount',
                         'Ant pheromone deposit amount',
                         'Pheromone evaporation rate',
                         'Daemon pheromone deposit amount',
                         'Max pheromone threshold',
                         'Min pheromone threshold',
                         'Alpha',
                         'Beta',
                         'Exploitation factor',
                         'Input File',
                         'Best solution',
                         'Execution Time Mean',
                         'Execution Total Time',
                         'Description',
                         'Node List'

        ]

        puts output_header.join(',')
        if with_header then
            if (not output_file.nil?)
                open(output_file, 'a') { |f|
                    f.puts output_header.join(',')
                }
            end
        end

        (@min_runs..@max_runs).step(@step_runs).each do |num_runs|
            (@min_ants..@max_ants).step(@step_ants) do |num_ants|

                #success_count = 0
                #total_exec_time_for_all_runs = 0
                #all_best_solution = 0
                #quality = 0



                #@iterations.times do
                results = Parallel.map(Array.new(@iterations).map{|a| a = [0,0,nil]}) do |result|

                    start_time = Time.now
                    exec_time = 0

                    aco = ACO.new(input, num_runs, num_ants, initial_pheromone_amount, ant_pheromone_deposit_amount,
                                  pheromone_evaporation_rate, daemon_pheromone_deposit_amount, max_pheromone_threshold, min_pheromone_threshold, alpha, beta,
                                  exploitation_factor)

                    aco.run
                    solution = aco.global_best_solution

                    #in seconds
                    exec_time += (Time.now - start_time)

                    result = [solution.cost,exec_time,solution.node_list]
                end


                costs = results.map{|a| a[0]}
                exec_times = results.map{|a| a[1]}


                all_best_solution = costs.max
                total_exec_time_for_all_runs = exec_times.reduce{|sum,x| sum+x}
                node_list = results.sort_by{|a| a[0]}.reverse[0][2].to_s


               # if solution.cost >= optimum_cost then success_count end

                #quality += solution.cost / optimum_cost

                #if solution.cost > all_best_solution then all_best_solution = solution.cost end

                output_value = [
                    num_runs,
                    num_ants,
                    @iterations,
                    @initial_pheromone_amount,
                    @ant_pheromone_deposit_amount,
                    @pheromone_evaporation_rate,
                    @daemon_pheromone_deposit_amount,
                    @max_pheromone_threshold,
                    @min_pheromone_threshold,
                    @alpha ,
                    @beta,
                    @exploitation_factor,
                    @input_file_path,
                    all_best_solution,
                    (total_exec_time_for_all_runs/@iterations).round(4),
                    (total_exec_time_for_all_runs).round(4),
                    @description,
                    node_list
                ]

                output  = output_value.each_with_index do |v,i|
                    s = '%'+output_header[i].size.to_s+'s'
                    output_value[i] = s % v.to_s
                end

                puts output.join(',')

                if (not output_file.nil?)
                    open(output_file, 'a') { |f|
                        f.puts output_value.join(',')
                    }
                end
            end
        end
    end
end
