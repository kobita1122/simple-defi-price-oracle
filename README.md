# Simple DeFi Price Oracle

This repository demonstrates how to integrate high-quality, decentralized price data into your smart contracts using Chainlink Data Feeds. 

## Overview
In DeFi, relying on a single exchange for price data (a centralized oracle) is a massive security risk. This project uses Chainlink's decentralized network of nodes to fetch the "Aggregated Price," ensuring your contract is resistant to flash loan attacks and price manipulation.

## Features
- **Real-time Pricing:** Fetch ETH/USD and other pairs directly on-chain.
- **Safety Checks:** Includes validation for stale data and negative prices.
- **Gas Efficient:** Read-only calls that don't cost gas when queried by off-chain clients.

## Implementation Details
The contract interfaces with the `AggregatorV3Interface` provided by Chainlink. It is designed to be "plug-and-play" for any EVM-compatible chain (Ethereum, Polygon, Arbitrum, etc.) by simply changing the feed address.
