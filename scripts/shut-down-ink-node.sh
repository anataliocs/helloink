#!/bin/bash
set -e

printf "\nKilling all local ink! node processes"
printf "\n------------------------- \n"

printf "\nThis script searches for ink node and eth rpc processes running on port 9944 and performs a kill 9 on each pid"

printf "\n------------------------- \n"

printf "\nPrinting output from command: %s \n" "lsof -i :9944"

lsof -i :9944

#Getting ink! node process IDs and eth rpc v process IDs
printf "\nExtracting ink-node process ids..."
printf "\n------------------------- \n"

ink_node_pids=$(lsof -i :9944 | grep -oE 'ink-node-\s[0-9]{4,5}' | sed 's/ink-node-[[:space:]]//g' | xargs echo -n)
eth_rpc_v_pids=$(lsof -i :9944 | grep -oE 'eth-rpc-v\s[0-9]{4,5}' | sed 's/eth-rpc-v[[:space:]]//g' | xargs echo -n)

printf "Found ink nodes running on the following process ids: %s \n" "$ink_node_pids"

printf "Found eth rpc nodes running on the following process ids: %s \n" "$eth_rpc_v_pids"

printf "\nExecuting command: %s for each pid \n" "kill -9"

#kill ink! node processes
kill -9 $ink_node_pids
kill -9 $eth_rpc_v_pids

