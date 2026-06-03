// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PaymentGateway {
    address public owner;

    event PaymentReceived(address indexed payer, uint256 amount, string _reference);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function pay(string memory _reference) external payable {
        require(msg.value > 0, "Payment amount must be greater than 0");
        emit PaymentReceived(msg.sender, msg.value, _reference);
    }

    receive() external payable {
        emit PaymentReceived(msg.sender, msg.value, "Direct Transfer");
    }

    function withdrawAll() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds available to withdraw");
        
        payable(owner).transfer(balance);
        emit FundsWithdrawn(owner, balance);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
