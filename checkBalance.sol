pragma solidity ^0.5.10;


contract test3 {
   mapping (address=>uint32) balance;
    function setBalance(uint32 bal,address to) public returns (uint32){
        balance[to] = bal + balance[];
        return balance[to];
     }
     function getBalance(address to) public view returns(uint32){
         return balance[to];
     }
    }
