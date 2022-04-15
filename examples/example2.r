# uncomment the following to install STRINGdb
# if (!requireNamespace("BiocManager", quietly = TRUE))
#     install.packages("BiocManager")
# BiocManager::install("STRINGdb")

library(STRINGdb)
ss <- STRINGdb$new( version="10", species=9606, score_threshold=900)

library(igraph)
g <- ss$get_graph()

from <- V(g)$name[1:10]

x <- data.frame("from" = ends(g,E(g))[,1], 
                "to" = ends(g,E(g))[,2], 
                "score" = E(g)$combined_score/1000)


library(cuRnet)
cg <- cuRnet_graph(x)
ret <- cuRnet_sssp(cg, from)

dists = ret[["distances"]]
preds = ret[["predecessors"]]


print(dists[1,])
# print(preds[1,])
