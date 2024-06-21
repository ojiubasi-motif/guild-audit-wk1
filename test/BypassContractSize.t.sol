// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {NoContract,NoContractExploit} from "../src/BypassContractSize.sol";

contract NoContractExploitTest is Test {
    NoContract private target;
    NoContractExploit private exploit;

    function setUp() public {
        target = new NoContract();
        exploit = new NoContractExploit(address(target));

        vm.label(address(target), "NoContract");
        vm.label(address(exploit), "NoContractExploit");
    }

    function test_pwn() public {
        exploit.pwn();
        assertTrue(target.pwned());
    }
}
