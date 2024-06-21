// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {FunctionSelector,FunctionSelectorExploit} from "../src/DelegatecallAttack.sol";

contract FunctionSelectorExploitTest is Test {
    FunctionSelector private target;
    FunctionSelectorExploit private exploit;

    function setUp() public {
        target = new FunctionSelector();
        exploit = new FunctionSelectorExploit(address(target));

        vm.label(address(target), "FunctionSelector");
        vm.label(address(exploit), "FunctionSelectorExploit");
    }

    function testDelegateCall() public {
        exploit.pwn();
        assertEq(target.owner(), address(exploit));
    }
}
