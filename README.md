
# Urban Mobility Analytics
Ride Demand | Fare Trends | Driver Economics

## Project Overview
An exploratory business analytics project using MySQL and Microsoft Excel to examine urban mobility patterns, trip fares, pickup-location concentration and driver payout economics.

The project uses publicly available NYC Taxi & Limousine Commission (TLC) High Volume For-Hire Vehicle (HVFHV) data.

## Tools & Technologies
- MySQL – Data querying, aggregation and analysis
- Microsoft Excel – Data analysis, KPI reporting and dashboard visualisation

## Business Questions
1. How does ride demand vary by hour?
2. Which pickup locations have the highest trip volumes?
3. How does average fare change across trip-distance categories?
4. How do shared and non-shared rides compare in fare and driver pay?
5. What patterns can be observed in driver payout economics?

## Key Findings

- Analysed 20,000 chronological trip records.
- Medium-distance trips (2–5 miles) represented 36.35% of the trip sample.
- Short and medium trips together accounted for 67.95%.
- Average base fare increased from $12.11 for short trips to $55.92 for very long trips.
- Pickup Location 79 recorded the highest trip volume among the top 10 locations, with 520 trips.
- Shared rides represented approximately 3.81% of the trip sample.
- Average driver pay was $18.77 per trip.

## Dashboard
The Excel dashboard presents:
- Overall trip and fare KPIs
- Hourly ride demand
- Top pickup locations
- Trip volume by distance category
- Average fare by distance category
- Shared vs non-shared ride economics


## Methodology & Limitations
The trip-level analysis uses 20,000 chronological NYC HVFHV records covering approximately 00:00–00:36 on January 1, 2024. The hourly demand analysis uses a separate aggregate covering January 1–2, 2024.

The trip-level sample is not representative of the full day or two-day period. Shared and non-shared comparisons are descriptive and do not establish causation. Driver pay per mile does not account for waiting time or unpaid travel.

## Project Structure
- `data/` – Dataset files, where redistribution is permitted
- `sql/` – SQL queries used for analysis
- `excel/` – Excel workbook and dashboard
- `images/` – Dashboard screenshots

## Skills Demonstrated
SQL querying, data aggregation, business analysis, KPI development, data visualisation and communicating analytical findings.

## Data Source
NYC Taxi & Limousine Commission – High Volume For-Hire Vehicle (HVFHV) trip data.
