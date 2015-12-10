#!/usr/bin/env bash
#Optimal Alpha 2
#Optimal Beta 3
#Optimal Ants 200
#Optimal Exploitation Factor 0.1
ruby ../main.rb --min_runs 30 --max_runs 30 --step_runs 30 --min_ants 200 --max_ants 200 --step_ants 200 --iterations 100 --initial_pheromone_amount 20.0 --ant_pheromone_deposit_amount 1.0 --pheromone_evaporation_rate 0.25 --daemon_pheromone_deposit_amount 2 --max_pheromone_threshold 100.0 --min_pheromone_threshold 0,001 --alpha 2 --beta 3 --exploitation_factor 0.1 --input_file_path ../input/entrada2.txt --optimum_cost 0 --output_file ../output/2_best_parameters.txt --description best_parameters