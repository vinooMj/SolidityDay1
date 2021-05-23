pragma solidity >=0.4.16 <0.8.0;

library checkContract {
   function isContract(address acc) internal view returns (bool) {
       
        uint256 size;
        
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}
