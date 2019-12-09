pragma solidity ^0.5.0;

contract Task1{
    
    uint a;
    uint b;
    uint c;
    
    constructor(uint _a, uint _b, uint _c)public{
        uint a = _a;
        uint b = _b;
        uint c = _c;
    }
    
    function add() public view returns(uint){
        uint c= a+b;
        return c;
    }
}