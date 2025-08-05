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

In this capstone project for the Google Data Analytics Certificate, I will perdorm real world task of a junior data analyst for  a fictional Chicago-based company **Cyclistic**, I analyzed the previous 12 months of public bike-share data. 

The goal: identify behavioral differences between casual riders and annual members, then recommend a data-driven strategy to convert more casual riders into subscribers.

I used **BigQuery SQL** for data exploration and transformation, and **Tableau** for visual storytelling. The final deliverable outlines business insights and actionable marketing recommendations tailored to Cyclistic’s goals.

---
## About
### Cyclistic

 A bike-share program that features more than 5,800 bicycles and 600
docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand
tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for
traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more
likely to ride for leisure, but about 30% use the bikes to commute to work each day.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to
broad consumer segments. One approach that helped make these things possible was the
flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as casual riders.
Customers who purchase annual memberships are Cyclistic members.

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
Using **BigQuery SQL**,
- Combined all 12 months into one dataset (~5.7M rows)  
- Removed null values and entries with negative ride durations  
- Converted `started_at` and `ended_at` to datetime formats  
- Calculated new columns:  
  - `ride_length_minutes`  
  - `day_of_week`  
  - `hour_of_day`
 
 SQL Query: [Combining Data](https://github.com/twonthedon/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/f2cea5510054f2ef80783a7a7d8bfc3e458d237b/1.%20Combining%20Data)
### Quality Checks
- Validated station names  
- Filtered out test rides and docking station inconsistencies  
- Ensured no duplicate `ride_id`s
SQL Query:[Exploring Data](https://github.com/twonthedon/Google-Data-Analytics-Capstone-Cyclistic-Case-Study-/blob/cb19b5fdec44c927bdacf3a8370594b09e733582/2.%20%20Exploring%20Data%20in%20SQL)


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

### Tableau Visualization
📍 [View Tableau Map – Trip Start Locations- Chicago University](<div class='tableauPlaceholder' id='viz1754420974085' style='position: relative'><noscript><a href='#'><img alt='Total Trips from Start Stations ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;To&#47;TotalTripsfromStartStations&#47;Sheet1&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='TotalTripsfromStartStations&#47;Sheet1' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;To&#47;TotalTripsfromStartStations&#47;Sheet1&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1754420974085');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>)

This map shows high-overlap start locations between members and casuals.

📈 Visualizations

- [Ride Types Used – Member vs Casual](https://public.tableau.com/views/RideTypesUsed/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Trip End Locations – Navy Pier vs West Loop](https://public.tableau.com/views/TotalTripsEndStations/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Total Trips by Hour of Day](https://public.tableau.com/views/TotalTrips/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Total Trips by Day](https://public.tableau.com/views/TotalRidesperDay/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
- [Total Trips by Month](https://public.tableau.com/views/PerMonthtotals/Sheet1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
  


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
