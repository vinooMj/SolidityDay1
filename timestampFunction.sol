contract Time{
    
    function f(uint start, uint daysAfter) public returns(uint256) {
    if (block.timestamp >= start + daysAfter * 1 days) { 
        
        uint256 t = block.timestamp;
    }
}


// using now

contract Time{

function t() public returns(uint256){
return now;
}
