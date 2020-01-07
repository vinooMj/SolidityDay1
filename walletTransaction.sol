pragma solidity ^0.5.12;

contract Walletcreation{
    
    // mapping
    mapping(address=>uint256)public balance;
    address payable wallet;
    
    constructor(address payable _wallet) public{
        wallet =_wallet;
    }
    
    // payable keyword is using for transaction between ether
    function addWallet()public payable{
        // buy token
        balance[msg.sender] += 1;
        //send ether to wallet
        wallet.transfer(msg.value);
        
    }
    
}
