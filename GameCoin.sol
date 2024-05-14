// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameCoin is ERC20, Ownable {
    uint256 public sellRate = 10; // Example: 1 GC = 0.001 ETH
    uint256 public buyRate = 6;   // Example: 1 GC = 0.00125 ETH

    mapping(address => User) private users;

    struct User {
        string username;
        string email;
        string bio;
    }

    constructor() ERC20("Namazbek's Token", "NB") Ownable(msg.sender){
        _mint(msg.sender, 1000 * 10**decimals()); // Mint initial supply
    }

    function registerUser(string memory username, string memory email, string memory bio) public {
        require(bytes(username).length > 0, "Username must not be empty");
        require(bytes(email).length > 0, "Email must not be empty");
        users[msg.sender] = User(username, email, bio);
    }

    function getUserInfo(address account) public view returns (string memory, string memory, string memory) {
        User memory user = users[account];
        return (user.username, user.email, user.bio);
    }

    function buy(uint256 gcAmount) public payable {
        uint256 requiredETH = (gcAmount * sellRate) / 10**decimals();
        require(msg.value == requiredETH, "Incorrect ETH amount sent");
        _mint(msg.sender, gcAmount); // Mint the correct amount of GC
    }

    function sell(uint256 gcAmount) public {
        uint256 ethAmount = (gcAmount * buyRate) / 10**decimals();
        require(balanceOf(msg.sender) >= gcAmount, "Insufficient NB balance");
        _burn(msg.sender, gcAmount);
        payable(msg.sender).transfer(ethAmount);
    }

    function send(address to, uint256 gcAmount) public {
        _transfer(msg.sender, to, gcAmount);
    }

    function sendToOwner(uint256 amount) public onlyOwner {
        _transfer(msg.sender, owner(), amount);
    }

    function setRates(uint256 _sellRate, uint256 _buyRate) public onlyOwner {
        sellRate = _sellRate;
        buyRate = _buyRate;
    }

    receive() external payable {}
}
