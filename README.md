# TuGraph 图查询与图算法实验

按照《专业综合实践-实验2-图查询与图算法》课程要求，在 **TuGraph 4.5.2** 上分析 Stanford SNAP **email-Eu-core** 真实邮件网络。

- [详细实验报告](experiments/tugraph_lab2/README.md)
- [实验图表](experiments/tugraph_lab2/figures)
- [结果汇总](experiments/tugraph_lab2/results)
- [查询与训练代码片段](experiments/tugraph_lab2/code)

原始数据含25,571条通信关系；清洗后保留1,005个节点、24,929条有向边。实验包括Cypher查询与CRUD、PageRank、BFS、标签传播和Node2Vec。五组种子的Node2Vec平均Accuracy为74.78%，Macro-F1为62.85%。

报告依次介绍数据来源、图建模、查询方法、算法原理、参数设置、实验结果与分析，并结合七张图表展示网络结构及节点嵌入的效果。
