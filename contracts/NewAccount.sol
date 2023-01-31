//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.4.19;

contract NewBankAccount {

    address private owner;
    mapping(address => uint) balances;

    constructor() {
        owner = (msg.sender);
    }

    function deposit() public payable {
        require(msg.value > 0);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public{
        require(balances[msg.sender] >= amount);
        require(amount > 0);
        payable(msg.sender).transfer(amount);
        balances[msg.sender] -= amount;
    }

    function balanceOf(address account) public view returns (uint) {
        return balances[account];
    }
}

// This contract has three main functions: deposit(), withdraw(), and balanceOf().
// -The deposit function allow the user to deposit ether to the contract by calling the function and
// sending the ether to the contract address.
// -The withdraw function allows the user to withdraw a specified amount of ether from the contract, 
// as long as the user has that much ether in their account.
// -The balanceOf function allow to know the balance of the address provided.

// This is a simple example and should not be used in production as is, as it does not have any security features
// such as contract pausing and restriction to certain addresses, among other things.