pragma solidity ^0.5.12;

contract AddUser{
    
    // array
    
    Person[] public people;
    uint256 public count;
    
    
    struct Person{
        string firstName;
        string lastName;
    }
    
    function addUser(string memory firstName, string memory lastName )public{
        people.push(Person(firstName,lastName));
        count++;
    }
    
}
