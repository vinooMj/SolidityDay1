pragma solidity ^0.5.15;

contract Sample5{
    string tokenName;

    uint32 decimal = 16;
    uint32 public totalSupply;
    address[5] public participant;
    uint32 count = 0;
    mapping(address=>uint32) public balances;
    uint32 ratio;
    
    constructor(uint32 initialSupply,string memory _tokenName)public{
        totalSupply = initialSupply;
         ratio = totalSupply/5;
        balances[msg.sender] += ratio;
        totalSupply -= ratio;
        
        }
    
    function adduser(address _add) public{
            count++;
            participant[count] = _add;
            balances[_add] += ratio;
            totalSupply -= ratio;
        }
        function getbal(address _addr) public view returns(uint32){
            return balances[_addr];
        }
        
}
