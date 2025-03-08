# Blockchain-Based AI Model Marketplace

## Assignment 4 - Blockchain Technologies 1

### Overview
This project is a blockchain-based AI Model Marketplace where users can buy and sell AI models using an ERC-20 token. It integrates functionalities developed in previous assignments, including an [ERC-20 smart contract](https://github.com/Timirlon/blockchain-4/blob/main/contracts/MyToken.sol) and an [AI model marketplace](https://github.com/Timirlon/blockchain-4/blob/main/contracts/AIModelMarketplace.sol), into a single product. Now, users are provided with possibility of purchasing AI models and even listing their own on our platform using our very own token - EATKN.

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
- **Deployment:** [thirdweb.com]()

# Demo screenshots
![unavailable](https://github.com/Timirlon/blockchain-4/blob/main/media/demo1.png)
![unavailable](https://github.com/Timirlon/blockchain-4/blob/main/media/demo2.png)
![unavailable](https://github.com/Timirlon/blockchain-4/blob/main/media/demo3.png)
![unavailable](https://github.com/Timirlon/blockchain-4/blob/main/media/demo4.png)
![unavailable](https://github.com/Timirlon/blockchain-4/blob/main/media/token.png)

## How to Run the Project

### Prerequisites
- Node.js and npm installed
- Metamask extension added to the browser
- EATKN tokens on your Metamask wallet balance are required for functions to work properly

### Steps
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/Timirlon/ai-model-marketplace
   ```
2. **Install Dependencies:**
   ```sh
   npm install
   ```
3. **Launch server locally:**
   ```sh
   npx http-server -p 3000
   ```
4. **Interact with the Marketplace:**
   - Connect Metamask wallet.
   - View AI models.
   - Purchase models using ERC-20 tokens.
   - List new models for sale.

## References
- Thirdweb deployment - thirdweb.com

## Contributors
- Temirlan Turgimbayev
- Amirkhan Turgimbayev

## License 
This project is designed for academic purposes only and is not intended for commercial use. Licensed under MIT License.

