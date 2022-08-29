// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

contract ToDos {
    struct ToDo {
        string task;
        bool completion;
    }

    ToDo[] public todos;
}