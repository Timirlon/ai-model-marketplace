// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIModelMarketplace {
    struct Model {
        string name;
        string description;
        uint256 price;
        address payable creator;
        uint8 ratingSum;
        uint8 ratingCount;
    }

    Model[] public models;
    mapping(uint256 => address[]) public buyers;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function listModel(string memory name, string memory description, uint256 price) public {
        require(price > 0, "Price must be greater than zero");
        models.push(Model(name, description, price, payable(msg.sender), 0, 0));
    }

    function purchaseModel(uint256 modelId) public payable {
        require(modelId < models.length, "Invalid model ID");
        Model storage model = models[modelId];
        require(msg.value >= model.price, "Insufficient payment");

        buyers[modelId].push(msg.sender);
        model.creator.transfer(msg.value);
    }

    function rateModel(uint256 modelId, uint8 rating) public {
        require(modelId < models.length, "Invalid model ID");
        require(rating >= 1 && rating <= 5, "Rating must be between 1 and 5");
        require(isBuyer(modelId, msg.sender), "Only buyers can rate");

        Model storage model = models[modelId];
        model.ratingSum += rating;
        model.ratingCount += 1;
    }

    function withdrawFunds() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    function getModelDetails(uint256 modelId) public view returns (
        string memory name,
        string memory description,
        uint256 price,
        address creator,
        uint8 averageRating
    ) {
        require(modelId < models.length, "Invalid model ID");
        Model storage model = models[modelId];
        uint8 avgRating = model.ratingCount == 0 ? 0 : model.ratingSum / model.ratingCount;
        return (model.name, model.description, model.price, model.creator, avgRating);
    }

    function isBuyer(uint256 modelId, address user) internal view returns (bool) {
        for (uint i = 0; i < buyers[modelId].length; i++) {
            if (buyers[modelId][i] == user) {
                return true;
            }
        }
        return false;
    }
}
