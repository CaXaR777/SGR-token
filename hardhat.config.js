require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  etherscan: {
    apiKey: process.env.ETHSCAN_PRIVATE_KEY,
  },
  networks: {
    sepolia: {
      url: process.env.ALCHEMY_API_KEY_URL,
      accounts: [process.env.SEPOLIA_PRIVATE_KEY],
    },
  },
};
