# 🚲 Google Data Analytics Capstone: Cyclistic Case Study  
*By Antwoine Johnson*  
[Certificate: Google Data Analytics Professional Certificate (Coursera)](https://www.coursera.org/professional-certificates/google-data-analytics)

---

## 📌 TABLE OF CONTENTS
- [Project Overview](#project-overview)
- [About](#about)
- [Ask](#ask)
- [Prepare](#prepare)
- [Process](#process)
- [Analyze & Share](#analyze--share)
- [Act](#act)
- [Tools Used](#tools-used) 

---

## 📖 Project Overview

In this capstone project for the Google Data Analytics Certificate, I will perform real-world tasks of a junior data analyst for a fictional Chicago-based company, **Cyclistic**. I analyzed the previous 12 months of public bike-share data.

The goal: identify behavioral differences between casual riders and annual members, then recommend a data-driven strategy to convert more casual riders into subscribers.

I used **BigQuery SQL** for data exploration and transformation, and **Tableau** for visual storytelling. The final deliverable outlines business insights and actionable marketing recommendations tailored to Cyclistic’s goals.

---

## 🏙️ About

### Cyclistic

A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike.

The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

---

## ❓ Ask

### Business Challenge

Cyclistic is seeing strong usage from both casual riders and annual members. However, only annual members contribute to recurring revenue. The **Director of Marketing** wants to convert more casual riders into members and has asked for:

> "A comprehensive data analysis showing how our casual riders behave differently from members, so we can shape our marketing strategy accordingly."

### Key Stakeholders
- **Cyclistic Marketing Director** (Primary stakeholder)  
- **Executive Leadership Team**  
- **Product Team**  
- **Data & Business Analysts**

### Guiding Questions
- How do members and casual riders differ in terms of trip duration, frequency, day of week, and location patterns?  
- Are there distinct trends in **when** and **where** they ride?  
- What opportunities exist to create targeted promotions for casual riders?

---

## 📂 Prepare

### Data Sources

- Source: [Divvy Bike Share Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)  
- Timeframe: **12 months** (July 2024 – June 2025)  
- Format: 12 individual `.csv` files  
- License: [Divvy Data License Agreement](https://divvybikes.com/data-license-agreement)  
- Fields include:  
  - `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `end_station_name`, `member_casual`

### Data Limitations

- No demographic data (e.g., age, income)  
- Weather and traffic data not included  
- Assumes anonymized user data still reflects real usage patterns

---

## 🧹 Process

### Cleaning Steps

Using **BigQuery SQL**:
- Combined all 12 months into one dataset (~5.7M rows)  
- Removed null values and entries with negative ride durations  
- Converted `started_at` and `ended_at` to datetime formats  
- Calculated new columns:  
  - `ride_length_minutes`  
  - `day_of_week`  
  - `hour_of_day`  

🔗 [Combining Data SQL](https://github.com/twonthedon/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/f2cea5510054f2ef80783a7a7d8bfc3e458d237b/1.%20Combining%20Data)

### Quality Checks

- Validated station names  
- Filtered out test rides and docking station inconsistencies  
- Ensured no duplicate `ride_id`s  

🔗 [Exploring Data in SQL](https://github.com/twonthedon/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/cb19b5fdec44c927bdacf3a8370594b09e733582/2.%20%20Exploring%20Data%20in%20SQL)

---

## 📊 Analyze & 📤 Share

### Member vs Casual Rider Trends

| Metric                | Members              | Casual Riders          |
|----------------------|----------------------|------------------------|
| Average ride time     | ~11.8 minutes         | ~22.6 minutes           |
| Peak usage time       | Wednesday @ 5 PM      | Saturday @ 5 PM         |
| Bike type preference  | Classic bikes         | Classic bikes           |
| Purpose               | Likely commute        | Likely leisure          |

### Location Behavior

- **Start Locations:** Members and casual riders start at **similar central stations**  
- **End Locations:**  
  - **Casual riders** often end near **Navy Pier**, a tourist-heavy area  
  - **Members** often end in **West Loop Gate**, a business district — likely commuting to/from work  

📍 [Trip Start Locations – Chicago University (Tableau)](https://public.tableau.com/views/TotalTripsfromStartStations/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

### 📈 Tableau Visualizations

- [Ride Types Used – Member vs Casual](https://public.tableau.com/views/TotalRideTypesUsed/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
- [Trip End Locations – Lakeshore vs West Loop](https://public.tableau.com/views/TotalTripstoEndStations/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
- [Total Trips by Hour of Day](https://public.tableau.com/views/HourofDayTotals/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
- [Total Trips by Day](https://public.tableau.com/views/TotalTripsbyDay/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
- [Total Trips by Month](https://public.tableau.com/views/PerMonthtotals/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  

### Summary Insights

- Members behave more like commuters: short rides during weekdays, especially peak hours  
- Casual riders behave like tourists/leisure users: longer weekend rides, especially to scenic destinations  
- A weekend-based offering could be a strong way to upsell casual users  

### Deliverables in This Repository

- [`SQL/`](./SQL): BigQuery queries for combining and analyzing trip data  
- [`Images/`](./Images): Tableau visualizations (if added)  
- [`README.md`](./README.md): Full case study explanation  

---

## 🚀 Act

### Final Recommendation: Weekend Warrior Pass

Launch a targeted campaign called **"Weekend Warrior Pass"** for casual riders. This pass would:

- Offer discounted or unlimited rides on **Saturdays and Sundays**  
- Be promoted at high-tourism end locations like **Navy Pier**, **Lincoln Park**, etc.  
- Include messaging about faster ride access, savings, and weekend adventure perks  
- Serve as a funnel to eventually upgrade to annual membership  

This leverages insights about casual rider timing, trip length, and geography to meet them where they ride most.

---

## 🛠️ Tools Used

- **SQL (BigQuery):** Data cleaning, aggregation, joins  
- **Tableau:** Geospatial visualization and dashboard creation  
- **Google Sheets / Excel:** Light data validation  
- **GitHub:** Version control and presentation  
