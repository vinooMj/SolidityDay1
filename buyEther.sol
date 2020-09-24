pragma solidity ^ 0.5.0;

contract Buyether{
    
    mapping(address=> uint256) public balances;
    uint price;
    
    function setPrice(uint value) public returns(uint){
        return price = value;
    }
    
    function buyEther() payable public{
        balances[msg.sender] += msg.value/price;
    }
    
    function sendToken(address _recipient, uint _amount) public {
        require(balances[msg.sender]!=0); 
        balances[msg.sender]-=_amount;
        balances[_recipient]+=_amount;
    }
    
    
}
