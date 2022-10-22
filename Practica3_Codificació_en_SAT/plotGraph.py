import matplotlib.pyplot as plt
import networkx as nx
import numpy as np

def show_graph_with_labels(adjacency_matrix, mylabels):
    rows, cols = np.where(adjacency_matrix == 1)
    edges = zip(rows.tolist(), cols.tolist())
    gr = nx.Graph()
    gr.add_edges_from(edges)
    nx.draw(gr, node_size=500, with_labels=True)
    plt.show()


adjacency = [
    [10],
    [7, 5, 17],
    [6, 20, 11],
    [14,15,1,8,5],
    [16,4,9,10,11],
    [1,13,17],
    [16,9,13,11],
    [7,3,10,6,17],
    [6,17,11],
    [7,11,5,6,4],
    [20,8,15,4,1,16,3],
    [15,11,3],
    [5,2,19,3,6],
    [10,12,9,7],
    [20,1,14,18,12,2],
    [7,6,4,8,2,10],
    [20,5,16,3,8],
    [15,16,7,14,3],
    [13,6],
    [12,6,18,7,16]
]
adjacency_matrix = np.zeros(shape=(20, 20))
for idx, a in enumerate(adjacency):
    for _a in a:
        adjacency_matrix[idx, _a-1] = 1

print(adjacency_matrix)
show_graph_with_labels(adjacency_matrix, [i for i in range(1, 20)])