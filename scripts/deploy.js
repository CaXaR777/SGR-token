const hre = require("hardhat");
// const { ethers } = require("ethers");
// const { ethers } = require("hardhat");

// const tokens = (nToken) => {
//   return ethers.utils.parseEther(nToken);
// };

// async function main() {
//   const [deployer] = await hre.ethers.getSigners();

//   console.log("Deploying contracts with the account:", deployer.address);

//   const Token = await hre.ethers.getContractFactory("SolarGreen", deployer);
//   const token = await Token.deploy(deployer.address);

//   console.log(` SGR: ${token.address}`);

//   //ICO
//   const _tokenPrice = tokens("0.0001");
//   const ICOSGR = await hre.ethers.getContractFactory("ICOSGR", deployer);
//   const initialOwner = deployer.address;
//   const initialAuthority = deployer.address;
//   const icoSGR = await ICOSGR.deploy(
//     token.address,
//     _tokenPrice,
//     initialOwner,
//     initialAuthority
//   );

//   await icoSGR.deployed();
//   console.log(`ICOWoox: ${icoSGR.address}`);
// }

// main()
//   .then(() => process.exit(0))
//   .catch((error) => {
//     console.error(error);
//     process.exit(1);
//   });

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  const SRGCoin = await hre.ethers.getContractFactory("SolarGreen");
  const srgCoin = await SRGCoin.deploy();

  const Crowdsale = await hre.ethers.getContractFactory("Crowdsale");
  const crowdSale = await Crowdsale.deploy(
    2,
    deployer.address,
    srgCoin.address
  );

  await srgCoin
    .connect(deployer)
    .mint(crowdSale.address, hre.ethers.utils.parseEther("10000"));

  console.log("Crowdsale:", crowdSale.address);
  console.log("SGRCoin:", srgCoin.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
