pragma solidity ^0.5.0;

contract Timee{
    
    uint256 lastUpdated;
    
    function updatedtime() public{
        lastUpdated = now;
    }
    
    function fiveMinPass() public view returns (bool){
        return (now>=(lastUpdated+5 minutes));
    }
}
