require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  etherscan: {
    apiKey: ETHSCAN_PRIVATE_KEY,
  },
  networks: {
    sepolia: {
      url: ALCHEMY_API_KEY_URL,
      accounts: SEPOLIA_PRIVATE_KEY,
    },
  },
};
