pragma solidity ^0.5.15;

contract sample3{
    
    mapping(address=>uint32) public balances;
    address public owner;
    
    event ownerdetail(address acountAdd, uint32 amnt);
    
    function sample3() public{
     owner = msg.sender;
    }
    
    function deposit() public payable returns(uint32){
        require((balances[msg.sender]+msg.value)>= balances[msg.sender]);
        balances[msg.sender] += msg.value;
        ownerdetail(msg.sender, msg.value);
        return balances[msg.sender];
    } 
    
    function withdraw(uint32 withdrawAmount) public returns(uint32 remainingBalance){
        require((withdrawAmount=<balances[msg.sender]));
        
        balances[msg.sender] -= withdrawAmount
        msg.sender.transfer(withdrawAmount);
        return  balances[msg.sender];
    }
    
    function balanceCheck() view public returns(uint32){
        return balances[msg.sender];
    }
}

