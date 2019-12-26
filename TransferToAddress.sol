pragma solidity 0.5.15;


contract Tranfers{
    
    uint32 decimal = 16;
    uint32 public totalSupply;
    address[] public paricipant;
    uint32 count = 0;
    mapping(address=>uint32)public balances;
    
    event trans(address _from, address _to, uint32 _share);
    constructor(uint32 initialSupply) public{
        totalSupply = initialSupply;
        
    }
    
    function adduser(address _add) public{
        count++;
        paricipant[count] = _add;
        
    }
    
    function transferShare(address _from, address _to, uint32 _share)payable public{
        //(balances[paricipant] < 0);
        require(balances[_from] > _share);
        
        //uint32 previousBalance = balances[_from] + balances[_to];
        balances[_from] -= _share;
        balances[_to] += _share;
        
        emit trans(_from,_to,_share);
        
        
    }
    
    function askBal(address _addres)view public returns(uint32){
        return balances[_addres];
    }
}
