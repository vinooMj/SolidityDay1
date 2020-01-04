pragma solidity ^0.5.12;
import "./safeMethod.sol";

contract Ticketing{
    
     
    
    struct ticket{
        uint256 ticketId;
        string  name;
        address[] ticketCreater;
    }
       
        
        address[] public ticketReceiver;
        
        mapping(address=>mapping(address=>uint256)) banks;
        mapping(address=>uint256) balances;
        mapping(address=>ticket) ticketes;
        mapping(address=>mapping(address=>uint256))banker;
        
        event Transfer(address _from, address _to, address _value);
        event TransferTicket(address _from, address _to, address _ticketId);
        event Approval(address _owner, address _spender, address _value);
        event TicketCreat(address ticketCreater, uint256 ticketId,string _name);
       using SafeMath for uint256;


    constructor() public {
       ticketCreater = msg.sender;
        
    }
    
    // check balance
    function balanceOf(address owner) public view returns (uint balance) {

        return balances[msg.sender];

    }
    
    // create ticket
    function createTicket(address ticketCreater, uint256 ticketId, string memory _name) public returns(bool success){
        
        ticketes[ticketId] = ticket(msg.sender,ticketId,_name);
        emit TicketCreat(msg.sender, ticketId, _name);
        return true;
        
    }
    
    // Transfer ticket to another
    function ticketTransfer(address to, uint ticketId) public returns (bool success) {
        
        
        ticketes[msg.sender] = ticket[msg.sender].send(ticketId);
        
        // to.transfer(ticketId);
        emit TransferTicket(msg.sender, to, ticketId);
        
        return true;

    }
    
    // transfer amount
    
    function transfer( uint256 ticketId, address to, uint256 value ) public returns(bool success){
        balances[msg.sender] = balances[msg.sender].Safemath.sub(value);
        balances[to] = balances[to].Safemath.add(value);
        emit Transfer(msg.sender,to,value);
        return true;
    }

     // give access  to third man to pay the amount
     
    function approve(uint256 ticketId,address spender, uint256 value) public returns(bool success){
        banks[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
        
    }
    
    //once your ticket is resolved you can give do approve. 
    
    function doApprove(uint256 ticketId, address spender, address to ) public returns(bool success){
        return true;
    }
    
    // transfer the amount once get approved by applicant
    
    function transferfrom(address from, address to, uint256 value) public returns(bool success){
        balances[from] = balances[from].Safemath.sub(value);
        banks[from][msg.sender] = banks[from][msg.sender].Safemath.sub(value);
        balances[to] = balances[to].Safemath.add(value);
        emit Transfer(from,to,value);
        return true;
    }
    
    
    
    
    
    }
    
    
    
    
    
