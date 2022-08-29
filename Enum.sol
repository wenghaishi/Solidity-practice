// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Enum {
    enum Status {
        Pending,
        Shipped,
        Rejected,
        Approved,
        Completed
    }

    Status public status;

    function get() public view returns(Status) {
        return(status);
    }

    function change(Status _newStatus) public {
        status = _newStatus;
    }

    function reset() public {
        delete status;
    }
}