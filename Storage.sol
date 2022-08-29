// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Storage {

    uint256 number;

    function storeNum(uint256 _newNum) public {
        number = _newNum;
    }

    function viewNum() public view returns(uint256) {
        return number;
    }

    function increaseNum(uint256 _increaseBy) public {
        number = number + _increaseBy;
    }

    function decreaseNum(uint256 _decreaseBy) public {
        number = number - _decreaseBy;
    }

}