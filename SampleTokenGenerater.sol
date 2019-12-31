pragma solidity ^0.5.12;
import "./SafeMethod.sol";

contract duration{
    
    mapping(address=>uint256)balances;
    uint256 totalSupply;
    uint256 c;
    uint256 t;
    uint256 end;
    uint256 unit;
   
    
    constructor() public{
        totalSupply = 1000;
        unit = 1000%1000;
    }
    
    function setTime()public view returns(uint256){
        uint256 t = now;
        return t;
    }
    
    function getTime()public view returns(uint256){
        uint256 end = now;
        return end;
    }
    
    
     function calc(uint256 c,uint256 t,uint256 end) public  view returns(uint256){
         uint256 c = sub(end,t);
        return c;
    }
    
    function generateToken(uint256 _totalSupply, uint256 c, uint256 unit) public returns(uint256){
        
        require(c%60==0,"waiting untill one minutes");
        balances[msg.sender] = add(unit);
        balances[totalSupply] = sub(unit);
        return unit;
        
    }
        
    }
