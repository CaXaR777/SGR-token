// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/access/manager/AccessManaged.sol";
// import "../contracts/SolarGreenToken.sol";

// contract SolarGreenSale is Ownable, AccessManaged {
//     using SafeERC20 for IERC20;

//     IERC20 public tokenContract;
//     uint256 public tokenPrice;
//     uint256 public tokensSold;

//     event Sell(address indexed buyer, uint256 amount);

//     constructor(
//         IERC20 _tokenContract,
//         uint256 _tokenPrice,
//         address initialOwner
//     ) Ownable(initialOwner) AccessManaged(initialOwner) {
//         tokenContract = _tokenContract;
//         tokenPrice = _tokenPrice;
//     }

//     function setTokenPrice(uint256 _newTokenPrice) external restricted {
//         require(_newTokenPrice > 0, "Token price must be greater than zero");

//         tokenPrice = _newTokenPrice;
//     }
//     function buyTokens(uint256 _numberOfTokens) external payable {
//         require(
//             msg.value == _numberOfTokens * tokenPrice,
//             "Incorrect ETH amount"
//         );

//         uint256 contractBalance = tokenContract.balanceOf(address(this));
//         require(
//             contractBalance >= _numberOfTokens,
//             "Not enough tokens in sale contract"
//         );

//         tokenContract.safeTransfer(msg.sender, _numberOfTokens);
//         tokensSold += _numberOfTokens;

//         emit Sell(msg.sender, _numberOfTokens);
//     }
//     function getTokenBalance() public view returns (uint256) {
//         return tokenContract.balanceOf(address(this));
//     }

//     function endSale() external onlyOwner {
//         uint256 contractBalance = tokenContract.balanceOf(address(this));
//         tokenContract.safeTransfer(owner(), contractBalance);

//         payable(owner()).transfer(address(this).balance);
//     }
// }
