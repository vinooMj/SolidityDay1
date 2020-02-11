pragma solidity ^0.5.0;

contract Auction{
    uint eventId;
    uint groupId;
    struct Event {
	uint256 groupId;
        string eventName;
        uint256 createdDate;
        uint256 betsOpenTimestamp;
        uint256 betsCloseTimestamp;
        string winCondition;
        bool winResult;
        uint256 houseFees;
        uint256 payoutPercentage;
        string status;
        }
        
        struct Group {
            string Name;
        }
        
        struct Wager {
            uint256 amount;
            string status;
            uint256 timestamp;
        }
        
        mapping(uint256=>Event) public events;
        mapping(uint256=>Group) public groups;
        mapping (address=>Wager) public wagers;
        
        constructor() public{
            
        }

//create group
function createGroup(string memory name) public returns (uint256) {            
  groups[++groupId] = Group(name);
  return groupId;
}

//create event
function createEvent(uint256 groupId, string memory eventName, uint256 createdDate, uint256 betsOpenTimestamp, uint256 betsCloseTimestamp,string memory winCondition,bool winResult, uint256  houseFees, uint256 payoutPercentage, string memory status) public returns (uint256) {
events[++eventId] = Event(groupId, eventName, createdDate, betsOpenTimestamp, betsCloseTimestamp, winCondition, winResult, houseFees, payoutPercentage, status);
   return eventId;
}

function createWager(address id, uint256 amount, uint256 timestamp, string memory status ) public returns (bool) {
   wagers[id] = Wager(amount,status, timestamp);
   return true;
}

function modifyEventStatus(uint256 eventId, string memory status) public returns (bool) {
events[eventId].status = status;
return true;
}

function modifyWagerStatus(address wagerAddr, string memory status) public returns (bool) {
   wagers[wagerAddr].status = status;
   return true;
}

function getWager(address addr) public view returns(uint256, string memory, uint256) {
   return (wagers[addr].amount, wagers[addr].status, wagers[addr].timestamp);
}

}
