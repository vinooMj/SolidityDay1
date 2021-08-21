npm i web3

node

var Web3 = require('web3');
//declare rpc address ip or use infura provider url
var web3 = new Web3('http://127.0.0.1:7545')
var contractAddress ='0x....';

//The Contract Application Binary Interface (ABI) is the standard way to interact with contracts in the Ethereum ecosystem, both from outside the blockchain and for contract-to-contract interaction.
var abi = "";

var contract = new web3.eth.Contract(abi, contractAddress);

contract.method.name().call((err, result) => 
{
console.log("name" +result);
}
)

contract.method.totalsupply().call((err, result) => 
{
console.log("name" +result);
}
)

contract.method.balanceOf().call((err, result) => 
{
console.log("name" +result);
}
)

contract.method.symbol().call((err, result) => 
{
console.log("name" +result);
}
)
