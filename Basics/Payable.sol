// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract PayMe {

    address payable public Owner

    constructor() public {
        Owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == Owner, "you are not the owner");
    }
    


}