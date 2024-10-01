import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const VotingModule = buildModule("VotingModule", (m) => {
  
  const Vote = m.contract("Voting");

  return { Vote };
});

export default VotingModule;
