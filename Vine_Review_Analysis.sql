-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Step 1
Select * into df1
From vine_table
where total_votes >= 20;

-- Step 2
Select * into df2
From df1
where CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

-- Step 3
Select * into df3
From df2
where vine = 'Y';

-- Step 4
Select * into df4
From df2
where vine = 'N';

-- Step 5
-- a.total reviews
select count(*)
from vine_table;

-- b.5-stars
select count(*)
from vine_table
where star_rating = 5;

-- c.the percentage of 5-star reviews for paid
Select count(*), count(*) / Round((select count(*)
							from vine_table), 0) * 100 as percent
from df3
where star_rating = 5


-- d.the percentage of 5-star reviews for unpaid
Select count(*), count(*) / Round((select count(*)
							from vine_table), 0) * 100 as percent
from df4
where star_rating = 5



