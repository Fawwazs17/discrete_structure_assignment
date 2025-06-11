import java.util.*;
import java.io.*;

public class FoodSurveyMSTAnalysis {
    static class Edge implements Comparable<Edge> {
        int src, dest;
        double weight;

        Edge(int src, int dest, double weight) {
            this.src = src;
            this.dest = dest;
            this.weight = weight;
        }

        @Override
        public int compareTo(Edge other) {
            return Double.compare(this.weight, other.weight);
        }

        @Override
        public String toString() {
            return String.format("R%d-R%d (%.1f)", src+1, dest+1, weight);
        }
    }

    static class UnionFind {
        int[] parent, rank;

        UnionFind(int n) {
            parent = new int[n];
            rank = new int[n];
            for (int i = 0; i < n; i++) {
                parent[i] = i;
                rank[i] = 0;
            }
        }

        int find(int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        }

        boolean union(int x, int y) {
            int px = find(x), py = find(y);
            if (px == py) return false;

            if (rank[px] < rank[py]) {
                parent[px] = py;
            } else if (rank[px] > rank[py]) {
                parent[py] = px;
            } else {
                parent[py] = px;
                rank[px]++;
            }
            return true;
        }
    }

    public static List<Edge> kruskalMST(double[][] adjMatrix) {
        int n = adjMatrix.length;
        List<Edge> edges = new ArrayList<>();

        // Create edge list from adjacency matrix
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (adjMatrix[i][j] > 0) {
                    edges.add(new Edge(i, j, adjMatrix[i][j]));
                }
            }
        }

        // Sort edges by weight
        Collections.sort(edges);

        UnionFind uf = new UnionFind(n);
        List<Edge> mst = new ArrayList<>();

        for (Edge edge : edges) {
            if (uf.union(edge.src, edge.dest)) {
                mst.add(edge);
                if (mst.size() == n - 1) break;
            }
        }

        return mst;
    }

    public static void analyzeMST(List<Edge> mst, String questionTitle) {
        System.out.println("=== MST Analysis: " + questionTitle + " ===");
        System.out.println("MST Edges:");

        double totalWeight = 0;
        double minWeight = Double.MAX_VALUE;
        double maxWeight = Double.MIN_VALUE;

        for (Edge edge : mst) {
            System.out.println("  " + edge);
            totalWeight += edge.weight;
            minWeight = Math.min(minWeight, edge.weight);
            maxWeight = Math.max(maxWeight, edge.weight);
        }

        double avgWeight = totalWeight / mst.size();

        // Calculate standard deviation
        double sumSquaredDiff = 0;
        for (Edge edge : mst) {
            sumSquaredDiff += Math.pow(edge.weight - avgWeight, 2);
        }
        double stdDev = Math.sqrt(sumSquaredDiff / mst.size());

        System.out.printf("Total Weight: %.2f\n", totalWeight);
        System.out.printf("Average Edge Weight: %.2f\n", avgWeight);
        System.out.printf("Min Edge Weight: %.2f\n", minWeight);
        System.out.printf("Max Edge Weight: %.2f\n", maxWeight);
        System.out.printf("Standard Deviation: %.2f\n", stdDev);
        System.out.printf("Number of Edges: %d\n", mst.size());
        System.out.println();
    }

    public static void main(String[] args) {
        // Create instance of graph analysis to get survey data
        FoodSurveyGraphAnalysis graphAnalysis = new FoodSurveyGraphAnalysis();

        String[] questionTitles = {
            "Food Variety Satisfaction",
            "Weekly Food Spending",
            "Cafeteria Visit Frequency",
            "Food Quality Rating",
            "Food Healthiness Rating"
        };

        for (int q = 0; q < 5; q++) {
            double[][] adjMatrix = graphAnalysis.computeAdjacencyMatrix(q);
            List<Edge> mst = kruskalMST(adjMatrix);
            analyzeMST(mst, questionTitles[q]);
        }
    }
} 