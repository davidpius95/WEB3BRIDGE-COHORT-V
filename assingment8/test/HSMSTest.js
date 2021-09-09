const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("check to see if the struct is updateing ", () =>{
    let owner,addr1,addr2,addr3,addr4;
    let counter = 0;
    let deploy2

    beforeEach(async () =>{
    [owner,addr1,addr2,addr3,addr4] = await ethers.getSigners();

const Deploy1 = await ethers.getContractFactory("HMS")
const deploy2 = await Deploy1.deploy();
await  deploy2.deployed();
 await deploy2.SetRecord("david",5,"student",addr1.address.toString(),addr2.address.toString())
    
    });

    it("struct updating ", async () =>{

const C = await deploy2.hospitalCheck(addr4.address);
console.log(C)
       const B = await deploy2.readRecord(addr3.address.toString())
       console.log(B)
        // const obj = {
        // name: "david",
        // age: 5,
        // occupation: "student",
        // home: addr2
        // };
        // const tx = await deploy2.setRecord(obj);
        // console.log(tx);

    });
});