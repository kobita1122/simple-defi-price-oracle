// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/**
 * @title PriceConsumer
 * @dev High-quality implementation for fetching secure asset prices.
 */
contract PriceConsumer {
    AggregatorV3Interface internal dataFeed;

    /**
     * Network: Sepolia
     * Aggregator: ETH/USD
     * Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     */
    constructor() {
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    /**
     * @notice Returns the latest price with safety checks.
     * @return price The current asset price with 8 decimals.
     */
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = dataFeed.latestRoundData();

        // Safety Checks
        require(price > 0, "Invalid price data");
        require(timeStamp != 0, "Round not complete");
        require(answeredInRound >= roundID, "Stale price data");

        return price;
    }
}
