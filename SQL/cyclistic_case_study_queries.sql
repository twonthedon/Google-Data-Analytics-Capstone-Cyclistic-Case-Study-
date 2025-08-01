-- ========================================
-- COMBINING DATA
-- ========================================
CREATE OR REPLACE TABLE `rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined` AS (
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.July_24_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Aug_24_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Sept_24_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Oct_24_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Nov_24_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Dec_24_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Jan_25_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Feb_25_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.Mar_25_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.April_25_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.May_25_Trip_Data`
  UNION ALL
  SELECT * FROM `rareair23.Cyclistic_Trip_Data.June_25_Trip_Data`
);

-- ========================================
-- DATA EXPLORATION
-- ========================================

-- View schema
SELECT column_name, data_type
FROM rareair23.Cyclistic_Trip_Data.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '24_25_Trip_Data_Combined';

-- Check nulls per column
SELECT
  COUNTIF(ride_id IS NULL) AS null_ride_id_count,
  COUNTIF(rideable_type IS NULL) AS null_rideable_type_count,
  COUNTIF(started_at IS NULL) AS null_started_at_count,
  COUNTIF(ended_at IS NULL) AS null_ended_at_count,
  COUNTIF(start_station_name IS NULL) AS null_start_station_name_count,
  COUNTIF(start_station_id IS NULL) AS null_start_station_id_count,
  COUNTIF(end_station_name IS NULL) AS null_end_station_name_count,
  COUNTIF(end_station_id IS NULL) AS null_end_station_id_count,
  COUNTIF(start_lat IS NULL) AS null_start_lat_count,
  COUNTIF(start_lng IS NULL) AS null_start_lng_count,
  COUNTIF(end_lat IS NULL) AS null_end_lat_count,
  COUNTIF(end_lng IS NULL) AS null_end_lng_count,
  COUNTIF(member_casual IS NULL) AS null_member_casual_count
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined;

-- Check for duplicates
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined;

-- Get duplicate records
SELECT ride_id, COUNT(*) AS duplicate_count
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- Ride ID length
SELECT LENGTH(ride_id) AS length_ride_id, COUNT(*) AS no_of_rows
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined
GROUP BY length_ride_id;

-- Ride types
SELECT rideable_type, COUNT(*) AS count_of_type
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined
GROUP BY rideable_type
ORDER BY count_of_type DESC;

-- Check timestamps
SELECT COUNT(*) AS longer_than_a_day
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) >= 1440;

SELECT COUNT(*) AS less_than_a_minute
FROM rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE) <= 1;

-- ========================================
-- DATA CLEANING
-- ========================================
CREATE OR REPLACE TABLE `rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined` AS (
  SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length,
    FORMAT_DATETIME('%a', started_at) AS day_of_week,
    FORMAT_DATETIME('%b', started_at) AS month,
    start_station_name,
    end_station_name,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM `rareair23.Cyclistic_Trip_Data.24_25_Trip_Data_Combined`
  WHERE start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL
    AND end_lat IS NOT NULL
    AND end_lng IS NOT NULL
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) > 1
    AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) < 1440
);

-- Row count of cleaned table
SELECT COUNT(ride_id) AS no_of_rows
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined;

-- ========================================
-- DATA ANALYSIS
-- ========================================

-- Rideable type usage by rider type
SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

-- Trips per month
SELECT month, member_casual, COUNT(ride_id) AS total_trips
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY month, member_casual
ORDER BY member_casual;

-- Trips per day of week
SELECT day_of_week, member_casual, COUNT(ride_id) AS total_trips
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY day_of_week, member_casual
ORDER BY member_casual;

-- Trips per hour (12-hour format)
SELECT
  FORMAT_TIME('%I %p', EXTRACT(TIME FROM started_at)) AS hour_of_day_12hr,
  member_casual,
  COUNT(ride_id) AS total_trips
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY hour_of_day_12hr, member_casual, EXTRACT(HOUR FROM started_at)
ORDER BY member_casual, EXTRACT(HOUR FROM started_at);

-- Average ride duration per month
SELECT month, member_casual, AVG(ride_length) AS avg_ride_duration
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY month, member_casual
ORDER BY member_casual, month;

-- Average ride duration per day of week
SELECT day_of_week, member_casual, AVG(ride_length) AS avg_ride_duration
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY day_of_week, member_casual
ORDER BY member_casual, day_of_week;

-- Average ride duration per hour
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length) AS avg_ride_duration
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY hour_of_day, member_casual
ORDER BY member_casual, hour_of_day;

-- Start stations by rider type
SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY start_station_name, member_casual;

-- End stations by rider type
SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM rareair23.Cyclistic_Trip_Data.cleaned_24_25_Trip_Data_Combined
GROUP BY end_station_name, member_casual;
