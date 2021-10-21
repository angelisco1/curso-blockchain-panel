// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract HelpersStrings {
    event ActualizaPos(uint pos);

    function getLengthOf(string memory a) external pure returns (uint) {
        bytes memory btStr = bytes(a);
        return btStr.length;
    }

    function concat(string memory a, string memory b) external returns (string memory) {
        bytes memory btStrA = bytes(a);
        bytes memory btStrB = bytes(b);
        string memory strConcatenado = new string(btStrA.length + btStrB.length);
        bytes memory resultado = bytes(strConcatenado);
        uint i;
        uint pos = 0;

        // a = 'hola'
        // resultado[0] = h
        // resultado[1] = o

        for (i = 0; i < btStrA.length; i++) {
            resultado[pos] = btStrA[i];
            pos++;
            emit ActualizaPos(pos);
        }

        for (i = 0; i < btStrB.length; i++) {
            resultado[pos] = btStrB[i];
            pos++;
            emit ActualizaPos(pos);
        }

        return string(resultado);

    }

    struct A {
        uint a;
    }

    function getStructs() external pure returns (A[3] memory) {
        return [A(1), A(2), A(3)];
    }

}