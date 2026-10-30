# TuGraph 图查询与图算法实验

按照《专业综合实践-实验2-图查询与图算法》课程要求，在 **TuGraph 4.5.2** 上分析 Stanford SNAP **email-Eu-core** 真实邮件网络，未使用模拟数据。

- [详细实验报告](experiments/tugraph_lab2/README.md)
- [17页 PDF 报告](experiments/tugraph_lab2/report/TuGraph_Lab2_Report.pdf)
- [公开附件、证据留存与复现限制](experiments/tugraph_lab2/PUBLICATION_NOTE.md)

原始数据含25,571条通信关系；清洗后保留1,005个节点、24,929条有向边。实验包括Cypher查询与CRUD、PageRank、BFS、标签传播和Node2Vec。五组种子的Node2Vec平均Accuracy为74.78%，Macro-F1为62.85%。

分支交付报告、原始图表、报告代码摘录和汇总表。由于会话中断后的工作区清理，部分未上传原始附件未能恢复；这不是完整的一键复现代码包，详见发布说明。
