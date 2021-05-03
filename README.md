# from_el_to_adj
Function to convert an edgelist to adjacency matrix for network data analysis.

```r
# read for instance the facebook data
data <- read.table("facebook.txt")

head(data)
#>   V1 V2
#> 1  0  1
#> 2  0  2
#> 3  0  3
#> 4  0  4
#> 5  0  5
#> 6  0  6

# the data has 348 unique nodes so the matrix must have a dim. of 348 x 348
length(unique(c(data$V1, data$V2)))
#> [1] 348

# run the function
adj <- from_el_to_adj(data)

# check out.. 
dim(adj)
#> [1] 348 348

# let's check if the adjacency matrix is symmetric...
isSymmetric(adj)
#> [1] TRUE
```
