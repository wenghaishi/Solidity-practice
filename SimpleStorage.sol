// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    //boolean, uint, int, address, bytes
   
   uint256 public favoriteNumber;

    mapping (string => uint256) public nameToFavotiteNumber;

    struct People {
       uint256 favoriteNumber;
       string name;
   }

   People[] public people;

   function addPerson(string memory _name, uint256 _favoriteNumber) public {
       people.push(People(_favoriteNumber, _name));
       nameToFavotiteNumber[_name] = _favoriteNumber;
   }

   function store(uint256 _favoriteNumber) public virtual {
       favoriteNumber = _favoriteNumber;
   }

   function retrieve() public view returns(uint256) {
       return favoriteNumber;
   }
}
