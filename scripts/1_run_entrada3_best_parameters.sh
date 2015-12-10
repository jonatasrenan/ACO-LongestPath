#!/usr/bin/env bash
#Optimal Alpha 1
#Optimal Beta 4
#Optimal Ants 160
#Optimal Exploitation Factor 0.2
ruby ../main.rb --min_runs 10 --max_runs 10 --step_runs 4 --min_ants 160 --max_ants 160 --step_ants 160 --iterations 100 --initial_pheromone_amount 20.0 --ant_pheromone_deposit_amount 1.0 --pheromone_evaporation_rate 0.25 --daemon_pheromone_deposit_amount 2 --max_pheromone_threshold 100.0 --min_pheromone_threshold 0,001 --alpha 1 --beta 4 --exploitation_factor 0.2 --input_file_path ../input/entrada3.txt --optimum_cost 0 --output_file ../output/3_best_parameters.txt --description best_parameters