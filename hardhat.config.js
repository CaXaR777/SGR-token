require("@nomicfoundation/hardhat-toolbox");
// require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  etherscan: {
    apiKey: process.env.ETHSCAN_PRIVATE_KEY,
  },
  networks: {
    // localhost: {
    //   url: "http://localhost:8545", // Порт может отличаться, в зависимости от вашей конфигурации
    // },
    sepolia: {
      url: process.env.ALCHEMY_API_KEY_URL,
      accounts: [process.env.SEPOLIA_PRIVATE_KEY],
    },
  },
};
