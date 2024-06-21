// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {ShadowingStateVariables,TestVariableShadow} from "../src/ShadowingStateVariables.sol";

contract FunctionSelectorExploitTest is Test {
    ShadowingStateVariables private shadow;
    TestVariableShadow private vartest;

    function setUp() public {
        shadow = new ShadowingStateVariables();
        vartest = new TestVariableShadow(address(shadow));

        deal(address(shadow), 25e18);

    }

    function testShadow() public {
        uint256 realBalanceOfShadowContract = address(shadow).balance;
        uint256 shadowedBalance = vartest.confirmVariableShadow();
        console.log("real bal=>",realBalanceOfShadowContract);
        console.log("shadow bal=>",shadowedBalance);
        assertEq(shadowedBalance, 0);
        assertEq(realBalanceOfShadowContract, 25e18);
    }
}
