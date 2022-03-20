const { ethers } = require("hardhat");
const shuffle = require("../artifacts/contracts/TestShuffle.sol/TestShuffle.json");

const main = async () => {
  const shuffleAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const signer = await ethers.getSigner();
  const shuffleContract = new ethers.Contract(shuffleAddress, shuffle.abi, signer);

  const setSeedTx = await shuffleContract.setSeed(8);
  await setSeedTx.wait();

  const shuffledIndex = await shuffleContract.shuffle(9854);
  console.log(ethers.utils.formatUnits(shuffledIndex, "wei"));
};

main();
