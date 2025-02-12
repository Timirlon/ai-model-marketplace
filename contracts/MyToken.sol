// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address private owner;

    // Mapping to store transaction data
    struct Transaction {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
    }
    Transaction[] private transactions;

    constructor(uint256 initialSupply) ERC20("ErcAssToken", "EATKN") {
        _mint(msg.sender, initialSupply * 10 ** decimals());
        owner = msg.sender;
    }

    /* Outdated
    constructor() ERC20("ErcAssToken", "EATKN") {
        _mint(msg.sender, 2000 * 10 ** decimals()); // Initial supply of 2000 tokens
        owner = msg.sender;
    }
    */
    

    // Function to retrieve transaction information
    function getTransaction(uint256 index) public view returns (
        address sender,
        address receiver,
        uint256 amount,
        uint256 timestamp
    ) {
        require(index < transactions.length, "Invalid transaction index");
        Transaction memory txn = transactions[index];
        return (txn.sender, txn.receiver, txn.amount, txn.timestamp);
    }

    // Function to get the block timestamp of the latest transaction
    function getLatestTransactionTimestamp() public view returns (string memory) {
        require(transactions.length > 0, "No transactions found");
        uint256 timestamp = transactions[transactions.length - 1].timestamp;
        return _timestampToReadableFormat(timestamp);
    }

    // Function to retrieve the sender of the latest transaction
    function getLatestTransactionSender() public view returns (address) {
        require(transactions.length > 0, "No transactions found");
        return transactions[transactions.length - 1].sender;
    }

    // Function to retrieve the receiver of the latest transaction
    function getLatestTransactionReceiver() public view returns (address) {
        require(transactions.length > 0, "No transactions found");
        return transactions[transactions.length - 1].receiver;
    }

    // Override transfer function to log transactions
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        bool success = super.transfer(recipient, amount);
        if (success) {
            transactions.push(Transaction(msg.sender, recipient, amount, block.timestamp));
        }
        return success;
    }

    // Helper function to convert a timestamp to a readable format
    function _timestampToReadableFormat(uint256 timestamp) private pure returns (string memory) {
        // Basic implementation; you may use libraries like OpenZeppelin's Strings library for a more detailed approach.
        return string(abi.encodePacked("Timestamp: ", uintToString(timestamp)));
    }

    // Helper function to convert uint to string
    function uintToString(uint256 value) private pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}