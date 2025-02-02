//SPDX-License-identifier: MIT

pragma solidity ^0.8.1;

contract ItemOne {

    function add(int a, int b) public  pure returns (int) {
        return a + b;
    }

    function minus(int a, int b) public  pure returns (int) {
        return a - b;
    }

    function multiply(int a, int b) public  pure returns (int) {
        return a * b;
    }

    function divide(int a, int b) public  pure returns (int) {
        return a / b;
    }
    
}

