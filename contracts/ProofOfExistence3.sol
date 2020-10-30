// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract ProofOfExistence3 {
  constructor() public {
  }

  mapping(bytes32 => bool) private proofs;

  function storeProof(bytes32 proof) internal {
    proofs[proof] = true;
  }

  function notarize(string calldata document) external {
    bytes32 proof = proofFor(document);
    storeProof(proof);
  }

  function proofFor(string memory document) public pure returns(bytes32) {
    return keccak256(bytes(document));
  }

  function checkDocument(string memory document) public view returns(bool) {
    bytes32 proof = proofFor(document);
    return hasProof(proof);
  }

  function hasProof(bytes32 proof) internal view returns(bool) {
    return proofs[proof];
  }
}
