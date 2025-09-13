# Time-Wasters on Social Media, SQL Project

##  Project Overview
The **"Time-Wasters on Social Media" dataset** provides a comprehensive look at how people interact with social media platforms. It covers user demographics, platform usage, content consumption, and behavioral factors such as **addiction, satisfaction, and productivity loss**.  

This project applies **SQL queries** to uncover insights on how social media impacts users’ time and productivity. It simulates real-world research questions that businesses, marketers, and social scientists may explore.  

---

##  Objectives
1. **Analyze user demographics** and how they influence social media behavior.  
2. **Compare platforms, devices, and content types** for engagement and satisfaction.  
3. **Examine the relationship between addiction, self-control, and productivity loss.**  
4. **Identify high-value segments** such as “power users” for business decisions.  

---

##  Dataset Description

This dataset was synthetically generated using **NumPy** and **pandas** to simulate real-world patterns.  

| Column | Description |
|--------|-------------|
| UserID | Unique identifier for each user |
| Age | Age of the user |
| Gender | Gender of the user |
| Location | Geographical location |
| Income | Annual income |
| Debt | Debt status (Yes/No) |
| Owns Property | Whether the user owns property (Yes/No) |
| Profession | Job title/profession |
| Demographics | Urban/Rural classification |
| Platform | Social media platform (Facebook, Instagram, TikTok, etc.) |
| Total Time Spent | Total time spent on platform |
| Number of Sessions | Total sessions logged |
| Video ID | Unique identifier of video watched |
| Video Category | Category of the video (Entertainment, Gaming, Vlog, etc.) |
| Video Length | Duration of the video (minutes) |
| Engagement | Engagement level (likes, comments, shares) |
| Importance Score | User’s perceived importance of the video |
| Time Spent On Video | Actual time user spent watching a video |
| Number of Videos Watched | Total number of videos watched |
| Scroll Rate | Speed at which the user scrolls through content |
| Frequency | How often the user logs in |
| Productivity Loss | Amount of productivity lost due to social media |
| Satisfaction | User’s satisfaction level with content |
| Watch Reason | Reason for watching (Entertainment, Information, etc.) |
| DeviceType | Device used (Mobile, Desktop, etc.) |
| OS | Operating system of device |
| Watch Time | Time of day video was watched |
| Self Control | User’s self-assessed self-control |
| Addiction Level | User’s self-assessed addiction to social media |
| Current Activity | What user was doing before using the platform |
| ConnectionType | Internet connection (Wi-Fi, Mobile Data) |

---

##  Research Questions & Queries (11)

**Q1: What is the average income by profession and gender?**

```sql
SELECT 
	Profession, 
	Gender, 
	AVG(Income) AS avg_income
FROM time_wasters
GROUP BY Profession, Gender
ORDER BY 3 DESC;
```

**Q2: Which age group has the highest average addiction level?**

```sql
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
```

**Q3: Do property owners spend more time on social media than non-owners?**

```sql
SELECT 
	Owns_Property, 
	AVG(Total_Time_Spent) AS avg_time_spent
FROM time_wasters
GROUP BY Owns_Property;
```

**Q4: Which platform has the highest engagement levels?**

```sql
SELECT 
	Platform, 
	AVG(Engagement) AS avg_engagement
FROM time_wasters
GROUP BY Platform
ORDER BY avg_engagement DESC;
```

**Q5: Which device type is most commonly used to watch videos, and how many videos do they watch on average?**

```sql
SELECT 
	DeviceType,
	COUNT(UserID) AS total_users, 
	AVG(Number_Of_Videos_Watched) AS avg_videos
FROM time_wasters
GROUP BY DeviceType
ORDER BY avg_videos DESC;
```

**Q6: Which video category drives the highest satisfaction scores?**

```sql
SELECT 
	Video_Category, 
	AVG(Satisfaction) AS avg_satisfaction
FROM time_wasters
GROUP BY Video_Category
ORDER BY avg_satisfaction DESC;
```

**Q7: Do short, medium, or long videos lead to higher engagement?**

```sql
SELECT CASE 
          WHEN Video_Length < 5 THEN 'Short (<5 mins)'
          WHEN Video_Length BETWEEN 5 AND 20 THEN 'Medium (5-20 mins)'
          ELSE 'Long (20+ mins)'
       END AS VideoLengthCategory,
       AVG(Engagement) AS avg_engagement
FROM time_wasters
GROUP BY VideoLengthCategory
ORDER BY avg_engagement DESC;
```

**Q8: Which current activity suffers the highest productivity loss due to social media?**

```sql
SELECT 
	CurrentActivity, 
	AVG(ProductivityLoss) AS avg_loss
FROM time_wasters
GROUP BY CurrentActivity
ORDER BY avg_loss DESC;
```

**Q9: Are higher-income users more engaged on average?**

```sql
SELECT CASE 
          WHEN Income < 30000 THEN 'Low Income'
          WHEN Income BETWEEN 30000 AND 70000 THEN 'Mid Income'
          ELSE 'High Income'
       END AS IncomeGroup,
       AVG(Engagement) AS avg_engagement
FROM time_wasters
GROUP BY IncomeGroup
ORDER BY avg_engagement DESC;
```

**Q10: Which location type (Urban vs Rural) has a higher scroll rate?**

```sql
SELECT 
	Demographics, 
	AVG(Scroll_Rate) AS avg_scroll_rate
FROM time_wasters
GROUP BY Demographics
ORDER BY avg_scroll_rate DESC;
```

 **Q11: How do watch reasons (entertainment vs information) affect user satisfaction?**

```sql
SELECT 
	Watch_Reason, 
	AVG(Satisfaction) AS avg_satisfaction
FROM time_wasters
GROUP BY Watch_Reason
ORDER BY avg_satisfaction DESC;
```

## Insights & Findings

**Demographics & Income**:

- Teens and users in their 20s show the highest addiction levels.

- Higher-income professionals tend to engage more with content.

- Urban users have higher scroll rates than rural users.

**Platforms, Devices & Content**:

- Mobile devices dominate usage and video consumption.

- Short videos (<5 mins) generate the most engagement.

- Entertainment content drives engagement, while informational videos boost satisfaction.

**Behavior & Productivity**:

- Users with low self-control show higher login frequency and addiction.

- Productivity loss is greatest when users were working or studying before logging in.

- “Power users” (above-average frequency, sessions, and engagement) represent the prime audience for marketers.

## Conclusion

The dataset shows that younger, urban, mobile-first users are the most engaged but also most vulnerable to addiction and productivity loss.

- Short-form entertainment content keeps users hooked but reduces productivity.

- Informational content improves satisfaction, suggesting room for value-driven content strategies.

- Businesses can focus on high-income, high-engagement “power users” for premium ad targeting, while researchers can explore the trade-off between social media engagement and real-life productivity.

## Author - Boluwatife Badejoko (Dante-74)

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!
