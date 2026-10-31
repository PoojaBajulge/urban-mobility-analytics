USE uber_analytics;

CREATE TABLE IF NOT EXISTS uber_hourly_demand (
    pickup_hour INT,
    total_rides INT
);

TRUNCATE TABLE uber_hourly_demand;

INSERT INTO uber_hourly_demand (pickup_hour, total_rides) VALUES
(0,47252),(1,51385),(2,43454),(3,34964),
(4,25430),(5,20562),(6,22013),(7,29085),
(8,31207),(9,27361),(10,27008),(11,26718),
(12,27983),(13,30150),(14,33498),(15,34623),
(16,35975),(17,37432),(18,36919),(19,35401),
(20,33911),(21,31566),(22,28693),(23,24140);

SELECT * FROM uber_hourly_demand
ORDER BY pickup_hour;

-- UBER MOBILITY ANALYTICS PROJECT


-- 1. Overall Business Performance
SELECT
    COUNT(*) AS total_trips,
    ROUND(SUM(base_passenger_fare), 2) AS total_base_fare,
    ROUND(AVG(base_passenger_fare), 2) AS avg_base_fare,
    ROUND(AVG(trip_miles), 2) AS avg_trip_distance,
    ROUND(SUM(driver_pay), 2) AS total_driver_pay,
    ROUND(AVG(driver_pay), 2) AS avg_driver_pay
FROM uber_trips;

-- 2. Hourly Demand Analysis
SELECT
    pickup_hour,
    total_rides,
    ROUND(
        total_rides * 100.0 / SUM(total_rides) OVER (),
        2
    ) AS demand_percentage
FROM uber_hourly_demand
ORDER BY pickup_hour;

# to identify peak and lowest demands
SELECT
    pickup_hour,
    total_rides,
    CASE
        WHEN total_rides = (SELECT MAX(total_rides)
                            FROM uber_hourly_demand)
            THEN 'Peak Demand'
        WHEN total_rides = (SELECT MIN(total_rides)
                            FROM uber_hourly_demand)
            THEN 'Lowest Demand'
        ELSE 'Normal Demand'
    END AS demand_category
FROM uber_hourly_demand
ORDER BY total_rides DESC;

-- 3. Top Pickup Locations
SELECT
    PULocationID,
    COUNT(*) AS total_rides,
    ROUND(AVG(base_passenger_fare), 2) AS avg_base_fare,
    ROUND(AVG(trip_miles), 2) AS avg_trip_miles
FROM uber_trips
GROUP BY PULocationID
ORDER BY total_rides DESC
LIMIT 10;

-- 4. Driver Pay Per Mile
SELECT
    ROUND(SUM(driver_pay), 2) AS total_driver_pay,
    ROUND(SUM(trip_miles), 2) AS total_miles,
    ROUND(
        SUM(driver_pay) / NULLIF(SUM(trip_miles), 0), 2
    ) AS driver_pay_per_mile
FROM uber_trips;


-- 5. Trip Distance Analysis
SELECT
    CASE
        WHEN trip_miles < 2 THEN 'Short (<2 miles)'
        WHEN trip_miles < 5 THEN 'Medium (2-5 miles)'
        WHEN trip_miles < 10 THEN 'Long (5-10 miles)'
        ELSE 'Very Long (10+ miles)'
    END AS distance_category,
    COUNT(*) AS total_trips,
    ROUND(AVG(base_passenger_fare), 2) AS avg_base_fare
FROM uber_trips
GROUP BY distance_category
ORDER BY total_trips DESC;

-- 6. Shared vs Non-Shared Trips
SELECT
    shared_request_flag,
    COUNT(*) AS total_trips,
    ROUND(AVG(base_passenger_fare), 2) AS avg_base_fare,
    ROUND(AVG(driver_pay), 2) AS avg_driver_pay
FROM uber_trips
GROUP BY shared_request_flag;
