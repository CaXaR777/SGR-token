// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract SolarGreen is ERC20, Ownable {
    // address payable public owner;
    // bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(
        address initialOwner
    ) ERC20("SolarGreen", "SGR") Ownable(initialOwner) {
        // owner = payable(msg.sender);
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * (10 ** decimals()));
    }

    // function _beforeTransfer(
    //     address to,
    //     uint value
    // ) internal virtual returns (bool) {
    //     require(
    //         value <= tokenSaleBalance,
    //         "Not enough tokens available for sale"
    //     );
    //     tokenSaleBalance -= value;
    //     return super.transfer(to, value);
    // }
}
