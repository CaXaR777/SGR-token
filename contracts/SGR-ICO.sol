// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/manager/AccessManaged.sol";
import "./SolarGreenToken.sol";

contract TokenSale is Ownable, AccessManaged {
    using SafeERC20 for IERC20;

    IERC20 public token;
    uint public tokenPrice;
    uint public fundingGoal;
    uint public deadline;

    event TokensPurchased(address buyer, uint256 amount, uint256 cost);

    constructor(
        IERC20 _token,
        uint256 _tokenPrice,
        address initialOwner,
        address initialAuthority
    ) AccessManaged(initialAuthority) Ownable(initialOwner) {
        require(address(_token) != address(0), "Token address cannot be zero");
        require(_tokenPrice > 0, "Token price must be greater than zero");

        token = _token;
        tokenPrice = _tokenPrice;
    }

    function setTokenPrice(uint256 _newTokenPrice) external restricted {
        require(_newTokenPrice > 0, "Token price must be greater than zero");

        tokenPrice = _newTokenPrice;
    }

    function buyTokens(uint256 _amount) external payable {
        uint256 cost = _amount * tokenPrice;
        // require(msg.value == cost, "Incorrect amount of ETH provided");
        require(token.balanceOf(address(this)) >= _amount);

        token.safeTransfer(msg.sender, _amount);
        emit TokensPurchased(msg.sender, _amount, cost);
    }

    function withdrawETH() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function withdrawTokens() external onlyOwner {
        uint256 balance = token.balanceOf(address(this));
        token.safeTransfer(owner(), balance);
    }
    function getTokenBalance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }
}
