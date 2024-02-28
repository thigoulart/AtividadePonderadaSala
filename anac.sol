// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Anac {
    uint idade; //variável idade de estado ao contrato
    address private owner; //variável que irá armazenar o endereço do dono do contrato

    event IdadeAlterada(uint novaIdade);//Evento que informa a nova idade colocada

    constructor() { 
        owner = msg.sender; //Definindo que o owner será a carteira que deployará o contrato
        idade = 18; //Considerando que por padrão uma instância deste contrato é de uma pessoa com 18 anos de idade
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can perform this action");//função para que seja somente executadas pelo dono do contrato
        _;
    }

    // Função para definir a idade, apenas o proprietário do contrato pode chamar esta função
    function setIdade(uint256 _novaIdade) public onlyOwner {
        idade = _novaIdade;
        emit IdadeAlterada(idade);
    }

    // Função para obter a idade
    function getIdade() public view returns (uint256) {
        return idade;
    }
}
