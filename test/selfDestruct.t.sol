// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {EtherGame,AttackEtherGame} from "../src/SelfDestruct.sol";

contract EthBankExploitTest is Test {
    address private constant alice = address(1);
    address private constant bob = address(2);
    address private constant attacker = address(3);
    EtherGame private game;
    AttackEtherGame private exploit;

    function setUp() public {
        game = new EtherGame();

        deal(alice, 1e18);
        vm.prank(alice);
        game.play{value: 1e18}();

        deal(bob, 1e18);
        vm.prank(bob);
        game.play{value: 1e18}();

        deal(attacker, 10 * 1e18);
        exploit = new AttackEtherGame(EtherGame(address(game)));

        vm.label(address(game), "EtherGame");
        vm.label(address(exploit), "AttackEtherGame");
    }

    function test_pwn() public {
        vm.prank(attacker);
        exploit.attack{value: 10 * 1e18}();

        deal(alice, 1e18);
        vm.expectRevert("Game is over");
        vm.prank(alice);
        game.play{value: 1e18}();
    }
}
