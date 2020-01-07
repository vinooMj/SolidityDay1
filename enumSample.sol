pragma solidity ^0.5.12;

contract Enum{
    
    enum State{Waiting, Ready, Activate
    }
    State public state;
    
    constructor() public{
    state = State.Waiting;    
    }
    
    function login()public{
        state = State.Activate;
    }
    
    function isActive()public view returns(bool){
        return state == State.Activate;
        
    }
}
