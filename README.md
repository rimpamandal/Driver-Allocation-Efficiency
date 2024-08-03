# Driver Allocation Efficiency Optimization for OLA CABS

# Introduction

In the competitive landscape of the ride-hailing industry, companies like OLA CABS are constantly striving to optimize their operations for enhanced performance. Data analytics plays a pivotal role in improving service efficiency and customer satisfaction. This project is dedicated to analyzing booking and driver allocation data to uncover key trends and insights that can help OLA CABS refine its service delivery.
Our analysis will delve into various aspects of the data, such as peak demand areas, driver allocation efficiency, service status, and booking times. By employing advanced SQL techniques, we aim to generate actionable recommendations that will boost operational performance and address potential challenges. This project not only showcases our technical skills in SQL but also offers valuable business insights for OLA CABS to better serve its customers and maintain a competitive edge.

# Project Goal

The primary goal of the "Driver Allocation Efficiency Optimization for OLA CABS" project is to enhance the efficiency of driver allocation by leveraging data-driven insights. By analyzing booking and driver allocation data, this project aims to:

1. Identify Peak Demand Areas: Determine high-demand regions and times to optimize driver distribution and reduce wait times for customers.
2. Evaluate Driver Allocation Efficiency: Assess current driver allocation strategies to pinpoint inefficiencies and suggest improvements.
3. Analyze Service Performance: Examine various metrics related to service status, booking times, and driver activity to identify areas for operational enhancement.
4. Provide Actionable Recommendations: Develop data-driven recommendations to refine driver allocation processes, improve service coverage, and boost overall operational performance.

By achieving these goals, the project seeks to help OLA CABS improve its service delivery, enhance customer satisfaction, and maintain a competitive edge in the ride-hailing market.

# Data Description

This project utilizes two key tables to analyze and optimize driver allocation efficiency for OLA CABS: booking_details and localities_details.

**`booking_details` Table**

| **Column Name**      | **Data Type** | **Description**                                      |
|----------------------|---------------|------------------------------------------------------|
| `pickup_datetime`    | TEXT          | Date and time when the ride was requested           |
| `pickup_date`        | DATE          | Date of the ride request                            |
| `pickup_time`        | TIME          | Time of the ride request                            |
| `Pickup_Area`        | TEXT          | Area where the ride was requested                   |
| `DropArea`           | TEXT          | Destination area of the ride                        |
| `Booking_id`         | TEXT          | Unique booking identifier                           |
| `Booking_type`       | TEXT          | Type of booking (e.g., standard, premium)           |
| `Booking_mode`       | TEXT          | Mode of booking (e.g., app-based, call)             |
| `Driver_number`      | TEXT          | Identifier for the assigned driver                  |
| `Service_status`     | TEXT          | Status of the service (e.g., completed, canceled)   |
| `Status`             | INT           | Numeric status code (e.g., 1 for completed)        |
| `Fare`               | INT           | Fare amount charged                                 |
| `Distance`           | INT           | Distance traveled in kilometers                     |
| `confirmed_date`     | DATE          | Date when the booking was confirmed                 |
| `confirmed_time`     | TIME          | Time when the booking was confirmed                 |
| `day_type`           | VARCHAR(10)   | Type of day (e.g., weekday, weekend)                |

**`localities_details` Table**

| **Column Name** | **Data Type** | **Description**                         |
|-----------------|---------------|-----------------------------------------|
| `id`            | INT           | Unique identifier for the locality       |
| `Area`          | TEXT          | Name or description of the locality      |
| `city_id`       | INT           | Identifier for the city                  |
| `zone_id`       | INT           | Identifier for the zone within the city  |


# Methodology
To analyze the dataset and derive actionable insights, we employed a series of SQL techniques:

1. Data Extraction: Retrieved relevant data from the booking_details and localities_details tables using SELECT queries.
2. Data Transformation: Cleaned and formatted data using SQL functions. Aggregated key metrics such as total fares, average distances, and booking counts.
3. Data Analysis: Identified trends and patterns by grouping and sorting data. Evaluated driver allocation efficiency and analyzed peak demand areas using SQL queries and JOIN operations.
4. Data Visualization: Created visualizations using reporting tools like Tableau or Power BI to illustrate key metrics and trends.
5. Insights and Recommendations: Derived insights from the data to make recommendations for optimizing driver allocation and improving service delivery.
6. Continuous Improvement: Suggested ongoing monitoring and automated reporting to track performance and address issues as they arise.

## Key Findings from Analysis
In this project, we performed a comprehensive analysis to extract valuable insights related to driver allocation and service efficiency. 
To provide a clearer understanding of the findings, the following charts and visualizations are included:

### 1. High-Demand Areas with Low Booking per Driver


![image](https://github.com/user-attachments/assets/0cecefe8-277e-40e0-8c6e-4bbf9a4f0f5b)


*Description:* This chart provides a comprehensive view of various areas categorized by booking volumes and booking per driver ratios. It visually represents high-demand areas with low booking per driver, significant booking volumes with low booking per driver, and areas with lower booking volumes but also low booking per driver ratios.

*Insight:*

1. High-Demand Areas with Low Booking per Driver: Zones such as the Airport Terminals and New Delhi Railway Station exhibit high booking volumes yet have a low booking per driver ratio, indicating potential inefficiencies in driver allocation.
2. Significant Booking Volumes with Low Booking per Driver: Areas like Noida Sector 62 and Hazrat Nizamuddin Railway Station also show high booking volumes but require improved driver distribution.
3. Lower Booking Volumes with Low Booking per Driver: Locations such as Gurgaon D Phase 3 and Phase 5 have lower booking volumes and low booking per driver ratios, suggesting an opportunity for better driver redistribution to balance demand and improve efficiency.

### 2. High Cancellation and Pending Rates


![image](https://github.com/user-attachments/assets/fe11646d-2747-4a70-9c87-637874a78613)


*Description:* This chart shows the distribution of completed, pending, and canceled bookings.

*Insight:* Completed bookings account for 52.5% of the total, while pending and canceled bookings make up nearly 40%. This high rate of cancellations and pending bookings highlights a need for improved booking management processes to reduce cancellations and increase completion rates.

### 3. Peak Demand Times


![image](https://github.com/user-attachments/assets/cc83702f-9ddf-4547-8d78-b96d48a03ea7)


*Description:* This chart illustrates booking volume peaks and drops throughout the day.

*Insight:* Booking volumes peak between 5 AM and 6 AM, with a significant drop during late evening and night hours. Optimizing driver allocation to handle these early morning peaks can enhance service efficiency and customer satisfaction.

### 4. Weekly Booking Trends


![image](https://github.com/user-attachments/assets/7cd93139-d787-41d5-8ba2-d91e1429b7d0)


*Description:* This chart displays booking trends across different days of the week.

*Insight:* Bookings peak on Fridays with 405 bookings, while weekends show lower activity compared to weekdays. Weekdays account for 67% of bookings, indicating a need for more driver resources during weekdays, especially on Fridays.

### 5. High Simultaneous Booking Rates

**Areas:** Airport Terminal 1 (156 simultaneous bookings), Noida Sector 62, and Hazrat Nizamuddin Railway Station (132 each)


![image](https://github.com/user-attachments/assets/ac13d0cc-6429-4744-9dfb-ce87cc01f72a)


*Description:* This chart shows areas with high simultaneous booking rates.

*Insight:* High simultaneous bookings in these areas suggest a need for sufficient driver coverage to manage peak periods effectively and avoid service delays.

### 6. Area-wise Cancellation and Completion Rate


![image](https://github.com/user-attachments/assets/7d18f633-72c3-48df-a0e5-86d41eb44365)


*Description:* This analysis examines the cancellation and completion rates across various areas, helping to identify service efficiency and potential issues.

*Insights:*
1. Airport Terminal 1 and Airport Terminal 3 have high activity with balanced completion (46%, 50%) and moderate cancellation rates (18%, 16%).
2. Noida Sector 62 and Noida Sector 27 show high cancellation rates (72%, 86%) and low completion, indicating potential service issues.
3. Old Delhi Railway Station and Indrapuram have excellent completion rates (100%, 89%) with no cancellations, highlighting strong service.
4. Pitampura and Gurgaon D Phase 5 also demonstrate high completion, suggesting effective driver allocation.

This summary helps identify areas needing improvement and those performing well, guiding strategic enhancements in service efficiency.


## Recommendations

### 1. Redistribute Drivers to High-Demand Areas

**Focus Areas:** Airport Terminals (T1 and T3), New Delhi Railway Station, Noida Sector 62, Hazrat Nizamuddin Railway Station

**Action:** Increase driver allocation to these high-demand areas where the booking per driver ratio is low. Implement real-time dynamic allocation to optimize service and minimize inefficiencies.

### 2. Reallocate Drivers from Low-Demand Areas

**Focus Areas:** Gurgaon D Phase 3 and Phase 5

**Action:** Assess and adjust driver distribution from these lower-demand zones to regions with higher booking volumes to balance workload and improve efficiency.

### 3. Enhance Management of Canceled Bookings

**Current Insight:** Canceled bookings account for nearly 40% of the total.

**Action:** Reduce cancellations and improve handling of canceled bookings by refining booking confirmation processes and enhancing customer support.

### 4. Optimize Driver Allocation During Peak Hours

**Current Insight:** Peak demand occurs from 5 AM to 6 AM with up to 121 bookings.

**Action:** Allocate more drivers during these early morning peak hours and adjust schedules to manage demand effectively.

### 5. Adjust for Weekly Demand Patterns

**Current Insight:** Peak bookings on Fridays and weekdays; lower on weekends.

**Action:** Increase driver availability on Fridays and weekdays to handle higher booking volumes. For weekends, reduce the number of active drivers to match lower demand.

### 6. Address High Simultaneous Booking Rates

**Focus Areas:** Airport Terminal 1, Noida Sector 62, Hazrat Nizamuddin Railway Station

**Action:** Ensure adequate driver coverage in areas with high simultaneous booking rates to prevent delays and enhance customer satisfaction. Monitor these areas and adjust driver allocation based on real-time data.

### 7. Implement Data-Driven Allocation Strategies

**Action:** Use historical booking data to inform driver allocation decisions. Develop or adopt algorithms and software tools to analyze booking patterns and optimize real-time driver distribution.


## Conclusion

This project provides a comprehensive analysis of driver allocation and booking efficiency, leveraging data to uncover actionable insights and improve service delivery. By identifying high-demand areas, addressing inefficiencies in driver distribution, and optimizing booking management, we can enhance operational performance and customer satisfaction.

The recommendations focus on strategic driver redistribution, managing peak demand effectively, and employing data-driven strategies to align resources with real-time needs. Implementing these strategies will help balance driver workload, reduce cancellations, and ensure efficient service across all areas.

Continuous monitoring and adjustment based on real-time data will be crucial in maintaining optimal performance and adapting to changing demand patterns. Through these efforts, we aim to significantly improve ride-hailing operations, benefiting both drivers and customers alike.


## Contact Information

For questions or further information, please contact:
- **Name:** Rimpa Mandal
- **Email:** rimpamandal786@gmail.com
- **LinkedIn:** https://www.linkedin.com/in/rimpamandal-1137382a2













