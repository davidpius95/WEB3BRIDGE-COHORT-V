const hre = require("hardhat");
async function main() {
  const Hms1 = await hre.ethers.getContractFactory("HMS");
  const HMS2 = await Hms1.deploy();

  await HMS2.deployed();
let [owner,addrs,addrss,addre] = await ethers.getSigners()
  console.log("HMS2 deployed to:", HMS2.address);
  let SetRecod = await HMS2.SetRecord("david",8,"student",addrss.address,addre.address)
 // let setrecod = await SetRecod.wait()
  console.log(SetRecod)
  const ReadRecord = await HMS2.readRecord(addrss.address.toString())
  console.log(ReadRecord)
  const check1 = await HMS2.hospitalCheck(addre.address)
  console.log(check1)
  const del = await HMS2.del(addrss.address)
  console.log(del)
 }

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
  networks: {
    hardhat: {
      forking: {
        url: "https://eth-mainnet.alchemyapi.io/v2/https://eth-mainnet.alchemyapi.io/v2/GcxC-neAeTU3S9lx3d3gT7mKiDMJ7Owo";
      }
    }
  }
