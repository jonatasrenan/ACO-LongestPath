#!/usr/bin/env bash

ruby ../main.rb --min_runs 1 --max_runs 1 --step_runs 1 --min_ants 20 --max_ants 200 --step_ants 20 --iterations 100 --initial_pheromone_amount 20.0 --ant_pheromone_deposit_amount 1.0 --pheromone_evaporation_rate 0.25 --daemon_pheromone_deposit_amount 2 --max_pheromone_threshold 100.0 --min_pheromone_threshold 0,001 --alpha 1 --beta 1 --exploitation_factor 0.1 --input_file_path ../input/entrada1.txt --optimum_cost 0 --output_file ../output/1_ants.txt --description num_ants

