// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Mapping {
    mapping (address => uint256) myMap;
    function set(address _addr, uint256 _i) public {
        myMap[_addr] = _i;
    }

    function get(address _addr) public view returns(uint256){
        return myMap[_addr];
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }
}