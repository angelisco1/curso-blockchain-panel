// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Balances {
    function getBalance(address _direccion) external view returns (uint) {
        return _direccion.balance;
    }
}