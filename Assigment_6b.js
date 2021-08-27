const Web3 = require('web3');
 const web3 = new Web3('http://localhost:8545')
 var Eth = require('web3-eth');
 const  Contract = require('web3-eth-contract');

const date = new Date();
var hash = web3.utils.hexToBytes(web3.utils.soliditySha3('this.name', 'this.time'))
// var hash = web3.utils.hexToAscii(web3.utils.soliditySha3('this.name', 'this.time'))
//var hash = web3Provider.utils.toAscii(web3.utils.soliditySha3('this.name', 'this.time'))
console.log(hash)
//web3.utils.soliditySha3('this.name', 'this.time');

const  customer = {
    name: "_name",
    time: date,
    bytes32: 'hash',
    address: 433
}


//console.log(web3.utils.sha3('234'))
// function set (_name, _date , _address){
//     this.name = _name;
//     this.time = _date;
//     this.bytes32 = _bytes32;
//     this.address = _address;
// }