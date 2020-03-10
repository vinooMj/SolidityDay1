pragma solidity ^0.5.0;

contract Owned {
    address public owner;
    address public newOwner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    function Own() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
}


contract SampleERC is Owned{
    
    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint256 public decimal;
    uint256 public initialSupply;
    address[] public sold;
    uint256 public burnToken;
    uint256 public currentBal;
    uint256 public needSuply;
    
    
    mapping(address=>uint256) public balances;
    mapping(address=>mapping(address=>uint256)) allowed;
    
    event Transfer(address from, address to, uint256 value);
    event Approval(address indexFrom, address spender, uint256 value);
    event Burn(address from, address, uint256 value);
    
    constructor() public{
        name = "sample";
        symbol = "s";
        decimal = 18;
        initialSupply = 500000000;
        totalSupply = initialSupply *10**uint256(decimal);
        balances[msg.sender] = totalSupply;
        needSuply = 450000000000000000000000000;
        
        }
    
    
    function getTotalSupply() public view returns(uint256){
        return totalSupply;
    }
    
    
    function balanceOf(address tokenOwner)public view returns(uint256){
        return (balances[tokenOwner]);
    }
    
    function transfer(address from, address to, uint256 value) public returns(bool success){
        balances[from] = balances[from] - value;
        balances[to] = balances[to] + value;
        emit Transfer(from, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint256 value) public returns(bool success){
        balances[from] = balances[from]-value;
        allowed[from][msg.sender] = allowed[from][msg.sender]-value;
        balances[to] = balances[to]+value;
        emit Transfer(from,to,value);
        return true;
        
    }
    
    function approve(address spender, uint256 value) public returns(bool success){
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
    function currentBalance()public returns(uint256){
        currentBal = needSuply-balances[msg.sender];
        return currentBal;
    }
    
    function _burn(uint256 _value)public onlyOwner returns(bool success){
        require(now >= 1585699261, 'time doesnot turn');
        require(balances[msg.sender] >= _value);  
        balances[msg.sender] -= _value;           
        totalSupply -= _value;                     
        emit Burn(msg.sender,address(0), _value);
        return true;
    }
    
