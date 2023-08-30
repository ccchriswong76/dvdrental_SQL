# DVD Rental SQL Analysis Notebook

This comprehensive analysis notebook focuses on exploring the intricacies of a PostgreSQL Sample Database, particularly the DVD rental domain. Leveraging PostgreSQL 15 and PgAdmin 4, the notebook delves into data relationships, customer behaviors, sentiment analysis, and film revenue metrics.

**Tools Used: PostgreSQL 15, PgAdmin 4**

**Data Source:** [PostgreSQL Sample Database](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)

**ER Diagram:** [Download PDF](https://github.com/ccchriswong76/dvdrental_SQL/blob/48a78287e7286cdf6038130f5e5b4297efada2b4/printable%20postgresql%20sample%20database%20digram.psd.pdf)


## Table of Contents

## [1. Investigating Relationships between Amount, Rental Rate, Return Date, and Rental Date](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price)
   - [1a. Total Loss due to Unreturned DVDs](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price/1a.csv) - Calculate the sum of replacement costs for DVDs that were not returned. Transform payment amount to 0 when DVDs are not returned.
   - [1b. Amount-Payment Discrepancies](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price/1b.csv) - Identify discrepancies between payment amount and rental rate. Analyze the difference between extra earnings and extra days due to late return charges.
   - [1c. Investigating Discrepancies in Extra Earnings and Extra Dates](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price/1c.csv) - Examine cases where the calculated extra earnings and extra days differ. Aggregate counts of such occurrences.
   - [1c.1 Investigating Near -1 Differences](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price/1c1.csv) - Explore records with a near -1 difference between extra earnings and extra days. Analyze potential rounding problems.
   - [1d. Investigating Records with Extra Differences below -1](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price/1d.csv) - Examine records with extra earnings minus extra days below -1. Review cases beyond rounding discrepancies.

## [2. Proportion of Customers by Store and Active Status](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/customer_analysis)
   - [2a. Customer Distribution by Store and Active Status](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/customer_analysis/2a.csv) - Calculate the count and percentage of customers based on store and active status.
   - [2b. Email Validation and Composition Check](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/customer_analysis/2b.csv) - Separate email addresses into components and validate their composition.
   - [2b.1 Breakdown Email Components](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/customer_analysis/2b.csv) - Separate email addresses into components such as first name, last name, and email domain.
   - [2b.2 Distinct Email Domains](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/customer_analysis/2c.csv) - List distinct email domains to verify domain validity.

## [3. Word Frequency Analysis](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/word_frequency_analysis)
   - [3a. Lexeme Table Creation](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/word_frequency_analysis/3a.csv) - Transform fulltext data type and break down words.
   - [3b. Lexeme Frequency Analysis](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/word_frequency_analysis/3b.csv) - Identify most frequently appearing lexemes.
   - [3c. Insight with "mad" Lexeme](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/word_frequency_analysis/3c.csv) - Explore insights related to the "mad" lexeme.

## [4. Overdue Customer Analysis](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Rental_return_analysis)
   - [4a. Customers Who Haven't Returned](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Rental_return_analysis/4a.csv) - Identify customers who have not returned DVDs.
   - [4b. Create Return Status](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Rental_return_analysis/4b.csv) - Create a view to categorize return status based on rental duration and return dates.
   - [4c. Customers Who Returned Later Than Expected](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Rental_return_analysis/4c.csv) - Identify customers who returned DVDs later than the expected duration.

## [5. Customer Segmentation RFM Model](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/RFM)
   - [5a. Sales Performance in Customer Level](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/RFM/5a.csv) - Calculate total sales, number of purchases, and latest payment day per customer.
   - [5b. Normalize Values](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/RFM/5b.csv) - Normalize recency, monetary value, and frequency for RFM analysis.
   - [5c. Calculate RFM Scores](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/RFM/5c.csv) - Calculate RFM scores in a 5-level scale based on normalized values.
   - [5d. Customer Segmentation](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/RFM/5d.csv) - Segment customers based on RFM scores into distinct categories.

## [6. Duplicate Check for Actor Table](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Actor_analysis)
   - [6a. Duplicate Actors](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Actor_analysis/6a.csv) - Check for duplicate actors based on their first name and last name.
   - [6b. Top 10 Actors by Film Count](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Actor_analysis/6b.csv) - Rank actors based on their film appearance count and display the top 10.

## [7. Pre-Query](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Pre_check)
   - [7a. Month Lookup Table](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Pre_check/7a.csv) - Create a lookup table for months and their corresponding values using different methods.
   - [7b. Movie Language Check](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Pre_check/7b.csv) - Check the distribution of films based on language and release year.
   - [7c. Rental and Payment Comparison](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Pre_check/7c.csv) - Identify rental records without corresponding payment records.

## [8. Film Revenue Analysis (Continued...)](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis)
   - [8a. Film Revenue Metrics Calculation](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8a.csv) - Calculate various metrics related to film revenue, including breakeven time of rental, rate of return, and breakeven day.
   - [8b. Average Film Key Performance Indicators (KPIs)](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8b.csv) - Calculate average rental duration, replacement cost, rental rate, breakeven time, rate of return, and breakeven day across films.
   - [8c. Revenue by Film](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8c.csv) - Calculate total sales expected and total count for each film based on rental records.
   - [8d. Revenue by Film with Extra Info](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8d.csv) - Join film revenue analysis with revenue by film data.
   - [8e. Actor List for Each Film](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8e.csv) - Generate a list of actors for each film using the film_actor and actor tables.
   - [8f. Join Actor List in Film Info](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8f.csv) - Join actor lists with film revenue data.
   - [8g. Actor Ranking](https://github.com/ccchriswong76/dvdrental_SQL/blob/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/Film_actor_analysis/8g.csv) - Rank actors based on their average film ranking, maximum rank, minimum rank, and film count. Filters out records with null film IDs.

## Purpose

This notebook serves as a comprehensive exploration of the PostgreSQL Sample Database within the DVD rental domain. By meticulously analyzing data and performing various analyses, the purpose of this notebook is to provide insights into relationships between different variables, customer behavior patterns, language distribution in movies, potential discrepancies in rental and payment records, and the financial performance of films based on metrics.

## Usage

- **Installation:** Make sure you have PostgreSQL 15 and PgAdmin 4 installed. The notebook assumes access to the PostgreSQL Sample Database.
- **Execution:** Execute each cell in order. Comments guide you through the analyses.

## Acknowledgments

The analysis utilizes the PostgreSQL Sample Database, PostgreSQL 15, and PgAdmin 4 for data manipulation and exploration. The purpose of the notebook is to uncover meaningful patterns and insights within the DVD rental dataset.
