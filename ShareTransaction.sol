pragma solidity ^0.5.15;

contract Sample4{
    mapping(address=>uint32)public shares;
    
    function setShare(uint32 share) public {
        shares[msg.sender]= share;
    }
    
    function getShare(address addr)public returns(uint32){
        return shares[msg.sender];
    }
}
