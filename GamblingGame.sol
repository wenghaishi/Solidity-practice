// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

//A gambling game where players can deposit 1 eth to the pool each time. When somebody hits 14eth, he is the winner.

contract GamblingGame {

    uint256 currentEth;
    uint256 maxEth = 14;
    address public winner;

    function deposit() public payable {
        require(msg.value == 1eth, "Only send 1eth");
        currentEth += msg.value;

        if (currentEth == maxEth) {
            winner = msg.sender;
        }
    }

    function claimEth() public {
        require(msg.sender == winner, "You did not win");
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}