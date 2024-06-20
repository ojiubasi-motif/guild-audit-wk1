// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Address} from "@openzeppelin/contracts/utils/Address.sol";

contract RaffleGame {
    using Address for address payable;

    uint256 public immutable entranceFee;

    address[] public players;
    uint256 public raffleDuration;
    uint256 public raffleStartTime;
    address public previousWinner;

    constructor(
        uint256 _entranceFee,
        uint256 _raffleDuration
    ) {
        entranceFee = _entranceFee;
        raffleDuration = _raffleDuration;
        raffleStartTime = block.timestamp;
    }

    function enterRaffle(address[] memory newPlayers) public payable {
        require(
            msg.value == entranceFee * newPlayers.length,
            "PuppyRaffle: Must send enough to enter raffle"
        );
        for (uint256 i = 0; i < newPlayers.length; i++) {
            players.push(newPlayers[i]);
        }

        // Check for duplicates
        for (uint256 i = 0; i < players.length - 1; i++) {
            for (uint256 j = i + 1; j < players.length; j++) {
                require(
                    players[i] != players[j],
                    "PuppyRaffle: Duplicate player"
                );
            }
        }
        // emit RaffleEnter(newPlayers);
    }

    function refund(uint256 playerIndex) public {
        address playerAddress = players[playerIndex];
        require(
            playerAddress == msg.sender,
            "PuppyRaffle: Only the player can refund"
        );
        require(
            playerAddress != address(0),
            "PuppyRaffle: Player already refunded, or is not active"
        );

        payable(msg.sender).sendValue(entranceFee);

        players[playerIndex] = address(0);
    }

    function getActivePlayerIndex(
        address player
    ) external view returns (uint256) {
        for (uint256 i = 0; i < players.length; i++) {
            if (players[i] == player) {
                return i;
            }
        }
        return 0;
    }

    function selectWinner() external {
        require(
            block.timestamp >= raffleStartTime + raffleDuration,
            "PuppyRaffle: Raffle not over"
        );
        require(players.length >= 4, "PuppyRaffle: Need at least 4 players");
        uint256 winnerIndex = uint256(
            keccak256(
                abi.encodePacked(msg.sender, block.timestamp, block.difficulty)
            )
        ) % players.length;
    
    }
 
}
