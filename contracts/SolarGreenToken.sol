// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/manager/AccessManaged.sol";

contract SolarGreen is ERC20Capped {
    address payable public owner;
    uint8 private _decimals = 18;
    uint public tokenSaleSupply = 50000000 * (10 ** _decimals);
    uint public tokenSaleBalance;
    constructor(
        uint cap
    ) ERC20("SolarGreen", "SRG") ERC20Capped(cap * (10 ** _decimals)) {
        owner = payable(msg.sender);
        _mint(msg.sender, 100000000 * (10 ** decimals()));
        tokenSaleBalance = tokenSaleSupply;
    }

    function _beforeTransfer(
        address to,
        uint value
    ) internal virtual returns (bool) {
        require(
            value <= tokenSaleBalance,
            "Not enough tokens available for sale"
        );
        tokenSaleBalance -= value;
        return super.transfer(to, value);
    }
}
