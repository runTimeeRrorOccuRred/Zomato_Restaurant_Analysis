# 🍽️ Zomato Restaurant Analysis

## 📌 Project Overview
This project explores and analyzes **Zomato restaurant data** to uncover actionable insights into restaurant trends, pricing patterns, customer ratings, cuisine diversity, and digital adoption.  
The goal is to help **restaurant owners, investors, and food enthusiasts** better understand market dynamics in India and across other countries.

---

## 🎯 Objectives
- Analyze **restaurant pricing trends** and customer **rating distribution**.  
- Compare **restaurant service offerings** like table booking and online delivery.  
- Identify **top-performing cuisines** and restaurant types.  
- Compare **India’s restaurant market** with other countries.  
- Assess **digital adoption** and **market penetration**.  

---

## 🛠️ Tools & Technologies
- **Database**: MS SQL Server  
- **Language**: SQL (Structured Query Language)   
- **Data Analysis**: SQL Joins, Aggregations, and Case Statements

---

## 📂 Dataset
The dataset consists of two main tables:
1. **Country_data** – Includes country codes and country names.  
2. **Restaurant_data** – Contains details like restaurant name, city, cuisines, price range, ratings, votes, cost for two, and service features.
download dataset.

[country_data](dataset/Country-Code.csv)

[zomato_data](dataset/Zomato_Dataset.csv)
---

## 🔍 Key Analyses Performed
1. **Overall Market Statistics (India)**  
   - Average cost for two, average ratings, total restaurants, and city count.  

2. **Top 10 Indian Cities**  
   - Ranked by number of restaurants, cost, and ratings.  

3. **Pricing Segments vs Ratings**  
   - Impact of pricing range on ratings.  

4. **Service Offering Comparison**  
   - Table booking vs online delivery adoption.  

5. **Top 15 Cuisines**  
   - Most popular cuisines with cost, ratings, and votes.  

6. **Budget vs Premium Segments**  
   - Cost, votes, and digital adoption comparison.  

7. **City-Wise Rating Distribution**  
   - Excellent, good, bad, and unrated restaurants.  

8. **Dining Costs Across Countries**  
   - Average cost comparison across global markets.  

9. **Digital Service Adoption**  
   - City-level adoption of online services.  

10. **Top Rated Restaurants (India)**  
    - Highly rated restaurants with high votes.  

11. **India vs Other Countries**  
    - Market comparison based on features and adoption.  

12. **Market Penetration Analysis**  
    - Compare penetration in India, USA, UAE, Singapore, and Australia.  

13. **Cuisine Diversity by City**  
    - City-level culinary diversity analysis.  

---

## 📊 Sample Insights
- India shows a **wide range of pricing**, with premium restaurants having higher votes and ratings.  
- **Online delivery adoption** is strong in urban cities, while smaller cities lag.  
- Certain cuisines dominate the market, showing a concentrated demand pattern.  
- Market penetration is highest in **India** and **UAE**, while countries like the **US** and **Singapore** show fewer Zomato-listed restaurants.  

---

## 📜 SQL Queries
The project includes **well-documented SQL scripts** to reproduce all analyses:
- Aggregation queries
- Grouping and sorting
- Conditional logic using `CASE`
- Joins between multiple tables
- Analytical metrics (penetration rates, diversity counts)

You can find the full SQL code in [zomato_restaurant_analysis_query.sql](./zomato_restaurant_analysis_queries.sql)

---



