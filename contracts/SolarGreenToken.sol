// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SolarGreen is ERC20, Ownable, ERC20Burnable {
    // address payable public owner;
    // bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    // address[] public holderToken;

    constructor(
        address initialOwner
    ) ERC20("SolarGreen", "SGR") Ownable(initialOwner) {
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

// pragma solidity ^0.8.24;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// contract SolarGreen is ERC20, Ownable, ERC20Burnable {
//     uint256 public totalSupply;
//     address public ownerOfContract;
//     uint256 public _userId;

//     address[] public holderToken;

//     event Transfer(address indexed _from, address indexed _to, uint256 _value);
//     event Approval(
//         address indexed _owner,
//         address indexed _spender,
//         uint256 _value
//     );

//     mapping(address => TokenHolderInfo) public tokenHolderInfos;

//     struct TokenHolderInfo {
//         uint256 _tokenId;
//         address _from;
//         address _to;
//         uint256 _totalToken;
//         bool _tokenHolder;
//     }

//     mapping(address => uint256) public balanceOf;
//     mapping(address => mapping(address => uint256)) public allowance;

//     constructor(
//         address initialOwner
//     ) ERC20("SolarGreen", "SGR") Ownable(initialOwner) {
//         ownerOfContract = initialOwner;
//         _mint(initialOwner, 100000000 * 10 ** decimals());
//     }

//     function inc() internal {
//         _userId++;
//     }

//     function transfer(
//         address _to,
//         uint256 _value
//     ) public override returns (bool success) {
//         require(balanceOf[msg.sender] >= _value);
//         inc();

//         balanceOf[msg.sender] -= _value;
//         balanceOf[_to] += _value;

//         TokenHolderInfo storage tokenHolderInfo = tokenHolderInfos[_to];

//         tokenHolderInfo._to = _to;
//         tokenHolderInfo._from = msg.sender;
//         tokenHolderInfo._totalToken = _value;
//         tokenHolderInfo._tokenHolder = true;
//         tokenHolderInfo._tokenId = _userId;

//         holderToken.push(_to);

//         emit Transfer(msg.sender, _to, _value);

//         return true;
//     }

//     function approve(
//         address _spender,
//         uint256 _value
//     ) public override returns (bool success) {
//         allowance[msg.sender][_spender] = _value;
//         emit Approval(msg.sender, _spender, _value);
//         return true;
//     }

//     function transferFrom(
//         address _from,
//         address _to,
//         uint256 _value
//     ) public override returns (bool success) {
//         require(_value <= balanceOf[_from]);
//         require(_value <= allowance[_from][msg.sender]);

//         balanceOf[_from] -= _value;
//         balanceOf[_to] += _value;

//         allowance[_from][msg.sender] -= _value;

//         emit Transfer(_from, _to, _value);

//         return true;
//     }

//     function getTokenHolderData(
//         address _address
//     ) public view returns (uint256, address, address, uint256, bool) {
//         return (
//             tokenHolderInfos[_address]._tokenId,
//             tokenHolderInfos[_address]._to,
//             tokenHolderInfos[_address]._from,
//             tokenHolderInfos[_address]._totalToken,
//             tokenHolderInfos[_address]._tokenHolder
//         );
//     }

//     function getTokenHolder() public view returns (address[] memory) {
//         return holderToken;
//     }

//     function mint(address to, uint256 amount) public onlyOwner {
//         _mint(to, amount * (10 ** decimals()));
//     }
// }
