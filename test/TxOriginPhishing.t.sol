// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test,console} from "forge-std/Test.sol";
import {Wallet,Attack} from "../src/TxOriginPhishing.sol";

contract PhishingWithTxOrigin is Test {
    address alice = address(11);
    address eve = address(77);
    Wallet private _targetWallet;
    Attack private exploit;

    function setUp() public {
        _targetWallet = new Wallet();

        vm.prank(eve);
        _targetWallet = new Wallet();

        // address(_targetWallet);

        vm.prank(alice);
        exploit = new Attack(Wallet(address(_targetWallet)));

        deal(address(_targetWallet), 2e18);
    }

    function testCanDrainWalletViaTxOrigin() public {
        address exploit_owner = exploit.owner();
        address wallet_owner = _targetWallet.owner();
        // address eve = address(this);
        console.log("eve's wallet=>",eve);
        console.log("alice's wallet=>",alice);
        console.log("exploit's wallet=>",address(exploit));
        console.log("the attack contract owner is=>",exploit_owner);
        console.log("the wallet contract owner is=>",wallet_owner);

        console.log("this attack_test address",address(this));
        uint256 balanceBeforeExploit = eve.balance;

        vm.prank(eve);
        exploit.attack();

        uint256 balanceAfterExploit = eve.balance;

        // address newWalletOwner = _targetWallet.owner();
        // assertEq(newWalletOwner,attacker);
        assertEq(balanceBeforeExploit,0);
        assertEq(balanceAfterExploit,2e18);
    }
}
