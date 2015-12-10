$: << File.join(File.dirname(__FILE__))

require 'optparse'
require 'longest_path'

class Main
    def set_args
        $options = {}

        OptionParser.new do |opts|
            opts.banner = "Usage: main.rb [options]"

            opts.on('-1', '--min_runs value', 'min_runs') do |v|
                $options[:min_runs] = v
            end
            opts.on('-2', '--max_runs value', 'max_runs') do |v|
                $options[:max_runs] = v
            end
            opts.on('-3', '--step_runs value', 'step_runs') do |v|
                $options[:step_runs] = v
            end
            opts.on('-4', '--min_ants value', 'min_ants') do |v|
                $options[:min_ants] = v
            end
            opts.on('-5', '--max_ants value', 'max_ants') do |v|
                $options[:max_ants] = v
            end
            opts.on('-6', '--step_ants value', 'step_ants') do |v|
                $options[:step_ants] = v
            end
            opts.on('-7', '--iterations value', 'iterations') do |v|
                $options[:iterations] = v
            end
            opts.on('-8', '--initial_pheromone_amount value', 'initial_pheromone_amount') do |v|
                $options[:initial_pheromone_amount] = v
            end
            opts.on('-9', '--ant_pheromone_deposit_amount value', 'ant_pheromone_deposit_amount') do |v|
                $options[:ant_pheromone_deposit_amount] = v
            end
            opts.on('-10', '--pheromone_evaporation_rate value', 'pheromone_evaporation_rate') do |v|
                $options[:pheromone_evaporation_rate] = v
            end
            opts.on('-11', '--daemon_pheromone_deposit_amount value', 'daemon_pheromone_deposit_amount') do |v|
                $options[:daemon_pheromone_deposit_amount] = v
            end
            opts.on('-12', '--max_pheromone_threshold value', 'max_pheromone_threshold') do |v|
                $options[:max_pheromone_threshold] = v
            end
            opts.on('-13', '--min_pheromone_threshold value', 'min_pheromone_threshold') do |v|
                $options[:min_pheromone_threshold] = v
            end
            opts.on('-14', '--alpha value', 'alpha') do |v|
                $options[:alpha] = v
            end
            opts.on('-15', '--beta value', 'beta') do |v|
                $options[:beta] = v
            end
            opts.on('-16', '--exploitation_factor value', 'exploitation_factor') do |v|
                $options[:exploitation_factor] = v
            end
            opts.on('-17', '--input_file_path file', 'input_file_path') do |v|
                $options[:input_file_path] = v
            end
            opts.on('-18', '--optimum_cost value', 'optimum_cost') do |v|
                $options[:optimum_cost] = v
            end
            opts.on('-19', '--output_header', 'output_header') do
                $options[:output_header] = true
            end
            opts.on('-20', '--output_file value', 'output_file') do |v|
                $options[:output_file] = v
            end
            opts.on('-21', '--description description', 'description') do |v|
                $options[:description] = v
            end
        end
    end

    def execute

        set_args.parse!(ARGV)

        min_runs                  = $options[:min_runs].nil?    ? 5 : $options[:min_runs].to_i
        max_runs                  = $options[:max_runs].nil?    ? 5 : $options[:max_runs].to_i
        step_runs                 = $options[:max_runs].nil?    ? 5 : $options[:max_runs].to_i
        min_ants                        = $options[:min_ants].nil?  ? 20 : $options[:min_ants].to_i
        max_ants                        = $options[:max_ants].nil?  ? 20 : $options[:max_ants].to_i
        step_ants                       = $options[:step_ants].nil? ? 20 : $options[:step_ants].to_i
        iterations                            = $options[:iterations].nil?      ? 10 : $options[:iterations].to_i
        initial_pheromone_amount        = $options[:initial_pheromone_amount].nil?          ? 20.0  : $options[:initial_pheromone_amount].to_f
        ant_pheromone_deposit_amount    = $options[:ant_pheromone_deposit_amount].nil?      ? 1.0   : $options[:ant_pheromone_deposit_amount].to_f
        pheromone_evaporation_rate      = $options[:pheromone_evaporation_rate].nil?        ? 0.25  : $options[:pheromone_evaporation_rate].to_f
        daemon_pheromone_deposit_amount = $options[:daemon_pheromone_deposit_amount].nil?   ? 2     : $options[:daemon_pheromone_deposit_amount].to_f
        max_pheromone_threshold         = $options[:max_pheromone_threshold].nil?           ? 100.0 : $options[:max_pheromone_threshold].to_f
        min_pheromone_threshold         = $options[:min_pheromone_threshold].nil?           ? 0.001 : $options[:min_pheromone_threshold].to_f
        alpha                           = $options[:alpha].nil? ? 1.0 : $options[:alpha].to_f
        beta                            = $options[:beta].nil?  ? 1.0 : $options[:beta].to_f
        exploitation_factor             = $options[:exploitation_factor].nil?   ? 0.1                   : $options[:exploitation_factor].to_f
        input_file_path                 = $options[:input_file_path].nil?       ? 'input/entrada2.txt'  : $options[:input_file_path].to_s
        optimum_cost                    = $options[:optimum_cost].nil?          ? 0                     : $options[:optimum_cost].to_i
        output_header                   = $options[:output_header].nil?         ? false                 : true
        output_file                     = $options[:output_file].nil?           ? nil                     : $options[:output_file].to_s
        description                     = $options[:description].nil?           ? nil                     : $options[:description].to_s

        LongestPath.new(min_runs, max_runs, step_runs, min_ants, max_ants, step_ants, iterations,
                        initial_pheromone_amount, ant_pheromone_deposit_amount,
                        pheromone_evaporation_rate, daemon_pheromone_deposit_amount,
                        max_pheromone_threshold, min_pheromone_threshold,
                        alpha, beta, exploitation_factor, input_file_path, optimum_cost,
                        output_header, output_file, description
        )

    end

end

Main.new.execute