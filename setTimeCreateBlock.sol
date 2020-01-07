pragma solidity ^0.5.12;

contract AddUser{
    
    // mapping
    mapping(uint256=>Person)persons;
    uint256 public count=0;
    
    // set time to create block
    uint256 time = 1578401525;
    
    // set condition to create the block greater than set time
    modifier openTime(){
        require(block.timestamp >= time);
        _;
    }
    
    
    struct Person{
        string firstName;
        string lastName;
    }
    
    function addUser(string memory firstName, string memory lastName )public openTime{
        count +=1;
        persons[count]= Person(firstName,lastName);
        
        
    }
    
}
