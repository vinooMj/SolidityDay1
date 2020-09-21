

// SPDX-License-Identifier: MIT

pragma solidity 0.6.10;



abstract contract ERC20Interface {
    function totalSupply() virtual external view returns (uint256);
    function balanceOf(address tokenOwner) virtual external view returns (uint);
    function allowance(address tokenOwner, address spender) virtual external view returns (uint);
    function transfer(address to, uint tokens) virtual external returns (bool);
    function approve(address spender, uint tokens) virtual external returns (bool);
    function transferFrom(address from, address to, uint tokens) virtual external returns (bool);
    function burn(uint tokens) virtual external returns(bool success);
    
 
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Burn(address from, address, uint256 value);

    }

// ----------------------------------------------------------------------------
// Safe Math Library 
// ----------------------------------------------------------------------------
contract SafeMath {
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a, "SafeMath: subtraction overflow"); 
        c = a - b; 
        return c;
    }

    function safeMul(uint a, uint b) public pure returns (uint c){
    c = a * b;
    require(a == 0 || c / a == b, "multiplication overflow");
    }
    
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }

    
}

contract Token is ERC20Interface, SafeMath{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public _totalSupply;
    address public owner;
    uint256 public tokenPrice;
   
    mapping(address => uint) internal balances;
    mapping(address => mapping(address => uint)) internal allowed;
    mapping(uint256 => uint256) internal token;
    
    
    

    constructor() public {
        name = "TOKEN";
        symbol = "TK";
        decimals = 8;
        _totalSupply = 1000000000 * 10 ** uint256(decimals);
	    initialSupply = _totalSupply;
	    balances[msg.sender] = _totalSupply;
        owner = msg.sender;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
    
   
 
    function totalSupply() external view override returns (uint256) {
        return safeSub(_totalSupply, balances[address(0)]);
    }

    function balanceOf(address tokenOwner) external view override returns (uint getBalance) {
        return balances[tokenOwner];
    }
 
    function allowance(address tokenOwner, address spender) external view override returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
 
    function approve(address spender, uint tokens) external override returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
    
    function transfer(address to, uint tokens) external override returns (bool success) {
        require(to != address(0));
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
    
   function transferFrom(address from, address to, uint tokens) external override returns (bool success) {
        require(to != address(0));
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
   }
   
    function burn(uint tokens) external  override returns(bool success){
        require(owner == msg.sender,'This is not owner');
        balances[msg.sender] = safeSub(balances[msg.sender],tokens);
        _totalSupply = safeSub(_totalSupply,tokens);
        emit Burn(msg.sender,address(0), tokens);
        return true;
    }
    
  
    
}

contract MyToken is Token{
     uint256 public buyPrice;
     uint256 public soldToken;
     
     constructor()  payable public{
         
     }
     
      function _transfer(address _from, address _to, uint tokens) internal {
        balances[_from] -= tokens;                         
        balances[_to] += tokens; 
        _totalSupply = safeSub(_totalSupply,tokens);
        Transfer(_from, _to, tokens);
    }
    
    
    function setPrice(uint256 newBuyPrice)  public {
        require(owner == msg.sender,'This is not owner');
        buyPrice = newBuyPrice * 10 ** uint256(decimals);
    }

    
    function buy() payable public {
        require(msg.sender != address(0));
        require(msg.value > 0);
        uint tokens = safeDiv(msg.value, buyPrice); 
        soldToken += tokens;
        _transfer(owner, msg.sender, tokens);             
    }

}
