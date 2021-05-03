from_el_to_adj <- function(el) {
  ids <- sort(unique(c(el[, 1], el[, 2])))
  mat <- matrix(0, nrow = nrow(el), ncol = 2)
  
  for (i in 1:nrow(el)) {
    mat[i, 1] <- which(el[i, 1] == ids)
    mat[i, 2] <- which(el[i, 2] == ids)
  }
  rm("i")
  rm("el")
  
  nnodes <- length(ids)
  # generate adjacency matrix for full network
  adj <- matrix(0, nrow = nnodes, ncol = nnodes)
  # upper triangle
  adj[mat] <- 1
  # lower triangle
  adj[mat[, c(2,1)]] <- 1
  # generate a matrix with similar row and column names
  adjacency <- as.matrix(adj, dimnames = list(c(1:nrow(adj)),
                                              c(1:ncol(adj))))
  return(adjacency)
}