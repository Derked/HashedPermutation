### Hashed Permutation

- Solidity implementation of the hashed permutation algorithm that deterministically shuffles N items with a given seed and length. 

- Original research paper: https://graphics.pixar.com/library/MultiJitteredSampling/paper.pdf
- Blog post explaining algorithm: https://afnan.io/posts/2019-04-05-explaining-the-hashed-permutation/

### Notes
- No guarantees on randomness properties
- Use a secure seed
- Shuffle may overflow if seed > 2^48. Other overflow issues may be present. Be careful.
- Once seed is revealed, all items are known at once. Do not use for things like drawing cards off a deck where future cards need to remain hidden.
- ~25k gas per shuffle call, not optimized. Assembly implementation may be possible for optimization.