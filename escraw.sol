pragma solidity ^0.5.0;

contract Escrow{
    
    address agent;
    mapping(address=>uint256) public deposits;
    
    //only agent access deposite amount and withdra the amount
    modifier onlyAgent(){
        require(msg.sender == agent);
        _;
    }
    constructor()public{
        // contract owner deployer
        agent = msg.sender;
    }
    
    // use payable keyword when you  transaction with ether 
    function deposit(address payee) public onlyAgent payable{
        uint256 amount = msg.value;
        deposits[payee] = deposits[payee]+amount;
        
    }
    
    function withdraw(address payable payee) public onlyAgent {
        // amount = payee addrees amount
        uint256 payment = deposits[payee];
        deposits[payee] = 0;
        payee.transfer(payment);
    }
}
