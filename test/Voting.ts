import {time,loadFixture} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import {anyValue} from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import {expect }from "chai";
import hre, { ethers } from "hardhat";

describe ("Voting", function(){ 

    async function VotingLoadFixture(){

    const [owner,addr1,addr2] = await hre.ethers.getSigners(); 
    
    const voters = [addr1,addr2];

    const VotingContract = await hre.ethers.getContractFactory("Voting");

    const voteDeploy = VotingContract.deploy();

    return {owner, voters, VotingContract,voteDeploy};

    }

    describe("Deployment",function (){
        it("should be the   ")
    })
}); 