# 🚲 Google Data Analytics Capstone: Cyclistic Case Study  
*By Antwoine Johnson*  
[Certificate: Google Data Analytics Professional Certificate (Coursera)](https://www.coursera.org/professional-certificates/google-data-analytics)

---

## 📌 Quick Links
- [Project Overview](#project-overview)  
- [Ask](#ask)  
- [Prepare](#prepare)  
- [Process](#process)  
- [Analyze](#analyze)  
- [Share](#share)  
- [Act](#act)  
- [Tools Used](#tools-used)  

---

## 📖 Project Overview

In this capstone project for the Google Data Analytics Certificate, I analyzed a full year of public bike-share data from **Cyclistic**, a fictional Chicago-based company. The goal: identify behavioral differences between casual riders and annual members, then recommend a data-driven strategy to convert more casual riders into subscribers.

I used **BigQuery SQL** for data exploration and transformation, and **Tableau** for visual storytelling. The final deliverable outlines business insights and actionable marketing recommendations tailored to Cyclistic’s goals.

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
- Timeframe: **12 months** (May 2022 – April 2023)  
- Format: 12 individual `.csv` files
- License: [Here](https://divvybikes.com/data-license-agreement)
- Fields include:  
  - `ride_id`, `rideable_type`, `started_at`, `ended_at`, `start_station_name`, `end_station_name`, `member_casual`

### Data Limitations
- No demographic data (e.g., age, income)
- Weather and traffic data not included  
- Assumes anonymized user data still reflects real usage patterns

---

## 🧹 Process

### Cleaning Steps
Using **BigQuery SQL**, I:
- Combined all 12 months into one dataset (~5.7M rows)  
- Removed null values and entries with negative ride durations  
- Converted `started_at` and `ended_at` to datetime formats  
- Calculated new columns:  
  - `ride_length_minutes`  
  - `day_of_week`  
  - `hour_of_day`

### Quality Checks
- Validated station names  
- Filtered out test rides and docking station inconsistencies  
- Ensured no duplicate `ride_id`s

---

## 📊 Analyze

### Member vs Casual Rider Trends

| Metric                | Members              | Casual Riders          |
|----------------------|----------------------|------------------------|
| Average ride time     | ~12.5 minutes         | ~18.3 minutes           |
| Peak usage time       | Wednesday @ 5 PM      | Saturday @ 5 PM         |
| Bike type preference  | Classic bikes         | Docked bikes            |
| Purpose               | Likely commute        | Likely leisure          |

### Location Behavior

- **Start Locations:** Members and casual riders start at **similar central stations**  
- **End Locations:**  
  - **Casual riders** often end near **Navy Pier**, a tourist-heavy area  
  - **Members** often end in **West Loop Gate**, a business district — likely commuting to/from work

### Tableau Visualization
📍 **[View Tableau Map Here](https://public.tableau.com/views/TotalTripsEndStations/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)**  
This map shows high-overlap start locations, but clear geographic divergence in end locations between members and casuals.

---

## 📤 Share

### Summary Insights
- Members behave more like commuters: short rides during weekdays, especially peak hours.  
- Casual riders behave like tourists/leisure users: longer weekend rides, especially to scenic destinations.  
- A weekend-based offering could be a strong way to upsell casual users.

### Deliverables in This Repository
- [`SQL/`](./SQL): BigQuery queries for combining and analyzing trip data  
- [`Images/`](./Images): Tableau visualizations (if added)  
- [`README.md`](./README.md): Full case study explanation

---

## 🚀 Act

### Final Recommendation

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
