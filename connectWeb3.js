
//Web3 is a library interact with smart contract.

//install web3 module
npm i web3

node

var Web3 = require('web3');
//declare rpc address ip or use infura provider url
var web3 = new Web3('http://127.0.0.1:7545')

var address = 0X.....
web3.eth.getBalance('address', (error, wei)=>{

balance = web3.utils.fromWei(wei, 'ether')}


)
