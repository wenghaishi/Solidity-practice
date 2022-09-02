// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract ToDos {
    uint256 taskCount = 0;
    struct Task {
        uint id;
        string content;
        bool completion;
    }

    Task[] public task;

    mapping(uint => Task) public tasks;

    function newTask(string memory _task) public {
        taskCount++;
        tasks[taskCount] = Tas