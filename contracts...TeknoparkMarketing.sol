// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

  /**
   * @title TeknoparkMarketing
   * @dev Marketing system
   * @custom:dev-run-script scripts/deploy_with_ethers.ts
   */


contract TeknoparkMarketing {
    address public owner;
    
    // Mapping to store information of borrowers
    mapping(address => Borrower) public borrowers;

    // Structure to store borrower information
    struct Borrower {
        string name;
        uint age;
        uint debtAmount;
    }

    // Modifier to allow only the owner to call certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Assign the deployer of the contract as the owner
    constructor() {
        owner = msg.sender;
    }

    // Grant access permission to the owner for a specific user's debt information
    function grantAccess(address userAddress) external onlyOwner {
        // You can add security checks in the implementation according to your needs
        // For example: require(isValidUser(userAddress), "Invalid user");
        // The isValidUser function can check if a specific user is registered in the system.
        // In this example, only manually granted access by the owner is accepted.
    }

    // Retrieve debt information of a specific user
    function getDebtInfo(address userAddress) external view returns (string memory, uint, uint) {
        Borrower memory borrower = borrowers[userAddress];
        return (borrower.name, borrower.age, borrower.debtAmount);
    }

    // Define debt information for a specific user
    function defineDebtInfo(address userAddress, string memory name, uint age, uint debtAmount) external onlyOwner {
        borrowers[userAddress] = Borrower(name, age, debtAmount);
    }

    // Increase the debt amount for a specific user
    function increaseDebtAmount(address userAddress, uint additionalAmount) external onlyOwner {
        borrowers[userAddress].debtAmount += additionalAmount;
    }

    // Get own debt amount for a user
    function getOwnDebtAmount() external view returns (uint) {
        return borrowers[msg.sender].debtAmount;
    }

    // Pay own debt for a user
    function payOwnDebt(uint amount) external {
        // Payment is not mandatory to cover the full debt amount; it's optional
        require(amount > 0, "Payment amount must be greater than zero");
        require(amount <= borrowers[msg.sender].debtAmount, "Payment amount exceeds the debt");
        
        borrowers[msg.sender].debtAmount -= amount;
        // Payment transactions can be handled here, for example, a bank transfer, crypto transfer, etc.
    }
}
