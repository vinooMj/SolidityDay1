Pragma solidity ^0.5.15;

contract Sample1{
    
    string name="hi solidity";
    function setValue(string memory _name)public returns(memory string){
        name = _name;
        return name;
    }
    
    
    function getValue() public view returns(string){
        return name;
    }
