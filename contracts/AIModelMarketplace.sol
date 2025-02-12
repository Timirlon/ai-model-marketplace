// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
}

contract AIModelMarketplace {
    IERC20 public token;
    address public owner;
    
    struct Model {
        uint id;
        string name;
        string description;
        uint256 price;
        address seller;
        string modelLink;
        bool sold;
    }

    uint public modelCount;
    mapping(uint => Model) public models;

    event ModelListed(uint id, string name, uint256 price, address seller);
    event ModelPurchased(uint id, address buyer, uint256 price);
    event ModelDeleted(uint id, address seller);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier onlySeller(uint _id) {
        require(models[_id].seller == msg.sender, "Not the model seller");
        _;
    }

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
        owner = msg.sender;
    }

    // Seller lists a model
    function listModel(
        string memory _name,
        string memory _description,
        uint256 _price,
        string memory _modelLink
    ) external {
        require(_price > 0, "Price must be greater than zero");

        modelCount++;
        models[modelCount] = Model(modelCount, _name, _description, _price, msg.sender, _modelLink, false);
        
        emit ModelListed(modelCount, _name, _price, msg.sender);
    }

    // Buyer buys a model
    function buyModel(uint _id) external {
        Model storage model = models[_id];
        require(model.id > 0, "Model does not exist");
        require(!model.sold, "Model already sold");

        // Check if buyer has approved enough tokens to the contract
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= model.price, "Not enough allowance for purchase");

        // Check if buyer has enough tokens
        uint256 buyerBalance = token.balanceOf(msg.sender);
        require(buyerBalance >= model.price, "Insufficient token balance");

        // Transfer tokens from the buyer to the seller
        bool success = token.transferFrom(msg.sender, model.seller, model.price);
        require(success, "Token transfer failed");

        model.sold = true;
        emit ModelPurchased(_id, msg.sender, model.price);
    }

    // Get model details
    function getModel(uint _id) external view returns (string memory, string memory, uint256, address, string memory, bool) {
        Model memory model = models[_id];
        return (model.name, model.description, model.price, model.seller, model.modelLink, model.sold);
    }

    // Get the token balance of a user
    function getTokenBalance(address _user) external view returns (uint256) {
        return token.balanceOf(_user);
    }

    // Seller can delete an unsold model
    function deleteModel(uint _id) external onlySeller(_id) {
        Model storage model = models[_id];
   //     require(!model.sold, "Model already sold");
        
        delete models[_id];
        emit ModelDeleted(_id, msg.sender);
    }
}
