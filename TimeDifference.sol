pragma solidity ^0.5.12;

contract TimeDifference{
    
    uint256 start;
    uint256 end;
    
    function Begin()public{
        start = now;
        
    }
    
    function Destroy()public{
        end = now;
    }
    
    function calc()public returns(uint256){
        return end - start;
    }
}
