// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract ProofOfExistence1 {
    constructor() public {}

    bytes32 public proof;
    string public name1;

    function noterize(string memory document) public {
        proof = proofFor(document);
    }

    function proofFor(string memory document) public pure returns (bytes32) {
        return sha256(abi.encodePacked(document));
    }
}
