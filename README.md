# Project 4: High-Risk Jurisdiction Activity Analysis

**Objective:** Analyze transaction data to identify and summarize financial activity involving high-risk jurisdictions. This is a common task for AML analysts monitoring for potential cross-border money laundering.

**KYC/AML Concepts Demonstrated:**
*   **Jurisdictional Risk:** Understanding that different countries pose different levels of money laundering risk.
*   **Cross-Border Transactions:** A key focus area for AML compliance, as they can be used to obscure the origin of funds.
*   **Suspicious Activity Reporting (SAR):** The findings from this type of analysis often form the basis of a SAR.

---

### Your Tasks:

**1. Python & Pandas Analysis:**
*   Load the `transactions_with_country.csv` dataset.
*   Define a list of high-risk countries (e.g., `['North Korea', 'Iran', 'Panama']`).
*   Filter the DataFrame to show only transactions where either the `SourceCountry` or `DestinationCountry` is on the high-risk list.
*   Calculate the total amount of money flowing to and from these high-risk jurisdictions.
*   **EDA Questions:**
    1.  What is the total number of transactions per country?
    2.  Which are the top 10 countries with the most transactions?
    3.  What is the total transaction amount for each currency?
    4.  What is the average transaction amount?
    5.  How many transactions are there per month?
    6.  What is the total transaction amount for each destination country?

**2. SQL Analysis:**
*   Import the CSV into a database table.
*   Write a SQL query using a `WHERE` clause with the `IN` operator to select all transactions connected to the high-risk countries.
*   Use `GROUP BY` to summarize the total transaction volume for each high-risk country.

**Questions to Answer with SQL:**
1. What is the total number of transactions and the total amount for transactions involving at least one high-risk country?
2. How much money has been sent *from* each high-risk country?
3. How much money has been sent *to* each high-risk country?
4. Which 5 customers have sent the most money to high-risk countries in total?
5. What is the average transaction amount for transactions involving high-risk countries versus those not involving high-risk countries?
6. List all transactions to 'North Korea' with an amount greater than $50,000.
7. How many transactions occurred each month in 2023 that involved 'Iran' as either the source or destination country?
8. Which destination countries receive the most money from 'Panama'? List the top 3.
9. What is the total transaction amount for each currency when the source country is a high-risk country?
10. Identify any customers who have conducted transactions with more than one high-risk country. List the customer and the number of distinct high-risk countries they've transacted with.

**3. Power BI Visualization:**
*   Connect to the transaction data.
*   Create a calculated column to flag transactions as `HighRisk` if they involve a country from the list.
*   Build a dashboard that includes:
    *   A map showing the flow of funds between countries.
    *   A bar chart comparing the total transaction volume for each high-risk country.
    *   A table detailing the flagged high-risk transactions.
    *   **Additional Visualization Ideas:**
        *   A slicer to filter the dashboard by specific high-risk countries.
        *   Cards to display key metrics like "Total High-Risk Transaction Amount" and "High-Risk Transaction Count".
        *   A treemap to visualize the proportion of the total transaction amount for each high-risk country.
        *   A line chart showing the trend of high-risk transactions over time (by month or year).
        *   A KPI visual to track the number of high-risk transactions against a set threshold.
