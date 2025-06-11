public class FoodSurveyGraphAnalysis {
    private static final int NUM_RESPONDENTS = 25;
    private static final int NUM_QUESTIONS = 5;

    // Survey data matrix [respondent][question]
    // Q2 and Q3 converted to numerical values
    private static double[][] surveyData = {
        {3, 37.5, 7, 3, 2}, {4, 62.5, 10.5, 4, 3}, {2, 12.5, 4, 2, 2},
        {5, 87.5, 15, 4, 4}, {3, 37.5, 7, 3, 3}, {4, 62.5, 10.5, 4, 3},
        {3, 37.5, 4, 3, 2}, {2, 12.5, 1, 2, 1}, {4, 62.5, 10.5, 4, 4},
        {3, 37.5, 7, 3, 3}, {5, 87.5, 15, 5, 4}, {2, 12.5, 4, 2, 2},
        {4, 62.5, 10.5, 4, 3}, {3, 37.5, 7, 3, 3}, {4, 62.5, 10.5, 4, 4},
        {2, 12.5, 4, 2, 2}, {5, 125, 15, 5, 5}, {1, 12.5, 1, 1, 1},
        {4, 62.5, 10.5, 4, 3}, {3, 37.5, 7, 3, 3}, {4, 87.5, 10.5, 4, 4},
        {2, 37.5, 4, 2, 2}, {3, 62.5, 7, 3, 3}, {4, 62.5, 10.5, 4, 3},
        {3, 37.5, 7, 3, 3}
    };

    public static double[][] computeAdjacencyMatrix(int questionIndex) {
        double[][] adjacencyMatrix = new double[NUM_RESPONDENTS][NUM_RESPONDENTS];

        for (int i = 0; i < NUM_RESPONDENTS; i++) {
            for (int j = 0; j < NUM_RESPONDENTS; j++) {
                if (i != j) {
                    // Calculate absolute difference as weight
                    adjacencyMatrix[i][j] = Math.abs(
                        surveyData[i][questionIndex] - surveyData[j][questionIndex]
                    );
                } else {
                    adjacencyMatrix[i][j] = 0; // No self-loops
                }
            }
        }
        return adjacencyMatrix;
    }

    public static void printAdjacencyMatrix(double[][] matrix, int questionNum) {
        System.out.println("Adjacency Matrix for Question " + (questionNum + 1) + ":");
        System.out.print("    ");
        for (int i = 0; i < NUM_RESPONDENTS; i++) {
            System.out.printf("R%-2d ", (i + 1));
        }
        System.out.println();

        for (int i = 0; i < NUM_RESPONDENTS; i++) {
            System.out.printf("R%-2d ", (i + 1));
            for (int j = 0; j < NUM_RESPONDENTS; j++) {
                System.out.printf("%6.1f ", matrix[i][j]);
            }
            System.out.println();
        }
        System.out.println();
    }

    public static void exportToCSV(double[][] matrix, int questionNum) {
        try {
            java.io.FileWriter writer = new java.io.FileWriter("adjacency_matrix_Q" + (questionNum + 1) + ".csv");

            // Write header
            writer.write("Respondent,");
            for (int i = 0; i < NUM_RESPONDENTS; i++) {
                writer.write("R" + (i + 1) + (i == NUM_RESPONDENTS - 1 ? "\n" : ","));
            }

            // Write matrix data
            for (int i = 0; i < NUM_RESPONDENTS; i++) {
                writer.write("R" + (i + 1) + ",");
                for (int j = 0; j < NUM_RESPONDENTS; j++) {
                    writer.write(matrix[i][j] + (j == NUM_RESPONDENTS - 1 ? "\n" : ","));
                }
            }
            writer.close();
            System.out.println("Matrix for Q" + (questionNum + 1) + " exported to CSV");
        } catch (java.io.IOException e) {
            System.err.println("Error writing CSV: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        String[] questionTitles = {
            "Food Variety Satisfaction",
            "Weekly Food Spending",
            "Cafeteria Visit Frequency",
            "Food Quality Rating",
            "Food Healthiness Rating"
        };

        for (int q = 0; q < NUM_QUESTIONS; q++) {
            System.out.println("=== " + questionTitles[q] + " ===");
            double[][] adjMatrix = computeAdjacencyMatrix(q);
            printAdjacencyMatrix(adjMatrix, q);
            exportToCSV(adjMatrix, q);
            System.out.println();
        }
    }
} 