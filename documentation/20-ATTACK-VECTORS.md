# 20 ATTACK VECTORS
- [Typographical Error](#typography)
- [Re-Entrancy Attack](#reentrancy)
- [Unexpected ETH balance](#unexpectedEthBal)
- [Frontrunning Attack](#frontrunning)
- [DoS Attack](#dos)
- [Malicious use of SelfDestruct](#selfdestruct)
- [Shadowing state variables](#shadow)
- [Delegate call Attack](#delegatecall)
- [Randomness manipulation](#randomness)
- [Signature Replay Attack](#signature)
- [Tx.Origin Attack](#txorigin)
- [Accessing Private variables](#private-variables)
- [Floating Pragma](#floating-pragma)
- [Outdated compiler version](#outdated-compiler)
- [Bypass contract size Attack](#bypass-contract-size)
- [Logical Issues](#logical-issues)
- [Use of Deprecated Solidity Functions](#deprecated-fns)
- [Hiding Malicious code in external contract](#external-contract)
- [Account Existence Check for low level calls](#exist-check)

## <font color="yellow">Typographical Error <a id="typography"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Re-Entrancy Attack <a id="reentrancy"></a></font> 


### Description
*one major danger of calling external contracts is that they can take over the control flow as described thus: Let's say that contract A calls contract B.*

*Reentracy (a.k.a. recursive call attack) exploit allows B to call back into A before A finishes execution.*

### Code sample

## <font color="yellow"> Unexpected ETH balance <a id="unexpectedEthBal"></a></font>

### Description
*Contracts can behave erroneously when they strictly assume a specific Ether balance. It is always possible to forcibly send ether to a contract (without triggering its fallback function), using selfdestruct, or by mining to the account. In the worst case scenario this could lead to DOS conditions that might render the contract unusable.*

### Code sample

- [contracts(Vulnerable and Exploit)](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/UnexpectedEthBalance.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/UnexpectedEthBalance.t.sol)

### Remediation
Avoid strict equality checks for the Ether balance in a contract.

## <font color="yellow">Frontrunning Attack <a id="frontrunning"></a></font>

### Description
*Transactions take some time before they are mined. An attacker can watch the transaction pool and send a transaction, have it included in a block before the original transaction. This mechanism can be abused to re-order transactions to the attacker's advantage.*

### Code sample

- [vulnerable and exploit contracts ](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/FrontRunning.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/FrontRunning.t.sol)

### Remediation
use commit-reveal scheme (https://medium.com/swlh/exploring-commit-reveal-schemes-on-ethereum-c4ff5a777db8)
use submarine send (https://libsubmarine.org/)

## <font color="yellow">DoS Attack <a id="dos"></a>dos</font>

### Description
*Rendering a contract unsable is what we call Denial of Service attack. There are many ways to attack a smart contract to make it unusable.One exploit we introduce here is denial of service by making the function to send Ether fail.*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/DoSKingOfEth.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/DoS.t.sol)

### Remediation
for this instance, One way to prevent this type of DoS is to allow the users to withdraw their Ether instead of sending it.


## <font color="yellow">Malicious use of SelfDestruct<a id="selfdestruct"></a></font>

### Description
*Contracts can be deleted from the blockchain by calling selfdestruct.
selfdestruct sends all remaining Ether stored in the contract to a designated address.
A malicious contract can use selfdestruct to force sending Ether to any contract.*

### Code sample

- [Vulnerable and exploit contracts](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/SelfDestruct.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/selfDestruct.t.sol)

### Remediation
In this very attack, to prevent the attack, Don't rely on address(this).balance.


## <font color="yellow">Shadowing state variables <a id="shadow"></a></font>

### Description
*Having more than one variable(be it state or local) using the same name leads to ambiguity and wrong value fetch when a function or the contract tries to access the variable in the higher scope. this predisposes the contract to attack and semantic errors during execution*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ShadowingStateVariables.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/ShadowVariableTest.t.sol)

### Remediation
Review storage variable layouts for your contract systems carefully and remove any ambiguities. Always check for compiler warnings as they can flag the issue within a single contract.

## <font color="yellow">Delegate call Attack <a id="delegatecall"></a></font>

### Description
*delegatecall is tricky to use and wrong usage or incorrect understanding can lead to devastating results.You must keep 2 things in mind when using delegatecall, delegatecall preserves context (storage, caller, etc...)
storage layout must be the same for the contract calling delegatecall and the contract getting called*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/DelegatecallAttack.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/DelegateCall.t.sol)

### Remediation
Use stateless Library

## <font color="yellow">Randomness manipulation<a id="randomness"></a></font>

### Description
*blockhash and block.timestamp and block data generally are not reliable sources for randomness.they could be manipulated by bad players and hackers*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/RandomnessManipulation.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/RandomNumber.t.sol)

### Remediation
Don't use blockhash and block.timestamp or other block dat as source of randomness. you ay use Chainlink etc

## <font color="yellow">Signature Replay Attack <a id="signature"></a></font>

### Description
*Signing messages off-chain and having a contract that requires that signature before executing a function is a useful technique.For example this technique is used to: 1)reduce number of transaction on chain 2) gas-less transaction, called meta transaction. However the issue is,Same signature can be used multiple times to execute a function. This can be harmful if the signer's intention was to approve a transaction once.*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/SignatureReplay.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/SignatureReplay.t.sol)

### Remediation
Sign messages with nonce and address of the contract.

## <font color="yellow">Tx.Origin Attack<a id="txorigin"></a></font>

### Description
*If contract A calls B, and B calls C, in C msg.sender is B and tx.origin is A. The problem is, a malicious contract can deceive the owner of a contract into calling a function that only the owner should be able to call.*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/TxOriginPhishing.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/TxOriginPhishing.t.sol)

### Remediation
use msg.sender instead of tx.origin to check the caller of a function.

## <font color="yellow">Accessing Private variables<a id="private-variables"></a></font>

### Description
*All data on a smart contract can be read. Let's see how we can read private data. In the process you will learn how Solidity stores state variables.*

### Code sample
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Note: cannot use web3 on JVM, so use the contract deployed on Goerli
Note: browser Web3 is old so use Web3 from truffle console

Contract deployed on Goerli
0x534E4Ce0ffF779513793cfd70308AF195827BD31
*/

/*
# Storage
- 2 ** 256 slots
- 32 bytes for each slot
- data is stored sequentially in the order of declaration
- storage is optimized to save space. If neighboring variables fit in a single
  32 bytes, then they are packed into the same slot, starting from the right
*/

contract Vault {
    // slot 0
    uint256 public count = 123;
    // slot 1
    address public owner = msg.sender;
    bool public isTrue = true;
    uint16 public u16 = 31;
    // slot 2
    bytes32 private password;

    // constants do not use storage
    uint256 public constant someConst = 123;

    // slot 3, 4, 5 (one for each array element)
    bytes32[3] public data;

    struct User {
        uint256 id;
        bytes32 password;
    }

    // slot 6 - length of array
    // starting from slot hash(6) - array elements
    // slot where array element is stored = keccak256(slot)) + (index * elementSize)
    // where slot = 6 and elementSize = 2 (1 (uint) +  1 (bytes32))
    User[] private users;

    // slot 7 - empty
    // entries are stored at hash(key, slot)
    // where slot = 7, key = map key
    mapping(uint256 => User) private idToUser;

    constructor(bytes32 _password) {
        password = _password;
    }

    function addUser(bytes32 _password) public {
        User memory user = User({id: users.length, password: _password});

        users.push(user);
        idToUser[user.id] = user;
    }

    function getArrayLocation(uint256 slot, uint256 index, uint256 elementSize)
        public
        pure
        returns (uint256)
    {
        return
            uint256(keccak256(abi.encodePacked(slot))) + (index * elementSize);
    }

    function getMapLocation(uint256 slot, uint256 key)
        public
        pure
        returns (uint256)
    {
        return uint256(keccak256(abi.encodePacked(key, slot)));
    }
}

/*
slot 0 - count
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", 0, console.log)
slot 1 - u16, isTrue, owner
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", 1, console.log)
slot 2 - password
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", 2, console.log)

slot 6 - array length
getArrayLocation(6, 0, 2)
web3.utils.numberToHex("111414077815863400510004064629973595961579173665589224203503662149373724986687")
Note: We can also use web3 to get data location
web3.utils.soliditySha3({ type: "uint", value: 6 })
1st user
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", "0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d3f", console.log)
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", "0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d40", console.log)
Note: use web3.toAscii to convert bytes32 to alphabet
2nd user
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", "0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d41", console.log)
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", "0xf652222313e28459528d920b65115c16c04f3efc82aaedc97be59f3f377c0d42", console.log)

slot 7 - empty
getMapLocation(7, 1)
web3.utils.numberToHex("81222191986226809103279119994707868322855741819905904417953092666699096963112")
Note: We can also use web3 to get data location
web3.utils.soliditySha3({ type: "uint", value: 1 }, {type: "uint", value: 7})
user 1
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", "0xb39221ace053465ec3453ce2b36430bd138b997ecea25c1043da0c366812b828", console.log)
web3.eth.getStorageAt("0x534E4Ce0ffF779513793cfd70308AF195827BD31", "0xb39221ace053465ec3453ce2b36430bd138b997ecea25c1043da0c366812b829", console.log)
*/
```

### Remediation
Don't store sensitive information on the blockchain, especially if it is not encrypted.

## <font color="yellow">Floating Pragma <a id="floating-pragma"></a></font>

### Description
*Contracts should be deployed with the same compiler version and flags that they have been tested with thoroughly. Locking the pragma helps to ensure that contracts do not accidentally get deployed using, for example, an outdated compiler version that might introduce bugs that affect the contract system negatively.*

### Code sample

```solidity
pragma solidity ^0.8.20;

contract PragmaNotLocked {
    uint public x = 1;
}
```

### Remediation
```
pragma solidity 0.8.20;

contract PragmaNotLocked {
    uint public x = 1;
}
```

## <font color="yellow">Outdated compiler version <a id="outdated-compiler"></a></font>

### Description
*Using any solidity compiler version less than 0.8 is a recipe for disaster for your smart contracts. doing so exposes your contracts to alot of bugs that have been removed by default in the new solidity versions. bugs like arithematic overflow & underflow is one major issue that using one of the latest compiler versions solves for you by default*

### Remediation
ensure your smart contract is built and compiled with latest or the latest stable version of the solidity compilers.

## <font color="yellow">Bypass contract size Attack<a id="bypass-contract-size"></a></font>

### Description
*It is possible to create a contract with code size returned by extcodesize equal to 0. This can lead to bypass of 0-address check in a contract, which may lead to lost of fund or locking of funds.*

### Code sample

- [Vulnerable and exploit contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/BypassContractSize.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/BypassContractSize.t.sol)

### Remediation


## <font color="yellow">Hiding Malicious code in external contract <a id="external-contract"></a></font>

### Description
*In Solidity any address can be casted into specific contract, even if the contract at the address is not the one being casted. This can be exploited to hide malicious code. Let's see how.*

### Code sample
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Let's say Alice can see the code of Foo and Bar but not Mal.
It is obvious to Alice that Foo.callBar() executes the code inside Bar.log().
However Eve deploys Foo with the address of Mal, so that calling Foo.callBar()
will actually execute the code at Mal.
*/

/*
1. Eve deploys Mal
2. Eve deploys Foo with the address of Mal
3. Alice calls Foo.callBar() after reading the code and judging that it is
   safe to call.
4. Although Alice expected Bar.log() to be execute, Mal.log() was executed.
*/

contract Foo {
    Bar bar;

    constructor(address _bar) {
        bar = Bar(_bar);
    }

    function callBar() public {
        bar.log();
    }
}

contract Bar {
    event Log(string message);

    function log() public {
        emit Log("Bar was called");
    }
}

// This code is hidden in a separate file
contract Mal {
    event Log(string message);

    // function () external {
    //     emit Log("Mal was called");
    // }

    // Actually we can execute the same exploit even if this function does
    // not exist by using the fallback
    function log() public {
        emit Log("Mal was called");
    }
}
```

### Remediation
Initialize a new contract inside the constructor. 
Make the address of external contract public so that the code of the external contract can be reviewed
```solidity
Bar public bar;

constructor() public {
    bar = new Bar();
}
```


## <font color="yellow">Logical Issues <a id="logical-issues"></a></font>

### Description
*Some of the above issues are more specific to smart contracts, others are common to all types of programming. By far the most common type of issue we detect consists of simple mistakes in the logic of the smart contract. These errors may be the result of a simple typo, a misunderstanding of the specification, or a larger programming mistake. These tend to have severe implications on the security and functionality of the smart contract.What they all have in common though, is the fact that they can only be detected if the auditor understands the code base completely and has an insight into the project’s intended functionality and the contract’s specification. It is these types of issues that are the reason smart contract audits take time, are not cheap, and require highly experienced auditors.*


## <font color="yellow">Use of Deprecated Solidity Functions <a id="deprecated-fns"></a></font>

### Description
*Several functions and operators in Solidity are deprecated. Using them leads to reduced code quality. With new major versions of the Solidity compiler, deprecated functions and operators may result in side effects and compile errors.*

## Remediation
always use updated functions and methods in building your contracts. examples of some deprecated functions and their corresponding upgrades
| Deprecated      | Updated |
| ----------- | ----------- |
| suicide(address)      | selfdestruct(address)       |
| constant      | view       |
| throw     | revert()       |
| callcode(...)      | delegatecall(...)      |

## <font color="yellow">Account Existence Check for low level calls<a id="exist-check"></a></font>

### Description
*As written in the solidity documentation, the low-level functions call, delegatecall and staticcall return true as their first return value if the account called is non-existent, as part of the design of the EVM. Account existence must be checked prior to calling if needed.*

## Remediation
Check before any low-level call that the address actually exists, for example before the low level call in the callERC20 function you can check that the address is a contract by checking its code size.