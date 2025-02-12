# Blockchain-Based AI Model Marketplace

## Assignment 4 - Blockchain Technologies 1

### Overview
This project is a blockchain-based AI Model Marketplace where users can buy and sell AI models using an ERC-20 token. It integrates functionalities developed in previous assignments, including an ERC-20 smart contract and an AI model marketplace, into a single product.

## Features

### 1. User Authentication and Wallet Integration
- Implemented wallet connection using Metamask or similar tools.
- Users can connect their wallets to interact with the marketplace.

### 2. Token Balance Display
- Displays the user's ERC-20 token balance on the marketplace interface.
- Provides functionality to refresh the token balance.

### 3. AI Model Listings
- Shows a list of AI models available for purchase with details such as:
  - Model name
  - Description
  - Price in ERC-20 tokens
  - Seller details (wallet address)
- Allows sellers to create new listings by providing:
  - Model details
  - Price in ERC-20 tokens
  - Upload model file or access link (secure storage implemented)

### 4. Purchase Flow
- Buyers can view AI model details.
- Purchase process includes:
  - Transferring the required amount of ERC-20 tokens to the seller.
  - Updating the marketplace UI to reflect the sale (e.g., marking models as sold or adjusting inventory).

## Technologies Used
- **Blockchain:** Ethereum
- **Smart Contracts:** Solidity (ERC-20 Token + AIModelMarketplace contract) 
- **Wallet Integration:** Metamask
- **Frontend:** html, css, js
- **Backend:** Node.js, Web3js

# Demo screenshots

## How to Run the Project

### Prerequisites
- Node.js and npm installed
- Metamask extension added to the browser
- Ethereum test network access (e.g., Goerli, Sepolia)

### Steps
1. **Clone the Repository:**
   ```sh
   git clone <repository_url>
   cd blockchain-ai-marketplace
   ```
2. **Install Dependencies:**
   ```sh
   npm install
   ```
3. **Start the Frontend:**
   ```sh
   npm start
   ```
4. **Deploy Smart Contracts (if not already deployed):**
   - Use Hardhat or Truffle to deploy the ERC-20 token and marketplace smart contracts.
   ```sh
   npx hardhat run scripts/deploy.js --network goerli
   ```
5. **Interact with the Marketplace:**
   - Connect Metamask.
   - View AI models.
   - Purchase models using ERC-20 tokens.
   - List new models for sale.

## Future Improvements
- Implement additional security features for transactions.
- Optimize gas fees for smart contract operations.
- Enhance UI/UX for a better user experience.

## Contributors
- Temirlan Turgimbayev
- Amirkhan Turgimbayev

## License 
This project is for academic purposes and is not intended for commercial use and licensed under MIT license.

