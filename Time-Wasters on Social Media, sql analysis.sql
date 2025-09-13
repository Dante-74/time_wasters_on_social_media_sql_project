
--Create TABLE

DROP TABLE IF EXISTS time_wasters;
CREATE TABLE time_wasters
			(
				UserID INT PRIMARY KEY,
				Age INT,
				Gender VARCHAR(15),
				Location VARCHAR(25),
				Income INT,
				Debt VARCHAR(10),
				Owns_Property VARCHAR(10),
				Profession VARCHAR(25),
				Demographics VARCHAR(10),	
				Platform VARCHAR(15),	
				Total_Time_Spent INT,
				Number_of_Sessions INT,	
				Video_ID INT,	
				Video_Category VARCHAR(25),	
				Video_Length INT,	
				Engagement INT,
				Importance_Score INT,
				Time_Spent_On_Video INT,
				Number_of_Videos_Watched INT,	
				Scroll_Rate INT,
				Frequency VARCHAR(15),
				ProductivityLoss INT,
				Satisfaction INT,
				Watch_Reason VARCHAR(25),
				DeviceType VARCHAR(20),
				OS VARCHAR(10),
				Watch_Time	TIME,
				Self_Control INT,
				Addiction_Level INT,
				CurrentActivity	VARCHAR(20),
				ConnectionType VARCHAR(20)
			);

SELECT * FROM time_wasters;

--Data Cleaning

SELECT 
	UserID, 
	Video_ID, 
	COUNT(*) AS duplicate_count
FROM time_wasters
GROUP BY UserID, Video_ID
HAVING COUNT(*) > 1;


--Data Exploration

SELECT 
	COUNT(*) AS total_records
FROM time_wasters;

SELECT *
FROM time_wasters
LIMIT 10;

SELECT 
	COUNT(DISTINCT UserID) AS unique_users
FROM time_wasters;

SELECT 
	Gender,
	COUNT(*) AS count
FROM time_wasters
GROUP BY Gender;


--Data Analysis & Business Key Problems & Answers

--Q1: What is the average income by profession and gender?
--Q2: Which age group has the highest average addiction level?
--Q3: Do property owners spend more time on social media than non-owners?
--Q4: Which platform has the highest engagement levels?
--Q5: Which device type is most commonly used to watch videos, and how many videos do they watch on average?
--Q6: Which video category drives the highest satisfaction scores?
--Q7: Do short, medium, or long videos lead to higher engagement?
--Q8: Which current activity suffers the highest productivity loss due to social media?
--Q9: Are higher-income users more engaged on average?
--Q10: Which location type (Urban vs Rural) has a higher scroll rate?
--Q11: How do watch reasons (entertainment vs information) affect user satisfaction?

--Q1: What is the average income by profession and gender?

SELECT 
	Profession, 
	Gender, 
	AVG(Income) AS avg_income
FROM time_wasters
GROUP BY Profession, Gender
ORDER BY 3 DESC;

--Q2: Which age group has the highest average addiction level?

SELECT CASE 
          WHEN Age BETWEEN 13 AND 19 THEN 'Teen'
          WHEN Age BETWEEN 20 AND 29 THEN '20s'
          WHEN Age BETWEEN 30 AND 39 THEN '30s'
          WHEN Age BETWEEN 40 AND 49 THEN '40s'
          ELSE '50+'
       END AS AgeGroup,
       AVG(Addiction_Level) AS avg_addiction
FROM time_wasters
GROUP BY AgeGroup
ORDER BY avg_addiction DESC;

--Q3: Do property owners spend more time on social media than non-owners?

SELECT 
	Owns_Property, 
	AVG(Total_Time_Spent) AS avg_time_spent
FROM time_wasters
GROUP BY Owns_Property;

--Q4: Which platform has the highest engagement levels?

SELECT 
	Platform, 
	AVG(Engagement) AS avg_engagement
FROM time_wasters
GROUP BY Platform
ORDER BY avg_engagement DESC;

--Q5: Which device type is most commonly used to watch videos, and how many videos do they watch on average?

SELECT 
	DeviceType,
	COUNT(UserID) AS total_users, 
	AVG(Number_Of_Videos_Watched) AS avg_videos
FROM time_wasters
GROUP BY DeviceType
ORDER BY avg_videos DESC;

--Q6: Which video category drives the highest satisfaction scores?

SELECT 
	Video_Category, 
	AVG(Satisfaction) AS avg_satisfaction
FROM time_wasters
GROUP BY Video_Category
ORDER BY avg_satisfaction DESC;

--Q7: Do short, medium, or long videos lead to higher engagement?

SELECT CASE 
          WHEN Video_Length < 5 THEN 'Short (<5 mins)'
          WHEN Video_Length BETWEEN 5 AND 20 THEN 'Medium (5-20 mins)'
          ELSE 'Long (20+ mins)'
       END AS VideoLengthCategory,
       AVG(Engagement) AS avg_engagement
FROM time_wasters
GROUP BY VideoLengthCategory
ORDER BY avg_engagement DESC;

--Q8: Which current activity suffers the highest productivity loss due to social media?

SELECT 
	CurrentActivity, 
	AVG(ProductivityLoss) AS avg_loss
FROM time_wasters
GROUP BY CurrentActivity
ORDER BY avg_loss DESC;

--Q9: Are higher-income users more engaged on average?

SELECT CASE 
          WHEN Income < 30000 THEN 'Low Income'
          WHEN Income BETWEEN 30000 AND 70000 THEN 'Mid Income'
          ELSE 'High Income'
       END AS IncomeGroup,
       AVG(Engagement) AS avg_engagement
FROM time_wasters
GROUP BY IncomeGroup
ORDER BY avg_engagement DESC;

--Q10: Which location type (Urban vs Rural) has a higher scroll rate?

SELECT 
	Demographics, 
	AVG(Scroll_Rate) AS avg_scroll_rate
FROM time_wasters
GROUP BY Demographics
ORDER BY avg_scroll_rate DESC;

--Q11: How do watch reasons (entertainment vs information) affect user satisfaction?

SELECT 
	Watch_Reason, 
	AVG(Satisfaction) AS avg_satisfaction
FROM time_wasters
GROUP BY Watch_Reason
ORDER BY avg_satisfaction DESC;

--End of Analysis
