# Intro

Cryptocurrency and blockchain applications are hot right now but there's still a lot of confusion about what decentralized applications (dApps) are and they can be used. The goal of today's is to gain a less hand-wavy understanding of how blockchain technology works, what it can be/is used for, and if you stick around how to write your own smart contracts and deploy them to a local network.

Bitcoin, cryptocurrency, and blockchain are topics that everyone has heard about, read articals about, maybe some of you even own cryptocurrency. That means that there's a lot of insight in this room and I am going to call on people to share this insight so that we can all learn and explore together.

# Motivation

## What problem did Satoshi Nakamoto solve with Bitcoin?

- financial transactions between parties that don't trust each other

## How

- conduct deals publicly with lots of witnesses to corroborate your transaction

## Why is this good?

- doesn't rely on trusting corperations
    - silicon valley, banks, government
- there's lots of reasons not to trust these institutions
    - 2008 housing crash, Wallstreet
    - 2017 Equifax
    - 2018 Cambridge Analytica

## Why is this bad?

- maybe I don't want all of my transactions to be public (*venmo)
- no safety net. If your band screws up they'll hopefully fix it but it your smart contract has a bug and gets pwned you could lose everything with no recourse.
- it is astronomically difficult to undo anything on the blockchain
- not all censorship is bad (even 4chan has censorship)
    - content is effectively immune from censorship
    - imagine if reddit had no censorship
- this process consumes a lot of resources to operate

# Nuts and Bolts

- why is it "crypto" currency and not distributed-currency or blockchain-currency (other than the fact that they are less cool sounding)?
- are you really anonymous on the blockchain?


- what are miners?
  - why do they mine?
  - what's a nonce?
    - what's hashing?
    - what's a target hash?
  - how are mining ties resolved?

# Smart contracts

- we've talked about blockchain in the context of bitcoin, but how do you use blockchains to run decentralized web applications?
- limitations
  - I think about them as clockwork machines. Smart contracts can't actually do anything on their own.

Examples:
- tasks as simple as 'transfer the funds in 10 minutes' is impossible for a smart contract to do on its own.
You pull a level, it does a thing. If you really need some event to happen in the future either you need to tell the contract to do it yourself when it needs to do it or you need to implement some incentives system to convince a stranger to "pull the level" at the appropriate time.

- Store any private variables. (the blockchain is radically public)

## What can dApps do that regular apps can't

The industries that dApps are capable of disrupting are the ones whose foundations are built upon TRUST. And a new type of industry that dApps have spawned are based on DIGITAL AUTHENTICITY.

There is so much focus on the word DECENTRALIZED that it is mistaken as the new ingredient brought to the table. Decentralized has existed longer than centralized has. It's cool but not new.

things that blockchain technology brings to the table are
1. interacting safely with entities you do not trust.

Money and dApps are a match made in heaven b/c we have a digital resources traded constantly between mistrusting parties.

When asking oneself, "Would this technology benefit by migrating to a blockchain ecosystem?" If the technology deals with digital resources and the cost of a broken trust chain is high then the answer is YES.

Netflix
1. trust: Low
1. digital authenticity: NO

MySQL
1. trust: High
1. digital authenticity: NO
eg. BigChainDB

Space X
1. trust: Low
1. digital authenticity: NO

Ebay:
1. trust? High
1. digital authenticity: NO
eg. openBazaar

Macy's
1. trust: Low
1. digital authenticity: NO

Slack?
1. trust: Medium/High
1. digital authenticity: NO
eg. Status

Steam:
1. trust: High
1. digital authenticity: YES/NO

Activision:
1. trust: Low
1. digital authenticity: YES/No

## other promising applications
- IPFS
  - filecoin

## erc20 and erc721 tokens

- cryptocollectables


# why we should all be scared

- no-hand of god
  - (give examples)
  - what is "forking"?
- consequences of bugs (and bugs are inevitable)
