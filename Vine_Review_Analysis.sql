--Step 1. Filter data and create a table to retrieve all the rows 
--where the total_votes count is equal to or greater than 20
create table helpful_reviews as
  select * 
  from vine_table 
  where total_votes >= 20;
  
select * from helpful_reviews;

--Step 2. Filter data and create a table to retrieve all the rows 
--where the number of helpful_votes divided by total_votes is equal to or greater than 50%.
create table helpful_votes as
	select * 
	from helpful_reviews 
	where CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

select * from helpful_votes;

--Step 3. Filter data and create a table to retrieve all the rows 
--where a review was written as part of the Vine program (paid)
create table paid_reviews as
	select * 
	from helpful_votes 
	where vine = 'Y';

select * from paid_reviews;

--Step 4. Filter data and create a table to retrieve all the rows where the review was not part of the Vine program (unpaid)
create table unpaid_reviews as
	select * 
	from helpful_votes 
	where vine <> 'Y';

select * from unpaid_reviews;

--Step 5a. Determine the total number of paid and non-paid reviews 
select count(*) as number_paid_reviews
from paid_reviews;

select count(*) as number_unpaid_reviews
from unpaid_reviews; 

--Step 5b. determine the number of 5-star reviews and the percentage of 5-star reviews for the paid reviews
select count(review_id) as number_5star_paid, 
		count(review_id) * 1.0/(select count(*) from paid_reviews) as pct_5star_paid
from paid_reviews
where star_rating = '5'

-- Step 5c. determine the number of 5-star reviews, and the percentage of 5-star reviews for the unpaid review
select count(review_id) as number_5star_unpaid, 
		count(review_id) * 1.0/(select count(*) from unpaid_reviews) as pct_5star_unpaid
from unpaid_reviews
where star_rating = '5'

--Delivery 3: Additional query to support bias statement
--Count number of purchases that have been verified for paid and unpaid reviews
select vine, count(verified_purchase) as total_purchase_verified
from helpful_votes
group by vine