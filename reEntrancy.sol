Pragma solidity ^0.5.0;

contract EtherBank {
    
    mapping(address => uint) public balances;
    
    bool internal locked;
     //this modifier neglect the re entrancy attack
     modifier noReentrant() {
        require(!locked, "No re-entrancy");
        locked = true;
        _;
        locked = false;
    }

    function deposit() public payable  {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public noReentrant{
        require(balances[msg.sender] >= _amount);
        

        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] -= _amount;
       
    }

  
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
