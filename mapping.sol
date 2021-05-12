pragma solidity ^0.4.0;

contract exampleMapping {
    mapping(address => uint) public balances;

    function update(uint balanceNew) {
        balances[msg.sender] = balanceNew;
    }
}

contract userMapping {
    function f() returns (uint) {
        exampleMapping m = new exampleMapping();
        m.update(100);
        return m.balances(this);
    }
}
