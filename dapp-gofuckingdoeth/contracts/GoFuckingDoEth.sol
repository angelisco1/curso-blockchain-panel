// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GoFuckingDoEth {

    uint comision;
    address payable cuentaGanancias = payable(0xdD870fA1b7C4700F2BD7f44238821C26f7392148);

    struct Apuesta {
        uint id;
        bool pagado;
        string titulo;
        uint dinero;
        address payable usuario;
        address notario;
    }

    mapping(uint => Apuesta) public apuestas;
    uint[] idsApuestas;

    event ApuestaCompletada(uint _apuestaId, bool _ganada);

    constructor(uint _comision) {
        comision = _comision;
    }

    function getApuestasIds() external view returns (uint[] memory) {
      return idsApuestas;
    }

    function crearApuesta(uint _id, string memory _titulo, address _notario) external payable suficientesFondos usuarioDistintoDelNotario(_notario) {
        apuestas[_id] = Apuesta(_id, false, _titulo, msg.value, payable(msg.sender), _notario);
        idsApuestas.push(_id);
    }

    function completarApuesta(uint _id, bool _resultado) external esElNotario(_id) apuestaNoPagada(_id) {
        Apuesta storage apuesta = apuestas[_id];
        if (_resultado) {
            // Pagar al usuario
            apuesta.usuario.transfer(apuesta.dinero - comision);
        } else {
            cuentaGanancias.transfer(apuesta.dinero);
        }
        apuesta.pagado = true;
        emit ApuestaCompletada(_id, _resultado);
    }

    modifier esElNotario(uint _id) {
        require(apuestas[_id].notario == msg.sender, "Solo la puede completar el notario asignado a la apuesta");
        _;
    }

    modifier usuarioDistintoDelNotario(address _notario) {
        require(_notario != msg.sender, "No puedes ser el notario de tu propia apuesta");
        _;
    }

    modifier suficientesFondos() {
        require(msg.value > comision * 2, "Tienes que enviar una cantidad mayor a la comision: 5000");
        _;
    }

    modifier apuestaNoPagada(uint _id) {
        require(apuestas[_id].pagado != true, "No puedes completar una apuesta que ya ha sido pagada");
        _;
    }

}