# BUNN ICO Smart Contract

This repository contains the Solidity smart contract for conducting an Initial Coin Offering (ICO) for the BUNN token. The contract allows users to register for the ICO by paying a registration fee and subsequently claim their tokens after the ICO period has ended.

## Contract Details

- **Contract Name:** BUNN_ICO.sol
- **Compiler Version:** Solidity ^0.8.0
- **Dependencies:** OpenZeppelin ERC20 interface (IERC20)

## Features

- **Registration:** Users can register for the ICO by sending a minimum amount of ether.
- **Claiming:** After the ICO period has ended, registered users can claim their allocated tokens.
- **Excess Ether Refund:** Any excess ether sent during registration is automatically refunded to the user.

## Usage

To deploy and interact with the BUNN ICO smart contract, follow these steps:

1. **Install Dependencies:** Ensure you have Node.js and npm installed on your system.

2. **Clone Repository:** Clone this repository to your local machine.

   ```bash
   git clone https://github.com/your-username/bunn-ico.git
   ```

### Usage

1. **Install Dependencies:** Install the dependencies using the following command.

   ```bash
   npm install
   ```

2. **Compile Contracts:** Compile the Solidity smart contracts using Hardhat.

   ```bash
   npx hardhat compile
   ```

3. **Deploy Contract:** Deploy the smart contract to your desired Ethereum network.

4. **Interact with Contract:** Interact with the deployed contract using a tool like Hardhat, Remix, or Truffle.
