// SPDX-License-Identifier: MIT
//we always specify the compiler version for easy compiling.
pragma solidity ^0.8.26;

    contract Voting {

       address public owner;//owner of the contract.
       uint public noOfVoters;//total number of voters.
       uint public voteCount;//total vote count.
    //a struct to store all the voter's information.
       struct VotersInfo{
                uint voteID;
                address voterAddress;//the voter's address
                string voterName;//the voter's name.
                uint age;//his age.
                uint hasVoted;
                    }

       mapping(address => VotersInfo) public votersInfo;//a mapping that stores all voters' information.
       mapping(address => uint) public registeredVoters;//to store registered voters.
       mapping(address => uint) public votedVoters;//to track voters which has already voted or not.
        //define a constructor to make the owner,msg.sender.
        constructor() {
            owner = msg.sender;

        }
    //Now create a function for registering voters having the params _voteraddress,_votername,_age.
    function register(address _voterAddress, string memory _voterName, uint _age,uint _voteID) external{
        require(msg.sender == owner,"Only owner can register voters!");
        require(registeredVoters[_voterAddress] == 0,"Already a registered voter");
        require(_voterAddress != owner,"Owners cannot register themselves!");
        require(_age >= 18,"Voter is still a toddler!");
        //creating a storage for easy updating/retrieval of voters' information.
        VotersInfo storage hmmm = votersInfo[_voterAddress] ; 

        hmmm.voterAddress = _voterAddress;
        hmmm.voterName = _voterName;
        hmmm.age = _age;
        hmmm.hasVoted = 0;
        hmmm.voteID = _voteID;
        
        registeredVoters[_voterAddress] = 1;
        noOfVoters++; //increment noOfVoters by 1 when a new voter is registered.
    }  
    //create a functon for voters to vote using the params _voterAddress.
    function vote() external {
        require(votedVoters[msg.sender] == 0,"You have already voted!"); 
        require(registeredVoters[msg.sender] == 1,"You are not a registered voter!");

         votedVoters[msg.sender] = 1;//marking when a voter voted.
        //creating a storage for easy updating/retrieval of voters' information.
        VotersInfo storage hmmm = votersInfo[msg.sender] ; 
         hmmm.hasVoted = 1;//marked as voted to update.
        voteCount++;//increment vote
       
    }

    }