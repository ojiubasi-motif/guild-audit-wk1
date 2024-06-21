// SPDX-License-Identifier: UNLICENSED
// Claim multiple NFTs for the price
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {SafeNFT,SafeNFTExploit} from "../src/Reentrancy.sol";

contract SafeNftTest is Test{
    SafeNFT public safe_NFT;
    SafeNFTExploit public NFTExploit;
    string nft_name = "MyGuildAudit-1";
    string nft_symbol ="MGA-1";
    uint256 nft_floor_price = 1e9;

    function setUp() public {
        safe_NFT = new SafeNFT(nft_name, nft_symbol, nft_floor_price);
        NFTExploit = new SafeNFTExploit(address(safe_NFT));

        deal(address(NFTExploit), 1e18);
    }

    function testNftExploit() public {
        uint256 exploitNftBalanceBeforeAttck = safe_NFT.balanceOf(address(NFTExploit));
        NFTExploit.startAttack();
        uint256 exploitNftBalanceAfterAttck = safe_NFT.balanceOf(address(NFTExploit));
        assertEq(exploitNftBalanceBeforeAttck,0);
        assertEq(exploitNftBalanceAfterAttck,11);
    }

}