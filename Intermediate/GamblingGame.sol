// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract GamblingGame {

    uint256 currentEth;
    uint256 maxEth = 14 ether;
    address public winner;

    function deposit() public payable {
        require(msg.value == 1 ether, "Only send 1eth");
        require(currentEth < maxEth, "Max Eth reached");
        currentEth += msg.value;

        if (currentEth == maxEth) {
            winner = msg.sender;
        }

        if (msg.sender == winner) {
            claimEth();
        }
    }

    function claimEth() public {
        require(msg.sender == winner, "You did not win");
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}