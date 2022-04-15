library(igraph)
rg <- sample_fitness_pl(100, 1000, 2.2, 2.3)
cdf <- data.frame( ends(rg, E(rg))[,1], ends(rg, E(rg))[,2] )
colnames(cdf) <- c("from", "to")
library(cuRnet)
cg <- cuRnet_graph(cdf)

sources <- union(cdf$from, cdf$to)[1:20]
bfs <- cuRnet_bfs(cg, sources)

print(bfs[1,])
