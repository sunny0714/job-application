// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Application {

    mapping (bytes32 => uint256) internal _applications;

    function applyByEmail(bytes32 emailHash) external {
        if (_applications[emailHash] != 0) {
            revert("You have already applied!");
        }
        _applications[emailHash] = block.timestamp;
    }

    function getApplicationID(string memory email) external view returns (uint256) {
        bytes32 emailHash = keccak256(abi.encodePacked(email));
        return _applications[emailHash];
    }
}