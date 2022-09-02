// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Bank {
    struct Customer {
        uint256 id;
        string name;
        uint256 balance;
    }

    mapping (address => uint) public  CustomerId;

    Customer[] customer;
    Balance[] balance;

    function newCustomer(uint256 _id, string memory _name, uint256 _balance) public payable {
        uint id = customer.push(Customer(_id, _name, _balance)) - 1;
        emit NewCustomer(_id, _name, _balance);


    }

    function getRecord() public returns(uint256) {
        return CustomerId[msg.sender];
    }

    function deposit() public payable {
        require(getRecord() > 1, "user not in database");
        balance.customer[msg.sender] += msg.value;
    }

    function withdraw() public payable {
        require(msg.sender ==)
    }
}