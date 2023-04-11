Can you limit which NFTs you accept and which you don’t? 🎯
While it’s not possible to impose the limits on the level of an end user address, you can choose to limit what NFTs can your contract accept.

The ERC-721 standard introduced a function called “onERC721Received()”, that’s called on token receiver assuming the following conditions are met:

1️⃣ The receiver is a contract

2️⃣ The transfer was initiated using the “safeTransferFrom()” function

Now, the “onERC721Received()” function needs to return a specific predefined value - otherwise the NFT transfer is reverted.
So what information can you actually validate in your receiver contract? You can decide whether to accept the NFT or not based on different criteria:

1️⃣ Operator is the address that initiates the transfer - in other words executes “safeTransferFrom()”. Because of the approval mechanism, this can be a different
address than the actual token owner.

2️⃣ The “from” param is the actual token owner that’s about to transfer the ownership to you.

3️⃣ Token ID is probably self explanatory.

4️⃣ And finally the “data” field is an optional field that the caller can populate when they’re performing the transfer. It can be a thank you note, or even some 
arbitrary data for the receiving application. Even though in most cases it’s just empty.

5️⃣ The “onERC721Received()” function is executed by the collection contract, so that makes “msg.sender” the collection address that you can also validate against.

There’s a way for a sender to bypass this limitation, though. Comment below how you’d send NFTs to this contract even a from different collection than the “
allowedCollection”. 
