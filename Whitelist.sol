pragma solidity ^0.8.0;

contract Whitelist{
    mapping(address => bool)public whitelist;

    function addWhitelist(address _address)public{
        whitelist[_address] = true;
    }

    function removeFromWhitelist(address _address)public{
        whitelist[_address] = false;
    }
}
