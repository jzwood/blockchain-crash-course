# welcome to the introductory dApp crash course

This introductory distributed application (dApp) tutorial walks through the basics of

- writing a smart contract in Solidity
- deploying to ganache, a local test blockchain
- interacting with the contract via
	- truffle
	- metamask

all with as little boilerplate code as possible.

## setup dev environment

### prereqs

- node v8.9.4 or higher
- [Metamask](https://metamask.io) extension for either Firefox or Chrome
- these globally installed packages
  - [truffle](https://truffleframework.com) (`$ npm install -g truffle@4.1.11`)
  - [yarn](https://yarnpkg.com/en/) (`$ brew yarn`)
  - [parcel](link here) (`npm install -g parcel-bundler@1.9.3`)
  - [npx](https://www.npmjs.com/package/npx) (`$ npm i -g npx`)

### setup project root

```
$ mkdir dapp; cd dapp
$ truffle init
$ yarn init
$ yarn add -D ganache-cli@6.1.6
```

add `./truffle.js` to your project directory.
