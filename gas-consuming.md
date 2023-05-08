1w •

A quick-short-effective TRICK for Smart Contract developers trying to optimize their contract's bytecode size.

🪄 The Trick - 𝐑𝐞𝐩𝐥𝐚𝐜𝐢𝐧𝐠 𝐌𝐨𝐝𝐢𝐟𝐢𝐞𝐫𝐬 𝐰𝐢𝐭𝐡 𝐏𝐫𝐢𝐯𝐚𝐭𝐞 𝐅𝐮𝐧𝐜𝐭𝐢𝐨𝐧𝐬 𝐜𝐚𝐧 𝐚𝐜𝐭𝐮𝐚𝐥𝐥𝐲 𝐫𝐞𝐝𝐮𝐜𝐞/𝐨𝐩𝐭𝐢𝐦𝐢𝐳𝐞 𝐲𝐨𝐮𝐫 𝐜𝐨𝐧𝐭𝐫𝐚𝐜𝐭’𝐬 𝐛𝐲𝐭𝐞𝐜𝐨𝐝𝐞 𝐬𝐢𝐳𝐞.

there are 2 similar contracts with 3 functions with onlyOwner validations.

However, there is just one difference:
a. One of them uses a modifier to do the onlyOwner() check.
b. While the other just uses a private function to do a similar check.

Results? 🤔

👉 The bytecode size of the contract that uses Modifier is - 2324 characters
👉 However, the bytecode size of the contract that uses Private Function is just - 1804 characters

Interesting to see how this small change helped us optimize the bytecode quite effectively, isn’t it?

Let’s figure out the REASON behind this 👇
𝟏. 𝐌𝐨𝐝𝐢𝐟𝐢𝐞𝐫𝐬 𝐚𝐫𝐞 𝐞𝐱𝐩𝐚𝐧𝐝𝐞𝐝 𝐢𝐧𝐥𝐢𝐧𝐞:
➡️ When you use a modifier, Solidity copies the entire code of the modifier into every function that calls it.

➡️ In other terms, the Solidity compiler directly adds the modifier code to the function where the modifier is attached. This means that
the modifier code becomes a part of the function and is included in the 
bytecode generated for that function.

➡️ This technically means that the modifier code is replicated in every function where the modifier is used, which can increase the 
size of the contract's bytecode.

𝟐. 𝐏𝐫𝐢𝐯𝐚𝐭𝐞 𝐟𝐮𝐧𝐜𝐭𝐢𝐨𝐧𝐬 𝐚𝐫𝐞 𝐨𝐧𝐥𝐲 𝐰𝐫𝐢𝐭𝐭𝐞𝐧 𝐨𝐧𝐜𝐞:
➡️ On the other hand, a private function is only written once and can be called from multiple places in your contract without 
increasing its size.

➡️ This makes it a much more efficient way to perform checks without duplicating code.

𝘿𝙤𝙚𝙨 𝙩𝙝𝙞𝙨 𝙢𝙚𝙖𝙣 𝙮𝙤𝙪 𝙨𝙝𝙤𝙪𝙡𝙙 𝙖𝙫𝙤𝙞𝙙 𝙪𝙨𝙞𝙣𝙜 𝙈𝙤𝙙𝙞𝙛𝙞𝙚𝙧𝙨? 😱
Noooo.
Modifiers are great. I love modifiers.
They adhere to best practices and are super helpful.
You shouldn’t avoid them.

In fact, if your contract is fairly smaller and is quite below the maximum contract size threshold of 24.576 kb, modifiers shouldn’t 
even be a problem for you.

However, considering a scenario of a bulky contract where a check/validation is supposed to be used multiple times which unnecessarily 
increases your contract’s size, then 𝘂𝘀𝗶𝗻𝗴 𝗽𝗿𝗶𝘃𝗮𝘁𝗲 𝗳𝘂𝗻𝗰𝘁𝗶𝗼𝗻𝘀 𝗶𝗻𝘀𝘁𝗲𝗮𝗱 𝗼𝗳 𝗺𝗼𝗱𝗶𝗳𝗶𝗲𝗿 𝗺𝗶𝗴𝗵𝘁 𝗯𝗲 𝗯𝗲𝘁𝘁𝗲𝗿.

This can help reduce the contract's size and potentially improve its performance.

For such bulky contracts, it's completely fine to replace modifiers with private functions and save some space for any other 
imperative functions that you might want to add - (without reaching the size threshold)
