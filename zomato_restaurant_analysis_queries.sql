/* Q1. Get overall statistics for the Indian restaurant market. */

select avg(Average_Cost_for_two) as 'average cost',
avg(Rating) as 'avearge rating' ,
count(*) as 'number of restaurents',
count(distinct city) as 'Number of city' from Country_data cn
inner join restaurant_data rs
on cn.Country_Code=rs.CountryCode
where country='India'

/* Q2. Top 10 Indian cities with number of restaurant, average rating, average cost */

select top 10 City, count(*) as 'Number of restaurent',avg(Average_Cost_for_two) as 'avearge cost',
avg(Rating) as 'average rating'
from Country_data cn
inner join restaurant_data rn
on cn.Country_Code=rn.CountryCode
where Country='India'
group by City
order by 2 desc

/* Q3. Understand pricing segments and their relationship with ratings in India. */

select Price_range, avg(Rating) as 'average rating',
min(Average_Cost_for_two) as 'min cost for two',
max(Average_Cost_for_two) as 'max cost fo two' from Country_data cn
inner join restaurant_data rn
on cn.Country_Code=rn.CountryCode
where country='India'
group by Price_range
order by 1 desc

/* Q4. Compare restaurant types based on service offerings in India.
Online Delivery vs Dine-in Analysis */

select Has_Table_booking, Has_Online_delivery, 
count(*) 'Number of restaurant',
avg(Average_Cost_for_two) as 'average cost',
avg(rating) as 'avearge rating' from Country_data cn
inner join restaurant_data rn
on cn.Country_Code=rn.CountryCode
where country='India'
group by Has_Table_booking,Has_Online_delivery
order by 3 desc

/* Q5. Identify top 15 most popular cuisine types and their performance metrics in India. */


select top 15 Cuisines,avg(Average_Cost_for_two) as 'average cost',
avg(rating) as 'average rating', avg(votes) as 'average vote',count(*) as 'Number of restaurant' 
from restaurant_data rs
inner join Country_data cn
on cn.Country_Code=rs.CountryCode
where country='India'
group by Cuisines
order by 5 desc

/* Q6. Compare budget vs premium restaurant segments in India */

select 
case 
	when Price_range in (1,2) then 'Budget'
	when price_range in (3,4) then 'Premium'
end as segment,
count(*) as 'Number of restaurant',
avg(Average_Cost_for_two) as 'average cost',
max(Average_Cost_for_two) as 'Max cost',
avg(votes) as 'average vote',
avg(rating) as 'average rating',
sum(
case
	when Has_Table_booking='yes' then 1 else 0 end) as 'Table booking',
sum(
case 
	when has_online_delivery='yes' then 1 else 0 end) as 'Online booking'
from restaurant_data rs
inner join Country_data cn
on rs.CountryCode=cn.Country_Code
where country='India'
group by 
case 
	when Price_range in (1,2) then 'Budget'
	when price_range in (3,4) then 'Premium'
end 
order by 2 desc

/* Q7. City-wise Rating Distribution in Top 5 Indian Cities */

select top 5 city,
	count(*) as 'Number of restaurant',
	avg(rating)  as 'average rating',
	avg(Average_Cost_for_two) as 'average cost',
	sum(case 
		when rating >=4 then 1 else 0 end) as 'Excellent rating',
	sum(case
		when rating >=3 and rating <4 then 1 else 0 end) as 'Good rating',	
	sum(case
		when rating >=1 and rating <3 then 1 else 0 end) as 'Bad rating',
	sum(case
		when rating =0 then 1 else 0 end) as 'No rating'
	from Country_data cn
inner join restaurant_data rn
on rn.CountryCode=cn.Country_Code
where country='India'
group by city
order by 2 desc

/* Q8. Compare average dining costs across different countries */

select country,
avg(Average_Cost_for_two) as 'average cost'
from restaurant_data rn
inner join Country_data cn
on cn.Country_Code=rn.CountryCode
group by country
order by 2 desc

/* Q9. Analyze digital service adoption across Indian cities */

select city,count(*) as 'total number of restaurants',
sum(case
	when Has_Online_delivery='yes' or Has_Table_booking='yes'then 1 else 0 end) as 'digital adoption count'
from restaurant_data rn
inner join Country_data cn
on rn.CountryCode=cn.Country_Code
where country='India'
group by city
order by 2 desc

/* Q10. Top Rated Restaurants in India with High Vote Count */

select RestaurantName,Votes,
rating,Average_Cost_for_two,
Cuisines,
Locality,
City 
from restaurant_data rs
inner join Country_data cn
on rs.CountryCode=cn.Country_Code
where country='India' and Rating>=4 and Votes>=1000
order by 3 desc,2 desc

/* Q11. India vs Other Countries - Service Features Comparison */

select 
case when
		Country<>'India' then 'Other Country'
		else 'India' end as 'Countries',
count(*) as 'restaurent count',
avg(votes) as 'average votes',
round(avg(rating),2) as 'Average rating',
avg(average_cost_for_two) as 'Average cost',
sum(case when
			Has_Table_booking='Yes' and Has_Online_delivery='no' then 1 else 0 end) as 'Only table booking',
sum(case when
			Has_Table_booking='No' and Has_Online_delivery='Yes' then 1 else 0 end) as 'Only Online delivery',
sum(case when
			Has_Table_booking='Yes' and Has_Online_delivery='yes' then 1 else 0 end) as 'both service'
from restaurant_data rs
inner join Country_data cn
on rs.CountryCode=cn.Country_Code
group by case when
		Country<>'India' then 'Other Country'
		else 'India' end

/*1. Market Penetration Analysis - India vs International 
    - Compare Zomato's market presence and performance across key countries.
    - 'India', 'United States', 'UAE', 'Singapore', 'Australia'*/

select Country,
avg(average_cost_for_two) as 'Average cost',
avg(rating) as 'Average Rating',
avg(votes) as 'Average votes',
sum(case when
			has_table_booking='yes' or has_online_delivery='yes' then 1 else 0 end)*100/count(*)
			as 'Penetration Rate'
from restaurant_data rs
inner join Country_data cn
on cn.Country_Code=rs.CountryCode
where country in ('India','United States','UAE','Singapore','Australia')
group by country
order by 5 desc

/*2. Cuisine Diversity Analysis by Indian Cities
    - Measure culinary diversity across Indian cities.*/

select city, count(distinct Cuisines) as 'Different types of food'
from restaurant_data rs
inner join Country_data cn
on rs.CountryCode=cn.Country_Code
where country='India'
group by City
order by 2 desc

