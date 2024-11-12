# Understanding Bitcoin Halving

The POSIX shell script `halving.sh` contains all the logic
needed to compute Bitcoin halving data in following format
per line:

    <block> <subsidy> <year>

For example:

    5670000         37 2116

Read it like this: From block `5670000` the subsidy will be `37` satoshi
and it should happen approximately in year `2116`.

The `sum-sats.sh` and `sum-total.sh` scripts process the output of
`halving.sh`.

Examples:

    $ ./sum-sats.sh
    2099999997690000
    $ ./sum-total.sh 
    99.99999989%

So eventually there will be almost 21 million bitcoin.
One bitcoin is one hundred million satoshi.

1 BTC = 100 000 000 sat

Not a single satoshi will ever disappear\*. The transaction
fees are mined by the miners and recycled this way. When
the subsidy will be 0, the miners will get _only_ the fees
paid by Bitcoin users in the transactions (a.k.a. reward).

\* There is actually a possibility that the miner
will not issue a coinbase transaction or will ask for less
than what they could (see first link in the end).
And there is a possibility the coins are burned in
a provable way using `OP_RETURN`.

Transactions live in a pool (called `mempool` because it
sits in the memory of every Bitcoin node) and the miners
choose the highest-fee transactions when they are mining
a new block. The low-fee transactions could be forgotten
if mempool gets so big that even the user with the largest
memory will reach their limit and start forgetting low-fee
transactions.


## Links

 * https://en.bitcoin.it/wiki/Controlled_supply
 * https://blog.amberdata.io/why-the-bitcoin-supply-will-never-reach-21-million
 * https://medium.com/amberdata/why-the-bitcoin-supply-will-never-reach-21-million-7263e322de1
 * https://www.makeuseof.com/bitcoin-remove-21-million-coin-limit/
 * https://finematics.com/bitcoin-halving-explained-code-analysis/
 * https://bitcoinik.com/bitcoin-halving-code-explained/
 * [listedreserve article](https://www.listedreserve.com/education/transactions-and-the-bitcoin-money-supply/)
