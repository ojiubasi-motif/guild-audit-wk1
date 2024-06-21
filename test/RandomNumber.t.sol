// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {GuessTheRandomNumber, AttackRandomnes} from "../src/RandomnessManipulation.sol";

contract ManipulateRandomness is Test {
    GuessTheRandomNumber private randomNumber;
    AttackRandomnes private manipulateRandom;

    function setUp() public {
        randomNumber = new GuessTheRandomNumber();
        vm.deal(address(randomNumber), 1e18);
        manipulateRandom = new AttackRandomnes(address(randomNumber));//use only when u instantiated the vulnerable contract in the attacker constructor
    }

    function testRandomNumberManipulation() public {
        uint256 balanceBeforeAttack = address(manipulateRandom).balance;
        console.log("the balance before=>", balanceBeforeAttack);
        manipulateRandom.attack();
        uint256 balanceAfterAttack = address(manipulateRandom).balance;
        console.log("the balance after attack=>", balanceAfterAttack);
        assertEq(balanceBeforeAttack, 0);
        assertEq(balanceAfterAttack, 1e18);
    }
}
