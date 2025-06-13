# Install required packages if not already installed
if (!require("igraph")) install.packages("igraph")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("readr")) install.packages("readr")

library(igraph)
library(ggplot2)
library(readr)

# Function to create and plot network
create_network_plot <- function(adj_matrix_file, title, output_filename) {
    # Read the adjacency matrix
    data <- read.csv(adj_matrix_file, row.names = 1)
    
    # Convert to matrix
    adj_matrix <- as.matrix(data)
    
    # Create graph from adjacency matrix
    g <- graph_from_adjacency_matrix(adj_matrix, 
                                   mode = "undirected", 
                                   weighted = TRUE,
                                   diag = FALSE)
    
    # Set vertex labels to use the respondent ID (r1, r2, etc.)
    V(g)$label <- V(g)$name
    
    # Set edge weights for visualization
    E(g)$width <- E(g)$weight
    
    # Create a color gradient for edge weights
    edge_colors <- colorRampPalette(c("lightblue", "darkblue"))(max(E(g)$weight))
    E(g)$color <- edge_colors[E(g)$weight]
    
    # Create the plot
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

# Create network visualizations for each question
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q3.csv", 
                   "Network of Variety Satisfaction Differences", "q3_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q5.csv", 
                   "Network of Weekly Spending Differences", "q5_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q4.csv", 
                   "Network of Weekly Meals Differences", "q4_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q2.csv", 
                   "Network of Food Quality Differences", "q2_network")
create_network_plot("/Users/user/Desktop/discrete_structure_assignment/csv_data/q1.csv", 
                   "Network of Food Healthiness Differences", "q1_network")
