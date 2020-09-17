pragma solidity ^0.4.25;

contract  SelfDestruct{
    address owner;
    address[] participant;
    uint participantId =0;
    
    constructor() public{
        owner = msg.sender;
    }
    
   
 //destroyed the contract and send ethers to other address
 function Selfdestructs ( address addr) public {
     require(owner == msg.sender, "should be owner");
 selfdestruct ( addr) ;
 }
 }
