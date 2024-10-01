# Voting Contract

## Overview

This Solidity contract implements a simple voting system where an owner can register voters, and registered voters can cast their votes. The contract keeps track of registered voters and their voting status.

## Features

- **Owner Control**: Only the owner can register voters.
- **Voter Registration**: Allows new voters to register with their details.
- **Voting Functionality**: Registered voters can cast their votes.
- **Tracking**: Keeps track of total voters and votes cast.

## Contract Structure

### State Variables

- `address public owner`: The owner of the contract.
- `uint public noOfVoters`: Total number of registered voters.
- `uint public voteCount`: Total number of votes cast.

### Structs

- `struct VotersInfo`: Contains information about each voter:
  - `uint voteID`: Unique ID for the vote.
  - `address voterAddress`: The voter's Ethereum address.
  - `string voterName`: The voter's name.
  - `uint age`: The voter's age.
  - `uint hasVoted`: Indicates if the voter has voted (0 = no, 1 = yes).

### Mappings

- `mapping(address => VotersInfo) public votersInfo`: Stores information for each registered voter.
- `mapping(address => uint) public registeredVoters`: Indicates if an address is registered (1 = registered).
- `mapping(address => uint) public votedVoters`: Indicates if an address has voted (1 = voted).

## Functions

### Constructor

- `constructor()`: Initializes the contract and sets the owner to the address that deploys the contract.

### Register Voter

- `function register(address _voterAddress, string memory _voterName, uint _age, uint _voteID) external`: 
  - Allows the owner to register a new voter.
  - **Parameters**:
    - `_voterAddress`: Address of the voter.
    - `_voterName`: Name of the voter.
    - `_age`: Age of the voter (must be 18 or older).
    - `_voteID`: Unique vote ID.
  - **Reverts**:
    - If the caller is not the owner.
    - If the voter is already registered.
    - If the owner tries to register themselves.
    - If the voter is under 18.

### Vote

- `function vote() external`: 
  - Allows a registered voter to cast their vote.
  - **Reverts**:
    - If the voter has already voted.
    - If the voter is not registered.

## Usage

1. **Deploy the Contract**: The owner deploys the contract.
2. **Register Voters**: The owner can call the `register` function to add new voters.
3. **Voting**: Registered voters can call the `vote` function to cast their votes.

## Important Notes

- Ensure that the Ethereum address for voting is registered before attempting to vote.
- The contract is designed to prevent double voting and self-registration by the owner.

## License

This contract is licensed under the MIT License.
