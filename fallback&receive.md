FALLBACK & RECEIVE SOLIIDTY

Fallback and receive functions in solidity are triggered on low level calls for sending ether to a smart contract that may or may not contain data that doesn't match
any function signature in the smart contract.

These two may seem similar but are solely different in terms of handling incoming transactions to a smart contract.

Below are some scenarios where fallback and receive are called explicitly.

1. Low level Call ⇒ calldata = empty, value = empty ⇒ triggers fallback

2. Low level Call ⇒ calldata = empty, value = non-empty ⇒ triggers receive 
Note: if receive did not exist, then fallback would have been triggered.

3. Low level Call ⇒ calldata = non-empty, value = non-empty ⇒ triggers fallback 
Note: if fallback was not declared as payable call would have been reverted.

4. Low level Call ⇒ calldata = non-empty, value = empty ⇒ triggers fallback

It is always advised to implement a receive payable function to receive ether into a smart contract and keep the fallback function separate to handle all non-matching
function calls. This will help avoid confusion and the risk of potential vulnerabilities.
