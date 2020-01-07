pragma solidity ^0.5.12;
import "./safeMethod.sol";

contract ErcSample{
    
    string public name;
    string public symbol;
    uint256 public  decimals;
    uint256 totalsupply;
    using SafeMath for uint256;
    
    mapping(address=>uint256)balances;
    mapping(address=>mapping(address=>uint256))allowed;
    
    event Transfer(address from,address to,uint256 value);
    event Approval(address fromindex, address spend, uint256 value);
    
    constructor()public{
        name = "apache";
        symbol = "TVS";
        decimals = 16;
        totalsupply = 10 ** uint256(decimals);
        balances[msg.sender] = totalsupply;
    }
    
    
    function totalsupplyer() public view returns(uint256){
        return totalsupply;
    }
    
    function balanceOf(address _address) public view returns(uint256){
        return balances[_address];
    }
    
    function transfer(address from, address to, uint256 value) public returns(bool success){
       // require(balances[msg.sender<0],"Ballance is zero");
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[to] = balances[to].add(value);
        emit Transfer(msg.sender,to, value );
        return true;
        
        
    }
    
    function approval(address spend, uint256 value) public returns(bool success){
        allowed[msg.sender][spend] = value;
        emit Approval(msg.sender,spend,value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public  returns(bool success){
        balances[from] = balances[from].sub(value);
        allowed[msg.sender][from] = allowed[from][msg.sender].sub(value);
        balances[to] = balances[to].add(value);
        return true;
    
}

function allowance(address from,address spender) public view returns (uint256){
    return allowed[from][spender];
}



    
    
    
    
}
