# SimplePayment - Smart Contract Suite

A production-ready Solidity smart contract deployed on the **Arc Network Testnet**. This project serves as a secure, decentralized payment gateway enabling direct payer-to-merchant transactions, alongside utility tools for managing onchain fund flows.

---

## 🚀 Deployed Contract Address

- **PaymentGateway Contract:** `0xAbd514B4aA7f9A09C71b138D7EF66D0ad345d075`
- **Network:** Arc Testnet

---

## ✨ Features

- **Direct Native Payments:** Efficient customer-to-merchant onchain transaction capabilities.
- **Owner Control:** Out-of-the-box security modifiers (`onlyOwner`) ensuring only the contract deployer can handle administrative tasks.
- **Secure Fund Withdrawal:** Simplified `withdrawAll()` mechanics to safely transfer collected contract balances directly to the owner.
- **Fallback Support:** Built-in `receive()` function to automatically handle and log direct ad-hoc native asset transfers.

---

## 🛠️ Smart Contract Architecture

The main gateway is governed by `PaymentGateway.sol`, built using **Solidity ^0.8.20**.

### Core Functions:
1. `pay(string memory _reference)`: Accepts native testnet tokens and triggers a `PaymentReceived` event tagged with a unique reference string.
2. `withdrawAll()`: Standard administrative function ensuring the contract owner can safely retrieve accumulated funds.
3. `getBalance()`: A lightweight read-only view function returning the current contract balance.

---

## 💻 Tech Stack

- **Language:** Solidity (^0.8.20)
- **Ecosystem:** Arc Network (Agentic & Financial Infrastructure)
- **Development Tooling:** Remix / Hardhat
