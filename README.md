# GameCoin DApp

This project is a decentralized application (DApp) for a strategy game that uses a blockchain-based game currency called Game Coin (GC). The application includes a smart contract implemented in Solidity, and a frontend for user interaction using Web3.js.

## Project Description

In this project, you will create a smart contract and a frontend application to manage game currency on the Ethereum blockchain. The Game Coin (GC) is an ERC-20 token that players can buy, sell, and transfer within the game. The use of blockchain technology ensures that the game's currency system is fair and tamper-proof.

## Features

### Smart Contract (ERC-20)

- **Register User**: Allows users to register with a username, email, and bio.
- **Get User Info**: Retrieve information about a user by their account address.
- **Buy Game Coin (GC)**: Users can buy Game Coin using ETH.
- **Sell Game Coin (GC)**: Users can sell Game Coin to receive ETH.
- **Transfer Game Coin (GC)**: Users can transfer Game Coin to another address.
- **Send to Owner**: Allows the owner to retrieve Game Coin from the contract.
- **Set Rates**: The owner can set the buy and sell rates for Game Coin.

### Frontend

- **Registration and Authorization**: Users can register and authorize using their MetaMask account.
- **Account Information and Balance**: Displays the user's account information and balances.
- **Buy/Sell Game Coin**: Users can buy and sell Game Coin for ETH.
- **Transfer Game Coin**: Users can transfer Game Coin to another address.
- **Sign Out**: Users can sign out from the application.

## Prerequisites

- MetaMask extension for your browser.
- Sepolia test network.
- Basic understanding of Solidity, Ethereum, and JavaScript.

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/namazbekzhan/game-coin.git
   cd game-coin

**Install dependencies:**

   ```bash
      npm install



**Deployment:**
Configure the deployment environment:
Update the config.js file with your desired contract address and network details.
Deploy the smart contract:

 ```bash
npm run deploy


Running the Frontend:
Start the development server:

 ```bash
npm run start


Access the application in your browser at http://localhost:3000
Usage:
  Connect your MetaMask wallet to the application
  Interact with the smart contract functions through the user interface:
  Register a new user profile
  Buy, sell, and transfer GC tokens
  View account information and GC balance
Testing:
   Unit tests for the smart contract are included in the test directory.
  Manual testing of the frontend functionalities is recommended.
License:
  MIT License
Authors:
  Namazbek Bekzhanov

