const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("check to see if the struct is updateing ", () =>{
    let owner,addr1,addr2;
    let counter = 0;

    beforeEach(async () =>{
const Deploy1 = await ethers.getContractFactory("HMS")
const deploy2 = await Deploy1.deploy();
await  deploy2.deploy();
        [owner,addr1,add2] = await ethers.getSigners();
    })

    it("struct updating ", async () =>{

        const obj = {
        name: "david",
        age: 5,
        occupation: "student",
        home: addr2
        };
        const tx = await deploy2.setRecord(obj);
        console.log(tx);

    });
});