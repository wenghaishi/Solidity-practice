// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Array {

    uint[] public arr;

    function remove(uint256 _index) public {

        require(_index < arr.length, "index out of bound");
        for (uint i = _index; i < arr.length - 1; i ++) {
            arr[_index] = arr[_index + 1];
        }
        
        arr.pop();

    }

}