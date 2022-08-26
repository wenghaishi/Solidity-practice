// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

uint256 public minumumUsd = 50 * 10 ** 18;

import "@chainlink/contracts/src/v0.6/interfaces/aggregatorv3interface.sol";

contract FundMe {
    function fund() public payable {
        require(msg.value >= minimumUsd, "didn't send enough");
    }

    function getPrice() public {
        //ABI
        //Address 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        AggregatorV3Interface priceFeed = AggrefatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int price,,,) = priceFeed.latestRoundData();
        //Eth in terms of USD
        return uint256(price * 1e10);
    }

    function getVersion() public view returns(int256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e).version();
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view return (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethPriceInUsd = (ethAmount * ethPrice) / 1e18;
        
    }
        
}