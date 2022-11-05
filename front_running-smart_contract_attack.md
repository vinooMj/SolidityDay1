Let’s understand Front Running Attack using a practical example:

Suppose there is a quiz game, where 2 users can participate in the game paying $50 each. Whoever submits the correct answer first gets $100 as a reward.

1. Now, Alice and Bob participated in the game. Alice knows the answer to the given question but Bob doesn’t know it.

2. Alice submitted the correct answer paying 15 gwei as fees.

3. Meanwhile, Bob monitors the mempool for Alice’s answer. After finding Alice’s transaction with the answer, Bob submits the same but with higher gas fees (50 gwei).

4. Now, what will happen is, Miner will order Bob’s transaction before Alice as Bob paid higher fees. As a result, Alice loses the game and Bob wins the game gaining $100 despite not knowing the 
answer.
