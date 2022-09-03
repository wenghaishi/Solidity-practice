// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract AdvancedStorage {
    uint[] public ids;

    function add(uint id) public {
        ids.push(id);
    }

    function get(uint  position) view public returns(uint) {
        return ids[position];
    }

    function getAll() public view returns(uint[] memory) {
        return ids;
    }

    function length() public view returns(uint) {
        return ids.length;
    }
}