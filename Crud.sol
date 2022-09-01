// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Crude {
    struct User {
        uint id;
        string name;
    }

    User[] public users;
    uint public nextId;

    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    }

    function read(uint id) public view returns(uint, string memory) {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                return (users[i].id, users[1].name);
            }
        }
    }

    function update(uint id, string memory _name) public {
        for(uint i = 0; i < users.length; i++) {
            if(users[i].id == id) {
                users[i].name = _name;
            }
        }
    }
    function destroy(uint id) public {
        delete users[id];
    }
}