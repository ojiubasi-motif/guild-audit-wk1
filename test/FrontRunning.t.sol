// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;
pragma experimental ABIEncoderV2;

import {Test, console} from "forge-std/Test.sol";
import {RaffleGame} from "../src/FrontRunning.sol";

contract RaffleTest is Test {
    RaffleGame raffleGame;
    uint256 entranceFee = 1e18;
    address playerOne = address(1);
    address playerTwo = address(2);
    address playerThree = address(3);
    address FrontrunnerPlayer = address(7);
    uint256 duration = 30 seconds;

    function setUp() public {
        raffleGame = new RaffleGame(entranceFee, duration);
    }

    function testEnterRaffle() public {
        address[] memory players = new address[](4);
        players[0] = FrontrunnerPlayer;
        players[1] = playerOne;
        players[2] = playerTwo;
         players[3] = playerThree;
        raffleGame.enterRaffle{value: entranceFee * 4}(players);
        assertEq(raffleGame.players(0), FrontrunnerPlayer);
        assertEq(raffleGame.players(1), playerOne);
        assertEq(raffleGame.players(2), playerTwo);
        assertEq(raffleGame.players(3), playerThree);
    }

    function testFrontrunnerCanWithdrawDuringWinnerSelection() public {
        uint256 balanceBefore = address(FrontrunnerPlayer).balance;
        uint256 indexOfFrontrunner = raffleGame.getActivePlayerIndex(
            FrontrunnerPlayer
        );
        uint256 raffleEnd = block.timestamp + duration;

        vm.warp(block.timestamp + duration + 1);
        vm.roll(block.number + 1);

        vm.prank(FrontrunnerPlayer);
        raffleGame.refund(indexOfFrontrunner); //frontrunner withdraws before raffle ends
        uint256 balanceAfterRefund = address(FrontrunnerPlayer).balance;

        assert(block.timestamp < raffleEnd); //the selection process is still ongoing

        raffleGame.selectWinner();
        assertEq(raffleGame.previousWinner(), playerThree); //the winner is not the frontrunner
        assert(balanceAfterRefund > balanceBefore);
    }

}
