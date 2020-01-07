pragma solidity ^0.5.12;

contract Enum{
    
    //create enum state
    enum State{Waiting, Ready, Activate
    }
    //create object to access enum
    State public state;
    
    //deploy contract with some state
    constructor() public{
    state = State.Waiting;    
    }
    
    function login()public{
        state = State.Activate;
    }
    
    //check status
    function isActive()public view returns(bool){
        return state == State.Activate;
        
    }
}
