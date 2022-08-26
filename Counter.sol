// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract counter {
    uint256 public currentNum;

    function increaseNum(uint256 _increaseNum) public {
        currentNum = currentNum + _increaseNum;
    } 

    function decreaseNum(uint256 _decreaseNum) public {
        currentNum = currentNum - _decreaseNum;
    }

    function checkNum() public view returns(uint256) {
        return currentNum;
    }
}