pragma solidity ^0.4.11;

contract Time{
    
    function Time_call() returns (uint256){
        return block.number; 
    }
}
