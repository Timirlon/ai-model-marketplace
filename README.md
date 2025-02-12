# Blockchain-Based AI Model Marketplace

## Assignment 4 - Blockchain Technologies 1

### Overview
This project is a blockchain-based AI Model Marketplace where users can buy and sell AI models using an ERC-20 token. It integrates functionalities developed in previous assignments, including an [ERC-20 smart contract](https://github.com/Timirlon/blockchain-4/blob/main/contracts/MyToken.sol) and an [AI model marketplace](https://github.com/Timirlon/blockchain-4/blob/main/contracts/AIModelMarketplace.sol), into a single product.

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
- Ethereum test network access 

### Steps
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/Timirlon/blockchain-4
   ```
2. **Install Dependencies:**
   ```sh
   npm install
   ```
3. **Start the Frontend:**
   ```sh
   npm start
   ```
4. **Interact with the Marketplace:**
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
This project is designed for academic purposes only and is not intended for commercial use and licensed under MIT license.

