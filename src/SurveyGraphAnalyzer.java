package src;
import java.io.*;
import java.util.*;

public class SurveyGraphAnalyzer {
    private static class Respondent {
        String respondentId;
        int varietySatisfaction;
        int weeklySpending;
        int weeklyMeals;
        int foodQuality;
        int foodHealthiness;

        public Respondent(String[] data) {
            this.respondentId = data[0];
            this.varietySatisfaction = Integer.parseInt(data[3]);
            this.weeklySpending = parseSpending(data[4]);
            this.weeklyMeals = parseMeals(data[5]);
            this.foodQuality = Integer.parseInt(data[6]);
            this.foodHealthiness = Integer.parseInt(data[7]);
        }

        private int parseSpending(String spending) {
            if (spending.equals("Below than RM 25")) return 1;
            if (spending.equals("RM 25 - RM 50")) return 2;
            if (spending.equals("RM 50 - RM 75")) return 3;
            if (spending.equals("RM 75 - RM 100")) return 4;
            if (spending.equals("Above RM 100")) return 5;
            return 0;
        }

        private int parseMeals(String meals) {
            if (meals.equals("Below than 5")) return 1;
            if (meals.equals("5 - 10")) return 2;
            if (meals.equals("10 - 15")) return 3;
            if (meals.equals("15 - 20")) return 4;
            return 0;
        }
    }

    public static void main(String[] args) {
        List<Respondent> respondents = new ArrayList<>();
        
        try (BufferedReader br = new BufferedReader(new FileReader("responsesrawdata.csv"))) {
            String line;
            boolean isFirstLine = true;
            while ((line = br.readLine()) != null) {
                if (isFirstLine) {
                    isFirstLine = false;
                    continue;
                }
                String[] data = line.split(",");
                respondents.add(new Respondent(data));
            }
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }


        generateAdjacencyMatrix(respondents, "csv_data/q3.csv", 
            (r1, r2) -> Math.abs(r1.varietySatisfaction - r2.varietySatisfaction));
        
        generateAdjacencyMatrix(respondents, "csv_data/q5.csv", 
            (r1, r2) -> Math.abs(r1.weeklySpending - r2.weeklySpending));
        
        generateAdjacencyMatrix(respondents, "csv_data/q4.csv", 
            (r1, r2) -> Math.abs(r1.weeklyMeals - r2.weeklyMeals));
        
        generateAdjacencyMatrix(respondents, "csv_data/q2.csv", 
            (r1, r2) -> Math.abs(r1.foodQuality - r2.foodQuality));
        
        generateAdjacencyMatrix(respondents, "csv_data/q1.csv", 
            (r1, r2) -> Math.abs(r1.foodHealthiness - r2.foodHealthiness));
    }

    private static void generateAdjacencyMatrix(List<Respondent> respondents, 
                                              String outputFile,
                                              java.util.function.BiFunction<Respondent, Respondent, Integer> differenceCalculator) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(outputFile))) {
            // Write header with respondent IDs
            writer.print("respondent");
            for (Respondent r : respondents) {
                writer.print("," + r.respondentId);
            }
            writer.println();

            // Write matrix rows
            for (Respondent r1 : respondents) {
                writer.print(r1.respondentId);
                for (Respondent r2 : respondents) {
                    writer.print("," + differenceCalculator.apply(r1, r2));
                }
                writer.println();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
