// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HolaMundo {

    int8 public num1 = 4;

    function holaMundo() public pure returns (string memory) {
        string memory holamundo = "Hola mundo!";
        return holamundo;
    }

    function resta(int8 n1, int8 n2) private view returns (int8) {
        return n1 - n2 + num1;
    }

    function restaNums(int8 n1, int8 n2) public view returns (int8) {
        return resta({n1: n2, n2: n1});
    }
}