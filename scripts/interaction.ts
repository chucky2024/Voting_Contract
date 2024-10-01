import { ethers } from "hardhat";

async function interaction(){

    const [signer,addr1] = await ethers.getSigners();

    const VotingContractAddress = "0x8347caca8A1e75a0df5c4679c95Ea874D34d3788";

    const VotingContract = await ethers.getContractAt("IVoting",VotingContractAddress);

    const address = "0x21FB08D137bB7E473b028cB8e010495451cD8cA9";
    const voterName = "Chukwuebuka";
    const age = 23;
    const voteID = 123456;

    const tx = await VotingContract.connect(signer).register(address,voterName,age,voteID);

    tx.wait();

    console.log(tx);

}

interaction();

