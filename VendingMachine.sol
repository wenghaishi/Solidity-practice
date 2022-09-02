// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract VendingMachine {
    address public owner;
    mapping (address => uint) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    modifier _ownerOnly() {
        require(msg.sender == owner);
        _;
    }

    function getVendingMachineBalance() public view returns(uint256) {
        return donutBalances[address(this)];
    }

    function restock(uint256 _amount) public _ownerOnly {
        donutBalances[address(this)] += _amount;
    }

    function purchase(uint _amount) public payable {
        require(msg.value == _amount * 1 ether, "You must pay 2 ether per donut");
        require(donutBalances[address(this)] >= _amount, "out of stock");
        donutBalances[address(this)] -= _amount;
        donutBalances[msg.sender] += _amount;
    }
    
}