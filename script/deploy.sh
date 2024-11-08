#!/bin/bash

# Set your private key here
export PRIVATE_KEY="YOUR_PRIVATE_KEY"
export RPC_URL="YOUR_RPC_URL"

# Deploy the contract
forge create --rpc-url $RPC_URL --private-key $PRIVATE_KEY src/VotingDAO.sol:VotingDAO
