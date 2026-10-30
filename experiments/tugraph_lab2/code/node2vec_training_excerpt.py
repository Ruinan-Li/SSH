"""Node2Vec的Skip-gram训练调用片段。

walks_as_tokens: TuGraph在真实图上生成的游走，节点编号转换为字符串。
seed: 11、23、42、71、101之一。
stable_hash: 调用方提供的稳定SHA-256 token哈希函数。
Word2Vec: Gensim的Word2Vec类。
"""

model = Word2Vec(
    sentences=walks_as_tokens, vector_size=64, window=5,
    min_count=1, sg=1, hs=0, negative=5, sample=1e-3,
    workers=1, epochs=10, seed=seed, hashfxn=stable_hash
)
