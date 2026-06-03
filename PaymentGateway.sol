// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PaymentGateway {
    address public owner;

    // Payment received hobar por tracking er jonno event
    event PaymentReceived(address indexed payer, uint256 amount, string reference);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // Modifier: Shudhu owner-i jeno kichu function call korte pare
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // Client/User ekhane taka (Ether) pathate parbe ekta reference message shoho
    function pay(string memory _reference) external payable {
        require(msg.value > 0, "Payment amount must be greater than 0");
        emit PaymentReceived(msg.sender, msg.value, _reference);
    }

    // Direct contract address-e taka pathaleo jeno receive hoy
    receive() external payable {
        emit PaymentReceived(msg.sender, msg.value, "Direct Transfer");
    }

    // Contract-er sob taka shudhu owner tar wallet-e tulte parbe
    function withdrawAll() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds available to withdraw");
        
        payable(owner).transfer(balance);
        emit FundsWithdrawn(owner, balance);
    }

    // Contract-e ekhon koikataka/Ether joma ache ta check korar jonno
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
