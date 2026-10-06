# IT Helpdesk Ticket Analysis

A data analytics project that cleans, models, and analyzes IT helpdesk ticket data using **MySQL** for data processing/SQL analysis and **Power BI** for interactive dashboard reporting.

## 📌 Project Overview

IT helpdesk teams handle thousands of tickets across departments, locations, and issue types. This project analyzes a dataset of **7,000 helpdesk tickets** to uncover:

- Ticket volume trends by department, location, and issue type
- Resolution time performance across teams
- SLA (Service Level Agreement) compliance — Met vs. Missed
- Team workload and efficiency
- Customer satisfaction patterns

The raw data was cleaned and validated in **MySQL**, then connected to **Power BI** to build an interactive dashboard for business reporting.

## 🗂️ Repository Contents

| File | Description |
|---|---|
| `IT_Helpdesk_Ticket_Analysis.csv` | Cleaned ticket-level dataset (7,000 records) |
| `IT_Helpdesk_Overview_Dashboard.pbit` | Power BI template file for the overview dashboard |
| `helpdesk_sql_queries.sql` | SQL scripts used for table setup, data cleaning, and analysis |
| `README.md` | Project documentation |

## 🧾 Dataset Description

Each row represents one helpdesk ticket with the following fields:

| Column | Description |
|---|---|
| `Ticket_ID` | Unique ticket identifier |
| `Created_Date` | Date the ticket was raised |
| `Resolved_Date` | Date the ticket was resolved |
| `Date_Check` | Data validation flag (OK / ERROR) |
| `Department` | Department that raised the ticket |
| `Location` | Office location |
| `Issue_Type` | Category of issue (Hardware, Software, Network, Access, Email, Printer) |
| `Priority` | Ticket priority level (Low / Medium / High / Critical) |
| `Assigned_Team` | Support team the ticket was routed to |
| `Status` | Current ticket status (Open / In Progress / Resolved / Closed) |
| `Device_Type` | Device associated with the ticket |
| `Resolution_Time_Hours` | Time taken to resolve the ticket (in hours) |
| `Satisfaction_Rating` | Customer satisfaction score (1–5) |
| `Employee_ID` | Employee who raised the ticket |
| `Resolution_Days` | Time taken to resolve the ticket (in days) |
| `SLA_Status` | Whether the ticket met or missed its SLA |

## 🛠️ Tools & Skills Used

- **MySQL** – database design, data cleaning, duplicate checks, aggregations
- **SQL** – GROUP BY, HAVING, CASE WHEN, date functions (`STR_TO_DATE`)
- **Power BI** – data modeling, DAX measures, interactive dashboard design
- **Data Cleaning** – standardizing inconsistent categories, date formatting, handling missing values

## 🔍 Data Cleaning Steps

During cleaning, the following issues were identified and addressed:

- Inconsistent text casing in `Issue_Type` (e.g., `Network` / `NETWORK` / `network`)
- Extra whitespace in `Department` values (e.g., `"HR "`)
- Missing/blank `Satisfaction_Rating` values for unresolved tickets
- Non-standard entries in `SLA_Status` (e.g., `"Unknown Priority: Critical"`)
- Date fields converted from text to proper `DATE` format using `STR_TO_DATE`
- Duplicate `Ticket_ID` checks performed before enforcing a primary key constraint

## 📊 Key Analysis Performed

- Total ticket volume and breakdown by issue type / department
- Average resolution time by issue type and by assigned team
- SLA compliance (Met vs. Missed) segmented by priority level
- Teams exceeding a 24-hour average resolution time (SLA risk indicator)

## 📈 Dashboard

The `.pbit` file contains a Power BI dashboard template covering:
- Ticket volume overview
- SLA compliance rate
- Resolution time by team and issue type
- Department and location-wise ticket distribution

> To use it: open the file in Power BI Desktop and connect it to `IT_Helpdesk_Ticket_Analysis.csv` when prompted.

## 🚀 How to Reproduce

1. Create the database and table using the provided SQL script.
2. Load `IT_Helpdesk_Ticket_Analysis.csv` into the `helpdesk_tickets` table.
3. Run the cleaning queries to standardize dates and categorical values.
4. Run the analysis queries to generate summary metrics.
5. Open the `.pbit` file in Power BI Desktop to explore the dashboard.

## 📬 Contact

Feel free to connect if you have questions or suggestions about this project.
