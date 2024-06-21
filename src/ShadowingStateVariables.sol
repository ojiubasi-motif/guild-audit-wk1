// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ShadowingStateVariables {
    // uint256 public contractBalance;
    constructor() { 
    }

    function getContractBalance() public returns(uint256 contractBalance){
        return contractBalance;
    }
}

contract TestVariableShadow {
    ShadowingStateVariables public shadow;
    constructor(address _shadow) {
        shadow = ShadowingStateVariables(_shadow); 
    }

    function confirmVariableShadow() public returns(uint256){
        return shadow.getContractBalance();
    }

}