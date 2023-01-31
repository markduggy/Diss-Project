//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

// This is the contract for a simple savings account that earns interest.
contract SavingsAccount {
    // The account balance.
    uint256 public balance;

    // The interest rate, expressed as a percentage.
    uint256 public interestRate;

    // The last time the interest was calculated.
    uint256 public lastInterestTimestamp;

    // The minimum balance required to earn interest.
    uint256 public minBalance;

    // The constructor sets the initial balance, interest rate, and minimum balance.
    constructor (uint256 _balance, uint256 _interestRate, uint256 _minBalance){
        balance = _balance;
        interestRate = _interestRate;
        lastInterestTimestamp = block.timestamp;
        minBalance = _minBalance;
    }

    // The deposit function allows the owner to add funds to the account.
    function deposit(uint256 amount) public {
        balance += amount;
    }

    // The withdraw function allows the owner to remove funds from the account.
    function withdraw(uint256 amount) public {
        // Make sure there are enough funds to withdraw.
        require(balance >= amount, "Insufficient balance");
        balance -= amount;
    }

    // The calculateInterest function calculates and adds the interest earned since the last calculation.
    function calculateInterest() public {
        // Make sure the balance is above the minimum required to earn interest.
        require(balance >= minBalance, "Balance too low to earn interest");

        // Calculate the time elapsed since the last interest calculation.
        uint256 elapsedTime = block.timestamp - lastInterestTimestamp;

        // Calculate the amount of interest earned.
        uint256 interest = (balance * interestRate * elapsedTime) / (365 * 24 * 60 * 60);

        // Add the interest to the balance.
        balance += interest;

        // Update the last interest calculation timestamp.
        lastInterestTimestamp = block.timestamp;
    }
}