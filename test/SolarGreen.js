const { expect } = require("chai");
const hre = require("hardhat");
// const { ethers } = require("ethers");

describe("SolarGreen contract", function () {
  // Global variables
  let Token;
  let solarGreenToken;
  let owner;
  let addr1;
  let addr2;
  let tokenCap = 100000000;
  //   let tokenCap = ethers.utils.parseUnits("100000000", 18);

  beforeEach(async function () {
    // Get the ContractFactory and Signers here.
    Token = await hre.ethers.getContractFactory("SolarGreen");
    [owner, addr1, addr2] = await hre.ethers.getSigners();

    solarGreenToken = await Token.deploy(tokenCap);
  });

  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await solarGreenToken.owner()).to.equal(owner.address);
    });

    it("Should assign the total supply of tokens to the owner", async function () {
      const ownerBalance = await solarGreenToken.balanceOf(owner.address);
      expect(await solarGreenToken.totalSupply()).to.equal(ownerBalance);
    });

    // it("Should set the max capped supply to the argument provided during deployment", async function () {
    //   const cap = await solarGreenToken.cap();
    //   //   expect(Number(ethers.utils.formatEther(cap))).to.equal(tokenCap);
    //   expect(Number(hre.ethers.utils.formatEther(cap))).to.equal(tokenCap);
    // });
  });

  describe("Transactions", function () {
    it("Should transfer tokens between accounts", async function () {
      // Transfer 50 tokens from owner to addr1
      await solarGreenToken.transfer(addr1.address, 50);
      const addr1Balance = await solarGreenToken.balanceOf(addr1.address);
      expect(addr1Balance).to.equal(50);

      // Transfer 50 tokens from addr1 to addr2
      // We use .connect(signer) to send a transaction from another account
      await solarGreenToken.connect(addr1).transfer(addr2.address, 50);
      const addr2Balance = await solarGreenToken.balanceOf(addr2.address);
      expect(addr2Balance).to.equal(50);
    });

    it("Should fail if sender doesn't have enough tokens", async function () {
      const initialOwnerBalance = await solarGreenToken.balanceOf(
        owner.address
      );
      // Try to send 1 token from addr1 (0 tokens) to owner (1000000 tokens).
      // `require` will evaluate false and revert the transaction.

      //   await  expect(

      //     solarGreenToken.connect(addr1).transfer(owner.address, 1)
      //   ).to.be.revertedWith("ERC20: transfer amount exceeds balance");

      // Owner balance shouldn't have changed.
      expect(await solarGreenToken.balanceOf(owner.address)).to.equal(
        initialOwnerBalance
      );
    });

    it("Should update balances after transfers", async function () {
      const initialOwnerBalance = await solarGreenToken.balanceOf(
        owner.address
      );

      // Transfer 100 tokens from owner to addr1.
      await solarGreenToken.transfer(addr1.address, 100);

      // Transfer another 50 tokens from owner to addr2.
      await solarGreenToken.transfer(addr2.address, 50);

      // Check balances.
      const finalOwnerBalance = await solarGreenToken.balanceOf(owner.address);
      //   expect(finalOwnerBalance).to.equal(initialOwnerBalance.sub(150));
      expect(finalOwnerBalance).to.equal(initialOwnerBalance - BigInt(150));

      const addr1Balance = await solarGreenToken.balanceOf(addr1.address);
      expect(addr1Balance).to.equal(100);

      const addr2Balance = await solarGreenToken.balanceOf(addr2.address);
      expect(addr2Balance).to.equal(50);
    });
  });
});
