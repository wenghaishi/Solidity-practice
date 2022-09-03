// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

/*Contract for a lottery game where players send 1 ether to participate.
A random winner is then picked and given the total jackpot value contributed.
*/

contract Lottery {
    address public owner;
    address payable[] public players;
    uint public jackpotValue;

    modifier onlyOwner {
        require(msg.sender == owner);
    _;
    }

    constructor() {
        owner = msg.sender;
    }

    function enterLottery() public payable {
        require(msg.value == 1 ether, "please send 1 ether");
        players.push(payable(msg.sender));
        jackpotValue += msg.value;
    }

    function getBalance() public view returns(uint256) {
        return jackpotValue;
    }

    function getPlayers() public view returns(address payable[] memory) {
        return players;
    }

    function getRandomNumber() public view returns(uint256) {
        return uint256(keccak256(abi.encodePacked(owner, block.timestamp)));
    }

    function pickWinner() onlyOwner public {

        uint index = getRandomNumber() % players.length;
        players[index].transfer(address(this).balance);
        players = new address payable[](0);
        jackpotValue = 0;
    }
}