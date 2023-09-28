// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers } = require("hardhat");

async function main() {
  const _token_address = "0x84f12061bf69e3Bec670F3fE08Ef95Eb52570497";

  const Bunn_ico = await ethers.deployContract("BUNN_ICO", [_token_address]);

  await Bunn_ico.waitForDeployment();

  console.log(`BUNN ICO deployed to ${Bunn_ico.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
