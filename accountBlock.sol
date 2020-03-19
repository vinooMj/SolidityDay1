contract Blocked {
    
    mapping(address => bool) public blocked;
    
  
    function blockAccount(address account) public onlyOwner {
      blocked[account] = true;
  }
  
  
  function unblockAccount(address account) public onlyOwner {
      blocked[account] = false;
  }
  
  modifier isNotBlocked(address reciever) {
        require(!blocked[msg.sender]);
        require(!blocked[reciever]);
        _;
    }
}
