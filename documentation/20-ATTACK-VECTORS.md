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
- [Hiding Malicious code in external contract](#external-contract)

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
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Frontrunning Attack <a id="frontrunning"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">DoS Attack <a id="dos"></a>dos</font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version


## <font color="yellow">Malicious use of SelfDestruct<a id="selfdestruct"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version


## <font color="yellow">Shadowing state variables <a id="shadow"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Delegate call Attack <a id="delegatecall"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Randomness manipulation<a id="randomness"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Signature Replay Attack <a id="signature"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Tx.Origin Attack<a id="txorigin"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Accessing Private variables<a id="private-variables"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Floating Pragma <a id="floating-pragma"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Outdated compiler version <a id="outdated-compiler"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Bypass contract size Attack<a id="bypass-contract-size"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Hiding Malicious code in external contract <a id="external-contract"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version

## <font color="yellow">Outdated compiler version <a id="outdated-compiler"></a></font>

### Description
*A typographical error can occur **for example** when the intent of a defined operation is to sum a number to a variable (+=) but it has accidentally been defined in a wrong way (=+), introducing a typo which happens to be a valid operator. Instead of calculating the sum it initializes the variable again.*

### Code sample

- [Vulnerable contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyEthBank.sol)
- [Attack contract](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/src/ReentrancyExploit.sol)
- [Test attack](https://github.com/ojiubasi-motif/guild-audit-wk1/blob/master/test/reentrancy.t.sol)

### Remediation
The weakness can be avoided in two ways; 1)by performing pre-condition checks on any math operation or using a vetted library for arithmetic calculations such as SafeMath developed by OpenZeppelin. 2)always check and ensure that your solidity compiler version is the latest *stable* version if not the latest version