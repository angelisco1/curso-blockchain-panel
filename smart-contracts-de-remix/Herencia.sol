// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Contador {
    uint public cuenta;

    constructor(uint _cuentaInicial) {
        cuenta = _cuentaInicial;
    }

    function incrementar() external returns (uint) {
        cuenta++;
        return cuenta;
    }
}

contract ContadorDecremento is Contador {
    constructor(uint _cuentaIni) Contador(_cuentaIni) {}

    function decrementar() external returns (uint) {
        cuenta--;
        return cuenta;
    }
}