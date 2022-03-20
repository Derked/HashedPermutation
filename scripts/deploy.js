const { ethers } = require("hardhat");

const deploy = async () => {
  const originalLength = 10_000;
  const factory = await ethers.getContractFactory("TestShuffle");
  const contract = await factory.deploy(originalLength);
  await contract.deployed();
  console.log(contract.address);
};

deploy();
