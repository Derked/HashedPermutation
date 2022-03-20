//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/*
  _   _           _              _   ____                           _        _   _
 | | | | __ _ ___| |__   ___  __| | |  _ \ ___ _ __ _ __ ___  _   _| |_ __ _| |_(_) ___  _ __  
 | |_| |/ _` / __| '_ \ / _ \/ _` | | |_) / _ \ '__| '_ ` _ \| | | | __/ _` | __| |/ _ \| '_ \ 
 |  _  | (_| \__ \ | | |  __/ (_| | |  __/  __/ |  | | | | | | |_| | || (_| | |_| | (_) | | | |
 |_| |_|\__,_|___/_| |_|\___|\__,_| |_|   \___|_|  |_| |_| |_|\__,_|\__\__,_|\__|_|\___/|_| |_|

*/

/*
	Original Research Paper: https://graphics.pixar.com/library/MultiJitteredSampling/paper.pdf
	Blog Post Outlining Algorithm: https://afnan.io/posts/2019-04-05-explaining-the-hashed-permutation/
*/ 

library HashedPermutation {
	 /**
	  @notice Deterministically calculate the shuffled index within a particular length using a particular seed.
	  @dev _seed may cause overflow errors if > 2**48. No guarantees on the properties of randomness. Once seed is known, all shuffled item locations are known.
	  @dev May be able to gas optimize by implementing in raw assembly
	  */
    function shuffle(uint256 _index, uint256 _length, uint256 _seed) internal pure returns (uint256) {
        uint256 w = _length - 1;
        w |= w >> 1;
        w |= w >> 2;
        w |= w >> 4;
        w |= w >> 8;
        w |= w >> 16;
        do {
            _index ^= _seed;
            _index *= 0xe170893d;
            _index ^= _seed >> 16;
            _index ^= (_index & w) >> 4;
            _index ^= _seed >> 8;
            _index *= 0x0929eb3f;
            _index ^= _seed >> 23;
            _index ^= (_index & w) >> 1;
            _index *= 1 | _seed >> 27;
            _index *= 0x6935fa69;
            _index ^= (_index & w) >> 11;
            _index *= 0x74dcb303;
            _index ^= (_index & w) >> 2;
            _index *= 0x9e501cc3;
            _index ^= (_index & w) >> 2;
            _index *= 0xc860a3df;
            _index &= w;
            _index ^= _index >> 5;
        } while (_index >= _length);
        return (_index + _seed) % _length;
    }

}