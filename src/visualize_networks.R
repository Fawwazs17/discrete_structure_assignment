if (!require("igraph")) install.packages("igraph")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("readr")) install.packages("readr")

library(igraph)
library(ggplot2)
library(readr)

create_network_plot <- function(adj_matrix_file, title, output_filename) {
    data <- read.csv(adj_matrix_file, row.names = 1)
    
    adj_matrix <- as.matrix(data)
    
    g <- graph_from_adjacency_matrix(adj_matrix, 
                                   mode = "undirected", 
                                   weighted = TRUE,
                                   diag = FALSE)
    
    V(g)$label <- V(g)$name
    
    E(g)$width <- E(g)$weight
    
    edge_colors <- colorRampPalette(c("lightblue", "darkblue"))(max(E(g)$weight))
    E(g)$color <- edge_colors[E(g)$weight]
    
    png(paste0("/Users/user/Desktop/discrete_structure_assignment/assets/", output_filename, ".png"), 
        width = 1200, height = 1200)
    
    plot(g,
         main = title,
         vertex.size = 20,
         vertex.color = "lightgreen",
         vertex.frame.color = "darkgreen",
         vertex.label.color = "black",
         vertex.label.cex = 1.2,
         edge.curved = 0.2,
         layout = layout_with_fr)
    
    dev.off()
}

create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q3.csv", 
                   "Network of Weekly Meals Differences", "q3_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q5.csv", 
                   "Network of Food Healthiness", "q5_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q4.csv", 
                   "Network of Food Quality Differences", "q4_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q2.csv", 
                   "Network of Weekly Spending Differences", "q2_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q1.csv", 
                   "Network of Variety Satisfaction Differences", "q1_network")
