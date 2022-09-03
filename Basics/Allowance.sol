// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Allowance {
    mapping (address => mapping (address => uint256)) public allowance;

    function get(address _addrOwner, address _addrSpender) public view returns(uint256) {
        return allowance[_addrOwner][_addrSpender];
    }

    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    }


}