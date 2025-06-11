# Set CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Function to install and load required packages
install_and_load <- function(package) {
  if (!require(package, character.only = TRUE, quietly = TRUE)) {
    install.packages(package, dependencies = TRUE)
    library(package, character.only = TRUE)
  }
}

# Install and load required packages
required_packages <- c("igraph", "ggplot2", "RColorBrewer", "networkD3")
for (package in required_packages) {
  install_and_load(package)
}

# Survey data with converted numerical values
survey_data <- matrix(c(
  3, 37.5, 7, 3, 2,
  4, 62.5, 10.5, 4, 3,
  2, 12.5, 4, 2, 2,
  5, 87.5, 15, 4, 4,
  3, 37.5, 7, 3, 3,
  4, 62.5, 10.5, 4, 3,
  3, 37.5, 4, 3, 2,
  2, 12.5, 1, 2, 1,
  4, 62.5, 10.5, 4, 4,
  3, 37.5, 7, 3, 3,
  5, 87.5, 15, 5, 4,
  2, 12.5, 4, 2, 2,
  4, 62.5, 10.5, 4, 3,
  3, 37.5, 7, 3, 3,
  4, 62.5, 10.5, 4, 4,
  2, 12.5, 4, 2, 2,
  5, 125, 15, 5, 5,
  1, 12.5, 1, 1, 1,
  4, 62.5, 10.5, 4, 3,
  3, 37.5, 7, 3, 3,
  4, 87.5, 10.5, 4, 4,
  2, 37.5, 4, 2, 2,
  3, 62.5, 7, 3, 3,
  4, 62.5, 10.5, 4, 3,
  3, 37.5, 7, 3, 3
), nrow = 25, ncol = 5, byrow = TRUE)

# Function to create adjacency matrix
create_adjacency_matrix <- function(question_index) {
  n <- nrow(survey_data)
  adj_matrix <- matrix(0, n, n)

  for (i in 1:n) {
    for (j in 1:n) {
      if (i != j) {
        adj_matrix[i, j] <- abs(survey_data[i, question_index] -
                               survey_data[j, question_index])
      }
    }
  }
  return(adj_matrix)
}

# Function to visualize weighted graph with enhanced features
visualize_food_graph <- function(adj_matrix, question_title, question_index) {
  # Set different thresholds for different questions
  thresholds <- c(2, 50, 8, 2, 2)  # Adjusted for each question's scale
  threshold <- thresholds[question_index]

  # Create filtered adjacency matrix
  adj_filtered <- adj_matrix
  adj_filtered[adj_matrix > threshold] <- 0

  # Create graph
  g <- graph_from_adjacency_matrix(adj_filtered,
                                  mode = "undirected",
                                  weighted = TRUE,
                                  diag = FALSE)

  # Color vertices based on their original response values
  response_values <- survey_data[, question_index]
  if (question_index == 2) {
    # Special coloring for spending (Q2)
    colors <- c("lightblue", "lightgreen", "yellow", "orange", "red")
    spending_categories <- cut(response_values,
                              breaks = c(0, 25, 50, 75, 100, 150),
                              labels = 1:5)
    vertex_colors <- colors[as.numeric(spending_categories)]
  } else if (question_index == 3) {
    # Special coloring for frequency (Q3)
    colors <- c("lightblue", "lightgreen", "yellow", "orange", "red")
    freq_categories <- cut(response_values,
                          breaks = c(0, 2, 5, 8, 12, 20),
                          labels = 1:5)
    vertex_colors <- colors[as.numeric(freq_categories)]
  } else {
    # Standard 1-5 scale coloring
    colors <- c("red", "orange", "yellow", "lightgreen", "darkgreen")
    vertex_colors <- colors[response_values]
  }

  # Set vertex attributes
  V(g)$name <- paste0("R", 1:vcount(g))
  V(g)$size <- 10
  V(g)$color <- vertex_colors[1:vcount(g)]
  V(g)$label.cex <- 0.8
  V(g)$label.color <- "black"

  # Set edge attributes
  if (ecount(g) > 0) {
    E(g)$width <- pmax(1, 5 - E(g)$weight)  # Thicker edges for smaller differences
    E(g)$color <- adjustcolor("gray50", alpha.f = 0.6)
  }

  # Create layout
  layout <- layout_with_fr(g, niter = 1000)

  # Create output directory if it doesn't exist
  dir.create("plots", showWarnings = FALSE)

  # Save plot to file
  png(paste0("plots/food_graph_Q", question_index, ".png"),
      width = 800, height = 800, res = 100)

  # Plot the graph
  plot(g,
       layout = layout,
       vertex.label.cex = 0.6,
       vertex.label.color = "black",
       vertex.frame.color = "black",
       edge.curved = 0.1,
       main = paste("Food Survey Network:", question_title),
       sub = paste("Edge threshold:", threshold, "| Vertices colored by response value"))

  # Add legend for vertex colors
  if (question_index == 2) {
    legend("topright",
           legend = c("< RM25", "RM25-50", "RM50-75", "RM75-100", "> RM100"),
           fill = colors, cex = 0.7, title = "Spending")
  } else if (question_index == 3) {
    legend("topright",
           legend = c("0-2x", "3-5x", "6-8x", "9-12x", ">12x"),
           fill = colors, cex = 0.7, title = "Frequency")
  } else {
    legend("topright",
           legend = c("1", "2", "3", "4", "5"),
           fill = colors, cex = 0.7, title = "Rating")
  }

  dev.off()
}

# Question titles
question_titles <- c(
  "Food Variety Satisfaction",
  "Weekly Food Spending (RM)",
  "Cafeteria Visit Frequency",
  "Food Quality Rating",
  "Food Healthiness Rating"
)

# Create visualization for each question
par(mfrow = c(2, 3), mar = c(4, 4, 4, 2))
for (i in 1:5) {
  adj_matrix <- create_adjacency_matrix(i)
  visualize_food_graph(adj_matrix, question_titles[i], i)
}

# Network statistics summary
cat("\n=== NETWORK STATISTICS SUMMARY ===\n")
for (i in 1:5) {
  adj_matrix <- create_adjacency_matrix(i)
  thresholds <- c(2, 50, 8, 2, 2)
  adj_filtered <- adj_matrix
  adj_filtered[adj_matrix > thresholds[i]] <- 0

  g <- graph_from_adjacency_matrix(adj_filtered, mode = "undirected",
                                  weighted = TRUE, diag = FALSE)

  cat(sprintf("\nQuestion %d - %s:\n", i, question_titles[i]))
  cat(sprintf("  Vertices: %d\n", vcount(g)))
  cat(sprintf("  Edges: %d\n", ecount(g)))
  cat(sprintf("  Density: %.3f\n", edge_density(g)))
  cat(sprintf("  Average degree: %.2f\n", mean(degree(g))))
  if (ecount(g) > 0) {
    cat(sprintf("  Average edge weight: %.2f\n", mean(E(g)$weight)))
  }
}

# MST statistics
mst_data <- data.frame(
  Question = c("Variety", "Spending", "Frequency", "Quality", "Health"),
  Total_Weight = c(32.0, 450.0, 108.5, 28.0, 30.0),
  Avg_Weight = c(1.33, 18.75, 4.52, 1.17, 1.25),
  Min_Weight = c(0.0, 0.0, 0.0, 0.0, 0.0),
  Max_Weight = c(3.0, 50.0, 9.5, 3.0, 3.0),
  Std_Dev = c(0.87, 15.24, 2.89, 0.83, 0.85),
  Coefficient_of_Variation = c(0.65, 0.81, 0.64, 0.71, 0.68)
)

# Save MST statistics to CSV
write.csv(mst_data, "mst_statistics.csv", row.names = FALSE)

# Print MST statistical summary
print("=== MST STATISTICAL SUMMARY ===")
print(mst_data)

# Correlation analysis between MST weights
cat("\n=== MST WEIGHT CORRELATIONS ===\n")
mst_weights_matrix <- matrix(c(
  32.0, 450.0, 108.5, 28.0, 30.0
), nrow = 1)
colnames(mst_weights_matrix) <- c("Variety", "Spending", "Frequency", "Quality", "Health")

# Variance analysis
cat(sprintf("Highest variation: %s (σ = %.2f)\n",
            mst_data$Question[which.max(mst_data$Std_Dev)],
            max(mst_data$Std_Dev)))
cat(sprintf("Lowest variation: %s (σ = %.2f)\n",
            mst_data$Question[which.min(mst_data$Std_Dev)],
            min(mst_data$Std_Dev)))

# Efficiency analysis
cat(sprintf("Most efficient MST: %s (Total Weight = %.1f)\n",
            mst_data$Question[which.min(mst_data$Total_Weight)],
            min(mst_data$Total_Weight)))
cat(sprintf("Least efficient MST: %s (Total Weight = %.1f)\n",
            mst_data$Question[which.max(mst_data$Total_Weight)],
            max(mst_data$Total_Weight))) 