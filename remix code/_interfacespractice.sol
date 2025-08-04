// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Only function declarations — no implementations (function body is not allowed).

// Functions must be external.

//No constructor allowed.

//Cannot declare state variables.
 
//Can inherit from other interfaces.



// Define the interface
interface ICar {
    function startEngine() external;
    function stopEngine() external;
    function getSpeed() external view returns (uint);
}

contract Tesla is ICar {
    uint private speed;
    bool private engineOn;

    function startEngine() external override {
        engineOn = true;
        speed = 10;
    }

    function stopEngine() external override {
        engineOn = false;
        speed = 0;
    }

    function getSpeed() external view override returns (uint) {
        return speed;
    }
}
