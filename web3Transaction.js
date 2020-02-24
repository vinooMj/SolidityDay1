
npm install ethereumjs-tx@1.3.3

node

var Tx = require('ethereumjs-tx')
var Web3 = require('web3');
var web3 = new Web3('https://ropsten.infura.io/v3/6c276004f9424880a009383d7f46381c');
const accountAddress = 'your address'
const privateKey1 = Buffer.from(process.env.PRIVATE_KEY_1, 'hex')
const contractAddress = 'your contract'

Web3
var abi = [{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"constant":false,"inputs":[{"internalType":"uint256","name":"groupId","type":"uint256"},{"internalType":"string","name":"eventName","type":"string"},{"internalType":"uint256","name":"createdDate","type":"uint256"},{"internalType":"uint256","name":"betsOpenTimestamp","type":"uint256"},{"internalType":"uint256","name":"betsCloseTimestamp","type":"uint256"},{"internalType":"string","name":"winCondition","type":"string"},{"internalType":"bool","name":"winResult","type":"bool"},{"internalType":"uint256","name":"houseFees","type":"uint256"},{"internalType":"uint256","name":"payoutPercentage","type":"uint256"},{"internalType":"string","name":"status","type":"string"}],"name":"createEvent","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"string","name":"name","type":"string"}],"name":"createGroup","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"id","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"timestamp","type":"uint256"},{"internalType":"string","name":"status","type":"string"}],"name":"createWager","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"events","outputs":[{"internalType":"uint256","name":"groupId","type":"uint256"},{"internalType":"string","name":"eventName","type":"string"},{"internalType":"uint256","name":"createdDate","type":"uint256"},{"internalType":"uint256","name":"betsOpenTimestamp","type":"uint256"},{"internalType":"uint256","name":"betsCloseTimestamp","type":"uint256"},{"internalType":"string","name":"winCondition","type":"string"},{"internalType":"bool","name":"winResult","type":"bool"},{"internalType":"uint256","name":"houseFees","type":"uint256"},{"internalType":"uint256","name":"payoutPercentage","type":"uint256"},{"internalType":"string","name":"status","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"addr","type":"address"}],"name":"getWager","outputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"string","name":"","type":"string"},{"internalType":"uint256","name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"groups","outputs":[{"internalType":"string","name":"Name","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"internalType":"uint256","name":"eventId","type":"uint256"},{"internalType":"string","name":"status","type":"string"}],"name":"modifyEventStatus","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"internalType":"address","name":"wagerAddr","type":"address"},{"internalType":"string","name":"status","type":"string"}],"name":"modifyWagerStatus","outputs":[{"internalType":"bool","name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"wagers","outputs":[{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"string","name":"status","type":"string"},{"internalType":"uint256","name":"timestamp","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"}]
abi


const contract = new web3.eth.Contract(abi, contractAddress)
const data = contract.methods.createGroup("cric").encodeABI()

web3.eth.getTransactionCount(accountAddress, (err, txCount) => {
  
  const txObject = {
    nonce:    web3.utils.toHex(txCount),
    gasLimit: web3.utils.toHex(3000000),
    gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei')),
    to: contractAddress,
    data:    data
  }

  
  const tx = new Tx(txObject)
  tx.sign(privateKey1)

  const serializedTx = tx.serialize()
  const raw = '0x' + serializedTx.toString('hex')

  
  web3.eth.sendSignedTransaction(raw, (err, txHash) => {
    console.log('txHash:', txHash)
    console.log('error:', err)
  })

})	








