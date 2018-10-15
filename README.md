# Blockchain Crash Course

## Intro

Cryptocurrency and blockchain technology are hot right now but there's still a lot of confusion about what they are and how they work.

## Cryptocurrency characteristics? (ask)
  > possible responses
  - DISTRIBUTED *
  - anonymous (?)
  - uses blockchain
  - has miners
  - fault tolerant
  - cryptography (?)
  - secure (?)
  - tamper proof
      - IMMUTABLE *
  - impartial
  - doesn't rely upon on centralized authority
      - TRUSTLESS *

-----

Bitcoin was created to solve a simple problem: how do you make financial transactions **TRUSTLESS**. The traditional approach to conducting transactions between entities that don't trust each other is to employ the services of a powerful, _neutral_, 3rd party such Wells Fargo or PayPal.

In short, banks have a digital [ledger](https://en.wikipedia.org/wiki/Ledger) (call on someone to explain what a ledger is) that is modified when a transaction occurred. I buy a coffee, the number next to my name reduces by $2.50 and I sleep easy. By participating in this system we implicitly trust the good will of these companies to accurately report how much money we have.

Bitcoin's creator, Satoshi Nakamoto, solves the **TRUSTLESS financial transaction** problem by replacing the centralized ledger with a decentralized ledger, AKA a blockchain. A decentralized ledger is distributed, anyone who wants to interact with this ledger must possess a complete copy of it.

1. how does this ledger get updated?
1. why should we trust it?

## Byzantine Generals’ Problem

There have been a number of distributed currencies before Bitcoin but these all failed because of the Byzantine Generals’ Problem.

**Premise**
- a city is surrounded by a group of generals, each commanding a portion of the Byzantine army.
- the generals must decide when to attack -- a half-hearted attack would surely fail so consensus is paramount.
- the armies are widely dispersed around the city and therefore must send couriers to communicate.
- the couriers are vulnerable to interception and replacement by impostor couriers from the city with forged messages.
- some of the generals are traitors and will not attack at the agreed upon time.

Solving this problem requires a consensus protocol.

> Consensus protocol - the system by which distributed ledgers are kept in sync while avoiding exploitation.

In case of the Byzantine Generals the "ledger" is merely a document that contains details about when the attack will occur.

### how might one approach this problem?
> possible responses
- encrypt messages(?)
    - fails b/c the traitorous generals would have access to the key

### proof of work
Let's apply the consensus protocol that bitcoin uses, proof of work, to the Byzantine Generals’ Problem.

POW describes a time intensive process for constructing messages. A crucial feature of these messages is that one can quickly confirm whether POW was used to construct it.


#### How does POW work?
In reality it is a simply procedure that involves hashing. Who can explain what a [hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function) does?

> A hash function takes any text input and outputs an apparently random hex value. Hash functions are chaotic which means that they are deterministic but incredibly hard to predict, that is to say, a small change in input results in a large change in output. Hashes can be generated very quickly.

To use POW
1. first agree upon some hash condition such as the first 5 characters of the hash must be 0 in order to be valid.
1. Then you take whatever message you want to send and append some random text (the nonce) and hash it.
1. If the resultant hash fails to meet the agreed criteria, you pick a new nonce and try again.
1. Repeat until you succeed.
1. You then send the message and the nonce. The recipient only has to hash your message + the nonce to see if the message is legitimate.

#### POW in the Byzantine Generals' Problem

If the generals use POW to send messages and one gets intercepted and forged the recipient general will immediately know the message is counterfeit b/c the hash won't match the agreed criteria.

To counter this the city might decide to employ POW themselves to produce forged the messages, however this is impractical if the generals employ a very specific strategy.

1. General B receives and verifies a message from General A. `"Let us attack Thr! ~ A. 0xA3A5E567BB1"`
1. They compose a response.  `"Nay. Fri is better! ~ B. 0x0FF8E23E12B" `
1. Then they combine the messages and hunt for a valid nonce for this new message.
```
"Let us attack Thr! ~ A. 0xA3A5E567BB1
Nay. Fri is better! ~ B. 0x0FF8E23E12B
0x1B5E76A009"
```
In total, General B has to spend time finding 2 nonces. One to validate their message and one to validate the combined messages. This strategy can be continued with many message which creates chains of trust. The longer the message chain the higher the trustworthiness. In order for the city or any one traitorous general to corrupt this chain convincingly they would need to re-perform every POW hash in the entire chain before the chain grew longer which, practically, requires a majority of the participants to pull off. Since the city and the traitorous generals are in the minority any attempts to abrade the integrity of the message chain will fail.

As should be obvious by now, the generals are using a blockchain to coordinate their attack.

### Bitcoin
Now that we understand how and why POW operates and the connection to blockchains let's connect it back to Bitcoin. In reality the people who want to modify the blockchain, e.g. they want to record a transaction, are not the people who perform POW. Instead, a number of transactions are bundled into blocks and miners fight to be the first to find the nonce for that block. Once one does they are rewarded by the system with Bitcoin and everyone else immediately starts searching for the nonce of the next block. Since the network doesn't sync instantaneously sometimes two miners solve the same block at almost the same time. Each of the nearby miners add this block to their chain and start mining the next one. Eventually the information will percolate through the network and nodes will realize that there are two competing version of the blockchain with different heads. As we saw in the Byzantine Generals Problem the chain with more verified blocks is accepted as truth and the transactions confirmed in the shorter blockchain must be added to the transaction queue.

## Consensus Protocols

POW uses a huge amount of resources in real life, namely electricity, which has environmental impacts. Luckily there are other consensus protocols which have a lighter footprint.

**Does anyone know about any other consensus protocols?**
* Proof of Stake
    - One's odds of creating a block are proportional to the amount coins in the system you own. This avoids a 51% attack b/c it would be disadvantageous for someone heavily invested in the system to undermine its integrity.
* proof of Activity
    - mix between PoW and PoS
* Proof of Burn
    - the more coins you destroy the higher chance you will be chosen to mine a block and be rewarded by the system. Over time your stake decays and you have to destroy more coin.
* Proof of Capacity
    - the more harddrive space you lease out to the network the higher your chances of creating a block
* Proof of Elapsed Time
    - PoW is an elaborate and expensive way to create a message authentication procedure with the properties we discussed in the BGP. Intel made special chips which attempt to guarantee a fair lottery drawing of block creation at a fraction of the electrical cost.

_reference_: https://www.coindesk.com/short-guide-blockchain-consensus-protocols/

## Final Thoughts
From the [Byzantine Generals Problem](https://en.wikipedia.org/wiki/Byzantine_fault_tolerance) we can see that no currency exists, encrypted or otherwise. This is b/c while our contemporary understanding of _cryptocurrency_ requires a blockchain, **blockchains** do not require cryptocurrency, inherently. Cryptocurrency is nothing more than a clever mechanism introduced to help incentivize a blockchain's adoption and motivate its users to continually invest resources propping it up. In other words, blockchains invent money to pay for the support of their own infrastructures.

## Misc topics
- forking
- 51% attack
- [Ethereum](https://www.ethereum.org/) / smart contracts
- tokens (ERC20, ERC721)
- [IPFS](https://ipfs.io/)
  - filecoin

