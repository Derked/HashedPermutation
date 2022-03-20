//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import './HashedPermutation.sol';

contract TestShuffle {

	uint256 public constant MAX_SEED = 2**48;
	uint256 public length;
	uint256 public seed;

	constructor(uint256 _length) {
		length = _length;
	}

	function setSeed(uint256 _num) external {
		//USE A BETTER SEED IF IN PRODUCTION LIKE A VRF ORACLE
		seed = uint256(keccak256(abi.encodePacked(block.timestamp, length, _num))) % MAX_SEED;
	}

	function changeLength(uint256 _length) external {
		length = _length;
	}

	function shuffle(uint256 _index) external view returns (uint256) {
		return HashedPermutation.shuffle(_index, length, seed);
	}

}