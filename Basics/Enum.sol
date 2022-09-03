// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract enum {
    enum DrinkSize{}
        small,
        medium,
        large
    }

    DrinkSize choice;
    DrinkSize constant defaultChoice = DrinkSize.medium;

    function setLarge() public {
        choice = DrinkSize.large;
    }

    function getChoice() public returns(DrinkSize) {
        return choice;
    }

    function getDefault() public returns(DrinkSize) {
        return defaultChoice;
    }
}