// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CREPToken is ERC20, Ownable {
    constructor() ERC20("CREP Token", "CREP") Ownable(msg.sender){
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}