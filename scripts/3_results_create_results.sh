#!/usr/bin/env bash

awk -f 0_select_columns.awk -v "cols=Alpha,Beta,Execution Total Time,Best solution" ../results/results1_entrada1_alphabeta > ../results/results2_clean_entrada1_alphabeta
awk -f 0_select_columns.awk -v "cols=Alpha,Beta,Execution Total Time,Best solution" ../results/results1_entrada2_alphabeta > ../results/results2_clean_entrada2_alphabeta
awk -f 0_select_columns.awk -v "cols=Alpha,Beta,Execution Total Time,Best solution" ../results/results1_entrada3_alphabeta > ../results/results2_clean_entrada3_alphabeta


awk -f 0_select_columns.awk -v "cols=Exploitation factor,Execution Total Time,Best solution" ../results/results1_entrada1_exploitation_factor > ../results/results2_clean_entrada1_exploitation_factor
awk -f 0_select_columns.awk -v "cols=Exploitation factor,Execution Total Time,Best solution" ../results/results1_entrada2_exploitation_factor > ../results/results2_clean_entrada2_exploitation_factor
awk -f 0_select_columns.awk -v "cols=Exploitation factor,Execution Total Time,Best solution" ../results/results1_entrada3_exploitation_factor > ../results/results2_clean_entrada3_exploitation_factor

awk -f 0_select_columns.awk -v "cols=Ants,Execution Total Time,Best solution" ../results/results1_entrada1_ants > ../results/results2_clean_entrada1_ants
awk -f 0_select_columns.awk -v "cols=Ants,Execution Total Time,Best solution" ../results/results1_entrada2_ants > ../results/results2_clean_entrada2_ants
awk -f 0_select_columns.awk -v "cols=Ants,Execution Total Time,Best solution" ../results/results1_entrada3_ants > ../results/results2_clean_entrada3_ants
