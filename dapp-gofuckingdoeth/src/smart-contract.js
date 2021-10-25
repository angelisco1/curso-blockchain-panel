import Web3 from 'web3';
import SmartContractJSON from './contracts/GoFuckingDoEth.json';

export const SmartContract = () => {
  const address = '0xC1562776AFBc5Fa94ED0ca85c9f7c93AB3E8B7Dc'

  if (window.ethereum) {
    window.web3 = new Web3(window.ethereum);
    window.ethereum.enable()
  } else {
    alert('Instalate metamask');
  }

  return new window.web3.eth.Contract(SmartContractJSON.abi, address);
}