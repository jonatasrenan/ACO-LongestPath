#!/usr/bin/env bash

#Alpha & Beta

#Graphic 1) Entrada1: Alpha & Beta: Best Solution
cat ../results/results2_clean_entrada1_alphabeta | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $4/$1 ",\t" $3 ")"}' | sort | tr -d ' '  > ../results/results3_entrada1_alphabeta_best_solution

#Graphic 1) Entrada1: Alpha & Beta: Execution Time
cat ../results/results2_clean_entrada1_alphabeta | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $4/$1 ",\t" $2 ")"}' | sort | tr -d ' '  > ../results/results3_entrada1_alphabeta_execution_time

#Graphic 2) Entrada2: Alpha & Beta: Best Solution
cat ../results/results2_clean_entrada2_alphabeta | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $4/$1 ",\t" $3 ")"}' | sort | tr -d ' '  > ../results/results3_entrada2_alphabeta_best_solution

#Graphic 2) Entrada2: Alpha & Beta: Execution Time
cat ../results/results2_clean_entrada2_alphabeta | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $4/$1 ",\t" $2 ")"}' | sort | tr -d ' '  > ../results/results3_entrada2_alphabeta_execution_time

#Graphic 3) Entrada3: Alpha & Beta: Best Solution
cat ../results/results2_clean_entrada3_alphabeta | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $4/$1 ",\t" $3 ")"}' | sort | tr -d ' '  > ../results/results3_entrada3_alphabeta_best_solution

#Graphic 3) Entrada3: Alpha & Beta: Execution Time
cat ../results/results2_clean_entrada3_alphabeta | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $4/$1 ",\t" $2 ")"}' | sort | tr -d ' '  > ../results/results3_entrada3_alphabeta_execution_time

#Exploitation Factor

#Graphic 4) Entrada1: Exploitation Factor: Best Solution
cat ../results/results2_clean_entrada1_exploitation_factor | awk 'NR == 1; NR > 1 {print $0 | "sort -g -k 3,3"}' | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $2 ")"}' |  tr -d ' '  > ../results/results3_entrada1_exploitation_factor_best_solution

#Graphic 4) Entrada1: Exploitation Factor: Execution Time
cat ../results/results2_clean_entrada1_exploitation_factor | awk 'NR == 1; NR > 1 {print $0 | "sort -g -k 3,3"}' | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $1 ")"}' | tr -d ' '  > ../results/results3_entrada1_exploitation_factor_execution_time

#Graphic 5) Entrada2: Exploitation Factor: Best Solution
cat ../results/results2_clean_entrada2_exploitation_factor | awk 'NR == 1; NR > 1 {print $0 | "sort -g -k 3,3"}' | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $2 ")"}' | tr -d ' '  > ../results/results3_entrada2_exploitation_factor_best_solution

#Graphic 5) Entrada2: Exploitation Factor: Execution Time
cat ../results/results2_clean_entrada2_exploitation_factor | awk 'NR == 1; NR > 1 {print $0 | "sort -g -k 3,3"}' | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $1 ")"}' | tr -d ' '  > ../results/results3_entrada2_exploitation_factor_execution_time

#Graphic 6) Entrada3: Exploitation Factor: Best Solution
cat ../results/results2_clean_entrada3_exploitation_factor | awk 'NR == 1; NR > 1 {print $0 | "sort -g -k 3,3"}' | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $2 ")"}' | tr -d ' '  > ../results/results3_entrada3_exploitation_factor_best_solution

#Graphic 6) Entrada3: Exploitation Factor: Execution Time
cat ../results/results2_clean_entrada3_exploitation_factor | awk 'NR == 1; NR > 1 {print $0 | "sort -g -k 3,3"}' | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $1 ")"}' | tr -d ' '  > ../results/results3_entrada3_exploitation_factor_execution_time

#Ants

#Graphic 7) Entrada1: Ants : Best Solution
cat ../results/results2_clean_entrada1_ants | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $1 ")"}' | sort | tr -d ' '  > ../results/results3_entrada1_ants_best_solution

#Graphic 7) Entrada1: Ants : Execution Time
cat ../results/results2_clean_entrada1_ants | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $2 ")"}' | sort | tr -d ' '  > ../results/results3_entrada1_ants_execution_time

#Graphic 8) Entrada2: Ants: Best Solution
cat ../results/results2_clean_entrada2_ants | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $1 ")"}' | sort | tr -d ' '  > ../results/results3_entrada2_ants_best_solution

#Graphic 8) Entrada2: Ants: Execution Time
cat ../results/results2_clean_entrada2_ants | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $2 ")"}' | sort | tr -d ' '  > ../results/results3_entrada2_ants_execution_time

#Graphic 9) Entrada3: Ants: Best Solution
cat ../results/results2_clean_entrada3_ants | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $1 ")"}' | sort | tr -d ' '  > ../results/results3_entrada3_ants_best_solution

#Graphic 9) Entrada3: Ants: Execution Time
cat ../results/results2_clean_entrada3_ants | awk 'BEGIN {FS=","; OFS=","} NR>1{print "(" $3 ",\t" $2 ")"}' | sort | tr -d ' '  > ../results/results3_entrada3_ants_execution_time
