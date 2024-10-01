//SPDX-License-Identifier:MIT
pragma solidity 0.8.26;

interface IVoting{

    function register(
        address _voterAddress,
         string memory _voterName,
          uint _age,
          uint _voteID
          ) external;
}
