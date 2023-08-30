# DVD_rental_SQL
PostgreSQL15/ Pg admin 4

Data source: [PostgreSQL Sample Database](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/)

ER diagram: [Download PDF](https://github.com/ccchriswong76/dvdrental_SQL/blob/48a78287e7286cdf6038130f5e5b4297efada2b4/printable%20postgresql%20sample%20database%20digram.psd.pdf)

## [Investigating Relationships between Amount, Rental Rate, Return Date, and Rental Date](https://github.com/ccchriswong76/dvdrental_SQL/tree/2017e8477e8c4af29bbd1dd470a4c3a4b4e3c7de/relationship_date_price)

### 1. Total Loss due to Unreturned DVDs
#### Purpose
Calculate the sum of replacement costs for DVDs that were not returned. Transform payment amount to 0 when DVDs are not returned.
#### Output
1a1

### 2. Amount-Payment Discrepancies
#### Purpose
Identify discrepancies between payment amount and rental rate. Analyze the difference between extra earnings and extra days due to late return charges.
#### Output
1b

### 3. Investigating Discrepancies in Extra Earnings and Extra Dates
#### Purpose
Examine cases where the calculated extra earnings and extra days differ. Aggregate counts of such occurrences.
#### Output
1c

### 4. Investigating Near -1 Differences
#### Purpose
Explore records with a near -1 difference between extra earnings and extra days. Analyze potential rounding problems.
#### Output
1c1

### 5. Investigating Records with Extra Differences below -1
#### Purpose
Examine records with extra earnings minus extra days below -1. Review cases beyond rounding discrepancies.
#### Output
1d

## Proportion of Customers by Store and Active Status

### 2a. Customer Distribution by Store and Active Status
#### Purpose
Calculate the count and percentage of customers based on store and active status.
#### Output
2a

### 2b. Email Validation and Composition Check

#### 2b.1. Breakdown Email Components
##### Purpose
Separate email addresses into components such as first name, last name, and email domain.
##### Output
2b

#### 2b.2. Distinct Email Domains
##### Purpose
List distinct email domains to verify domain validity.
##### Output
2c

#### 2b.3. Check Email Address Composition with Customer Name
##### Purpose
Validate email addresses by comparing components with customer names.
##### Output
None (No output if all email addresses are valid)

## Word Frequency Analysis

### 3a. Lexeme Table Creation
#### Purpose
Transform fulltext data type and break down words.
#### Output
3a (Limited)

### 3b. Lexeme Frequency Analysis
#### Purpose
Identify most frequently appearing lexemes.
#### Output
3b

### 3c. Insight with "mad" Lexeme
#### Purpose
Explore insights related to the "mad" lexeme.
#### Output
3c

## Overdue Customer Analysis

### 4a. Customers Who Haven't Returned
#### Purpose
Identify customers who have not returned DVDs.
#### Output
4a

### 4b. Create Return Status
#### Purpose
Create a view to categorize return status based on rental duration and return dates.
#### Output
4b (Limited to 10 records)

### 4c. Customers Who Returned Later Than Expected
#### Purpose
Identify customers who returned DVDs later than the expected duration.
#### Output
4c (Limited to 10 records)

## Customer Segmentation RFM Model

### 5a. Sales Performance in Customer Level
#### Purpose
Calculate total sales, number of purchases, and latest payment day per customer.
#### Output
5a

### 5b. Normalize Values
#### Purpose
Normalize recency, monetary value, and frequency for RFM analysis.
#### Output
5b

### 5c. Calculate RFM Scores
#### Purpose
Calculate RFM scores in 5-level scale based on normalized values.
#### Output
5c

### 5d. Customer Segmentation
#### Purpose
Segment customers based on RFM scores into distinct categories.
#### Output
5d

## Duplicate Check for Actor Table

### 6a. Duplicate Actors
#### Purpose
Check for duplicate actors based on their first name and last name.
#### Output
6a

### 6b. Top 10 Actors by Film Count
#### Purpose
Rank actors based on their film appearance count and display the top 10.
#### Output
6b

## Pre-Query

### 7a. Month Lookup Table
#### Purpose
Create a lookup table for months and their corresponding values using different methods.
#### Output
7a

### 7b. Movie Language Check
#### Purpose
Check the distribution of films based on language and release year.
#### Output
7b
Result: All movies are in English language and were released in 2006.

### 7c. Rental and Payment Comparison
#### Purpose
Identify rental records without corresponding payment records.
#### Output
7c
Result: There are 1452 records in the rental table that do not have corresponding payment records, suggesting possible discrepancies or unrecorded payments.

## Film Revenue Analysis (Continued...)

### 8a. Film Revenue Metrics Calculation
#### Purpose
Calculate various metrics related to film revenue, including breakeven time of rental, rate of return, and breakeven day.
#### Output
8a (Film revenue metrics for each film)

### 8b. Average Film Key Performance Indicators (KPIs)
#### Purpose
Calculate average rental duration, replacement cost, rental rate, breakeven time, rate of return, and breakeven day across films.
#### Output
8b (Average KPIs at film level)

### 8c. Revenue by Film
#### Purpose
Calculate total sales expected and total count for each film based on rental records.
#### Output
8c (Revenue and count for each film)

### 8d. Revenue by Film with Extra Info
#### Purpose
Join film revenue analysis with revenue by film data.
#### Output
8d (Combined film revenue and extra info)

### 8e. Actor List for Each Film
#### Purpose
Generate a list of actors for each film using the film_actor and actor tables.
#### Output
8e (Actor lists for each film)

### 8f. Join Actor List in Film Info
#### Purpose
Join actor lists with film revenue data.
#### Output
8f (Joined actor lists with film revenue)

### 8g. Actor Ranking
#### Purpose
Rank actors based on their average film ranking, maximum rank, minimum rank, and film count. Filters out records with null film IDs.
#### Output
8g (Ranked actor information)
