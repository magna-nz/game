// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NoirepTechGame is Ownable {
    enum GamePhase { ContractInitialized, Entered, Claimed, Ended }
    IERC20 public crepToken;
    GamePhase phase;

    // whitelist on contract creation.
    // better as a mapping instead of an array so it has fast lookup (O(1))
    mapping(address => bool) public whiteList;

    // function to add more to the whitelist
    constructor(address[] memory _whiteList, address _crepToken) Ownable(msg.sender){
        crepToken = IERC20(_crepToken);

        phase = GamePhase.ContractInitialized; // This might change when I write other functions for enter/claim
        // we want to create the whitelist on contract creation
        // we will also add a function to add more to whitelist as well

        for (uint256 i = 0; i < _whiteList.length; i++){
            whiteList[_whiteList[i]] = true;
        }
    }


}