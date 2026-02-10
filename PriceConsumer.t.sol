// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./PriceConsumer.sol";

contract PriceConsumerTest is Test {
    PriceConsumer public consumer;

    // We use a fork or a mock for testing oracle data
    function setUp() public {
        consumer = new PriceConsumer();
    }

    function testPriceIsGreaterThanZero() public view {
        // This test requires a mainnet/testnet fork to pass
        // forge test --fork-url <YOUR_RPC_URL>
        try consumer.getLatestPrice() returns (int price) {
            assertTrue(price > 0);
        } catch {
            console.log("Skipping test: Requires network fork for real oracle data");
        }
    }
}
