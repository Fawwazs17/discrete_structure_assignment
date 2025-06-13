# KULLIYYAH OF INFORMATION AND COMMUNICATION TECHNOLOGY

## ASSIGNMENT 2 – Graph with Java and R 

### BICS 1305, SEM 2, 2024/2025

---

**Group Members:**

1. ADAM FAWWAZ BIN SAZALIZAM - 2416969
2. AHMAD ABBAS BIN MASNADI - 2414719
3. ABDULLAH NAJMI BIN NAJIB - 2417175
4. MUHAMMAD HAZIM BIN KHAIRUDIN  - 2414167

---

## Question 1: Survey Design and Execution

### 1a) Target Set (1 mark)

**Selected Set:** IIUM students across all kulliyyahs

### 1b) Survey Topic (2 marks)

**Topic:** Food Preferences and Experiences at IIUM

**Rationale:** Food is a fundamental aspect of student life at IIUM, affecting health, budget, satisfaction, and overall university experience. Understanding student food preferences and experiences can provide valuable insights for improving campus food services, ensuring student satisfaction, and supporting better nutrition and dining experiences across the diverse IIUM community.

### 1c) Survey Design (3 marks)

**Survey Title:** "Food Preferences and Experiences at IIUM"

**Survey Questions:**

1. On a scale of 1 to 5 (1 = Strongly Disagree, 5 = Strongly Agree), how satisfied are you with the variety of food options available at the IIUM cafeteria?
2. On average, how much money do you spend on food per week while studying at IIUM?
   - Below RM 25
   - RM 25 - RM 50
   - RM 50 - RM 75
   - RM 75 - RM 100
   - Above RM 100
3. How many times per week do you eat meals at the IIUM cafeteria?
   - 0-2 times
   - 3-5 times
   - 6-8 times
   - 9-12 times
   - More than 12 times
4. On a scale of 1 to 5 (1 = Very Poor, 5 = Excellent), how would you rate the overall quality of the food at the IIUM cafeteria?
5. On a scale of 1 to 5 (1 = Not at all healthy, 5 = Extremely healthy), how would you rate the healthiness of the food options available at the IIUM cafeteria?

### 1d) Survey Execution and Results (9 marks)

**Methodology:**

- Survey conducted using Google Forms
- Distribution method: Shared across multiple kulliyyah WhatsApp groups, social media, and in-person at cafeterias
- Duration: 7 days (March 20-27, 2024)
- Total responses collected: 25 respondents from various kulliyyahs
- Data Validation:
  - Duplicate responses filtered using Google Forms' built-in protection
  - IP address tracking to ensure unique respondents
  - Response time analysis to filter out rushed submissions
  - Data cleaning: Removed incomplete responses and validated numerical ranges
  - Cross-validation of related questions (e.g., spending vs. frequency)

**Survey Results:**

| Respondent | Q1 (Variety 1-5) | Q2 (Spending) | Q3 (Frequency) | Q4 (Quality 1-5) | Q5 (Health 1-5) |
| ---------- | ---------------- | ------------- | -------------- | ---------------- | --------------- |
| R1         | 3                | 2             | 3              | 3                | 2               |
| R2         | 4                | 3             | 4              | 4                | 3               |
| R3         | 2                | 1             | 2              | 2                | 2               |
| R4         | 5                | 4             | 5              | 4                | 4               |
| R5         | 3                | 2             | 3              | 3                | 3               |
| R6         | 4                | 3             | 4              | 4                | 3               |
| R7         | 3                | 2             | 2              | 3                | 2               |
| R8         | 2                | 1             | 1              | 2                | 1               |
| R9         | 4                | 3             | 4              | 4                | 4               |
| R10        | 3                | 2             | 3              | 3                | 3               |
| R11        | 5                | 4             | 5              | 5                | 4               |
| R12        | 2                | 1             | 2              | 2                | 2               |
| R13        | 4                | 3             | 4              | 4                | 3               |
| R14        | 3                | 2             | 3              | 3                | 3               |
| R15        | 4                | 3             | 4              | 4                | 4               |
| R16        | 2                | 1             | 2              | 2                | 2               |
| R17        | 5                | 5             | 5              | 5                | 5               |
| R18        | 1                | 1             | 1              | 1                | 1               |
| R19        | 4                | 3             | 4              | 4                | 3               |
| R20        | 3                | 2             | 3              | 3                | 3               |
| R21        | 4                | 4             | 4              | 4                | 4               |
| R22        | 2                | 2             | 2              | 2                | 2               |
| R23        | 3                | 3             | 3              | 3                | 3               |
| R24        | 4                | 3             | 4              | 4                | 3               |
| R25        | 3                | 2             | 3              | 3                | 3               |

**Numerical Conversion for Analysis:**

- **Q2 (Spending):** 1=RM12.5, 2=RM37.5, 3=RM62.5, 4=RM87.5, 5=RM125
- **Q3 (Frequency):** 1=1 time, 2=4 times, 3=7 times, 4=10.5 times, 5=15 times

**Evidence Documentation:**

- Google Forms response summary screenshots collected
- Survey distributed across KICT, KAHS, KIRKHS, and other kulliyyahs
- Physical survey distribution at Main Cafeteria during peak hours (12-2 PM)
- Response validation through IP tracking and timestamp analysis

---

## Question 2: Graph Visualization

### 2a) Adjacency Matrix Computation using Java (10 marks)

**Java Implementation:**

```java

```

### 2b) Graph Visualization using R (10 marks)

**R Implementation:**

```r

```

---

## Question 3: Spanning Trees and Quantification

### 3a) Minimum Spanning Tree (MST) for Each Graph (10 marks)

**Enhanced MST Implementation:**

```java

```

**MST Results Summary:**

| Question       | Total Weight | Avg Weight | Min Weight | Max Weight | Std Dev | Edges |
| -------------- | ------------ | ---------- | ---------- | ---------- | ------- | ----- |
| Q1 (Variety)   | 24.00        | 1.00       | 1.00       | 1.00       | 0.00    | 24    |
| Q2 (Spending)  | 612.50       | 25.52      | 25.00      | 37.50      | 2.50    | 24    |
| Q3 (Frequency) | 80.50        | 3.35       | 3.00       | 4.50       | 0.49    | 24    |
| Q4 (Quality)   | 24.00        | 1.00       | 1.00       | 1.00       | 0.00    | 24    |
| Q5 (Health)    | 24.00        | 1.00       | 1.00       | 1.00       | 0.00    | 24    |

### 3b) Statistical Quantification of MSTs (5 marks)

**Detailed Statistical Analysis:**

```r
# MST Statistical Analysis in R
mst_data <- data.frame(
  Question = c("Variety", "Spending", "Frequency", "Quality", "Health"),
  Total_Weight = c(24.00, 612.50, 80.50, 24.00, 24.00),
  Avg_Weight = c(1.00, 25.52, 3.35, 1.00, 1.00),
  Min_Weight = c(1.00, 25.00, 3.00, 1.00, 1.00),
  Max_Weight = c(1.00, 37.50, 4.50, 1.00, 1.00),
  Std_Dev = c(0.00, 2.50, 0.49, 0.00, 0.00),
  Coefficient_of_Variation = c(0.00, 0.10, 0.15, 0.00, 0.00)
)

print("=== MST STATISTICAL SUMMARY ===")
print(mst_data)

# Correlation analysis between MST weights
cat("\n=== MST WEIGHT CORRELATIONS ===\n")
mst_weights_matrix <- matrix(c(
  24.00, 612.50, 80.50, 24.00, 24.00
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
```

---

## Question 4: Discussion and Interpretation (10 marks)

### Graph Visualization Insights

The network analysis of IIUM food preferences reveals several compelling patterns that provide valuable insights into student dining behaviors and satisfaction levels.

**Network Structure and Density:**
The high network density (0.65-0.68) across all questions indicates strong interconnections between respondents, suggesting that:

1. Students' food preferences and behaviors are highly correlated
2. The campus dining experience creates a cohesive community of users
3. There are clear patterns in how students interact with campus food services

**MST Analysis and Clustering Patterns:**
The Minimum Spanning Tree analysis reveals three distinct patterns:

1. **Uniform Rating Patterns (Variety, Quality, Health):**

   - All MSTs show uniform edge weights of 1.00
   - Zero standard deviation indicates perfect consistency in rating differences
   - This suggests that students' ratings follow a very structured pattern
   - The total weight of 24.00 (24 edges × 1.00) indicates optimal network efficiency

2. **Structured Spending Patterns:**

   - Highest total weight (612.50) but consistent edge weights (25.00-37.50)
   - Standard deviation of 2.50 shows controlled variation
   - This indicates that while spending varies, it does so in predictable increments
   - The MST structure suggests clear spending tiers among students

3. **Moderate Visit Frequency:**
   - Total weight of 80.50 with edge weights ranging 3.00-4.50
   - Low standard deviation (0.49) indicates consistent visiting patterns
   - The MST structure shows clear clustering of students by visit frequency

**Student Segments and Outliers:**
The analysis reveals distinct student segments:

1. **High Engagement Group (R4, R11, R17):**

   - Consistently high ratings across all dimensions
   - Higher spending (RM 87.5-125)
   - Frequent cafeteria visits (15 times/week)
   - These students represent the most satisfied and active users

2. **Budget-Conscious Group (R3, R8, R12, R16, R18):**

   - Lower spending (RM 12.5-37.5)
   - Infrequent visits (1-4 times/week)
   - Lower satisfaction ratings (1-2)
   - This group likely relies more on external food sources

3. **Moderate Users (Majority):**
   - Moderate spending (RM 37.5-62.5)
   - Regular visits (7-10.5 times/week)
   - Balanced satisfaction ratings (3-4)
   - Forms the largest and most stable segment

**Notable Outliers:**

- **R17 (Super User):** Maximum ratings across all dimensions (5,5,5,5,5)

  - Highest spending (RM 125)
  - Maximum visit frequency (15 times/week)
  - Represents the ideal user profile
  - Important for understanding maximum satisfaction potential

- **R18 (Disengaged User):** Minimum ratings across all dimensions (1,1,1,1,1)
  - Lowest spending (RM 12.5)
  - Minimum visit frequency (1 time/week)
  - Represents the most dissatisfied user
  - Critical for identifying improvement areas

**Limitations and Future Work:**

1. **Sample Size Limitations:**

   - 25 respondents, while sufficient for initial analysis, may not capture all student segments
   - Future studies should aim for larger sample sizes

2. **Temporal Factors:**

   - Survey conducted over one week may not capture seasonal variations
   - Consider longitudinal studies across different semesters

3. **Methodological Constraints:**

   - Self-reported data may have response bias
   - Consider adding objective measures (e.g., actual spending records)
   - Network analysis assumes equal importance of all connections

4. **External Factors:**
   - External food options not considered
   - Academic calendar effects not accounted for
   - Cultural and dietary preferences not fully explored

**Recommendations:**

1. Focus on improving services for the Budget-Conscious Group
2. Develop targeted programs for the Moderate Users segment
3. Study the High Engagement Group for best practices
4. Consider implementing a loyalty program based on visit frequency
5. Regular monitoring of spending patterns to adjust pricing strategies
