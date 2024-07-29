// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract DegenToken is ERC20, Ownable {
    struct Item {
        bool isClaimed;
        string description;
        uint cost;
       
    }

     Item[] private inventory;

    constructor() ERC20("Degen", "DGN") {
        inventory.push(Item(false, "Magic Wand", 80));    // Is Claimed: false, Description: "Magic Wand", Cost: 80 tokens
        inventory.push(Item(false, "Health Boost", 120)); // Is Claimed: false, Description: "Health Boost", Cost: 120 tokens
        inventory.push(Item(false, "Mana Potion", 60));   // Is Claimed: false, Description: "Mana Potion", Cost: 60 tokens
        inventory.push(Item(false, "Dragon Slayer Sword", 200)); // Is Claimed: false, Description: "Dragon Slayer Sword", Cost: 200 tokens
        inventory.push(Item(false, "Phoenix Feather", 250));     // Is Claimed: false, Description: "Phoenix Feather", Cost: 250 tokens
    }



    function transferTokens(address receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        approve(msg.sender, amount);
        transferFrom(msg.sender, receiver, amount);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _burn(msg.sender, amount);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

     function listStoreItems() public view returns (string memory) {
        string memory itemsList = "";

        for (uint i = 0; i < inventory.length; i++) {
            itemsList = string(abi.encodePacked(itemsList, "   [", Strings.toString(i), "] ", inventory[i].description, "\n"));
        }

        return itemsList;
    }

    function redeemTokens(uint8 index) external payable returns (string memory) {
        require(index < inventory.length, "Invalid Item Index");
        require(!inventory[index].isClaimed, "Item already claimed");
        require(balanceOf(msg.sender) >= inventory[index].cost, "Insufficient Degen Tokens");

        approve(msg.sender, inventory[index].cost);
        transferFrom(msg.sender, owner(), inventory[index].cost);
        inventory[index].isClaimed = true;

        return string(abi.encodePacked("Congratulations! You have claimed ", inventory[index].description, "!"));
    }

   

}