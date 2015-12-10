#!/usr/bin/env bash
#Optimal Alpha 1
#Optimal Beta 4
#Optimal Ants 200
#Optimal Exploitation Factor  0.2
ruby ../main.rb --min_runs 30 --max_runs 30 --step_runs 30 --min_ants 200 --max_ants 200 --step_ants 200 --iterations 100 --initial_pheromone_amount 20.0 --ant_pheromone_deposit_amount 1.0 --pheromone_evaporation_rate 0.25 --daemon_pheromone_deposit_amount 2 --max_pheromone_threshold 100.0 --min_pheromone_threshold 0,001 --alpha 1 --beta 4 --exploitation_factor 0.2 --input_file_path ../input/entrada1.txt --optimum_cost 0 --output_file ../output/1_best_parameters.txt --description best_parameters