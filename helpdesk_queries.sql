  -- ============================================================
-- IT HELPDESK TICKET ANALYSIS PROJECT
-- ============================================================

-- ============================================================
-- SECTION 1: DATABASE & TABLE SETUP
-- ============================================================

-- Create the database for the project
  CREATE DATABASE it_helpdesk;
  
-- Check the structure of the table
describe  helpdesk_tickets;

-- Create the main table to store all helpdesk ticket records
  CREATE TABLE helpdesk_tickets (
    Ticket_ID              VARCHAR(20) PRIMARY KEY,
    Created_Date           DATE,
    Resolved_Date          VARCHAR(20),
    Date_Check             VARCHAR(10),
    Department             VARCHAR(50),
    Location               VARCHAR(50),
    Issue_Type             VARCHAR(50),
    Priority                VARCHAR(10),
    Assigned_Team           VARCHAR(50),
    Statuss                 VARCHAR(20),
    Device_Type             VARCHAR(50),
    Resolution_Time_Hours   DECIMAL(10,2),
    Satisfaction_Rating     VARCHAR(10),
    Employee_ID              VARCHAR(20),
    Resolution_Days         DECIMAL(10,3),
    SLA_Status               VARCHAR(40)
);

-- ============================================================
-- SECTION 2: DATA CLEANING & VALIDATION
-- ============================================================

-- Verify how many records were loaded into the table
SELECT COUNT(*) FROM helpdesk_tickets;
   
-- Convert Created_Date from text format (DD-MM-YYYY) to proper MySQL DATE format
UPDATE helpdesk_tickets 
SET Created_Date = STR_TO_DATE(Created_Date, '%d-%m-%Y');
   
-- Check for duplicate Ticket_IDs (data quality check)
   SELECT Ticket_ID, COUNT(*) 
   FROM helpdesk_tickets 
   GROUP BY Ticket_ID 
   HAVING COUNT(*) > 1;
   

-- ============================================================
-- SECTION 3: TICKET VOLUME ANALYSIS
-- ============================================================

-- Total number of tickets raised
SELECT COUNT(*) FROM helpdesk_tickets;

-- Ticket count by Issue Type
SELECT Issue_Type, COUNT(*) AS ticket_count
FROM helpdesk_tickets
GROUP BY Issue_Type;

-- Ticket count by Department (which departments raise the most tickets)
SELECT Department, COUNT(*) AS ticket_count
FROM helpdesk_tickets
GROUP BY Department;

-- ============================================================
-- SECTION 4: RESOLUTION TIME & PERFORMANCE ANALYSIS
-- ============================================================

-- Average resolution time by Issue_Type
SELECT Issue_Type, AVG(Resolution_Time_Hours) AS avg_hours
FROM helpdesk_tickets
GROUP BY Issue_Type;

-- Teams whose average resolution time exceeds 24 hours 
   SELECT Assigned_Team, AVG(Resolution_Time_Hours) AS avg_hours
FROM helpdesk_tickets
GROUP BY Assigned_Team
HAVING AVG(Resolution_Time_Hours) > 24;
   
-- ============================================================
-- SECTION 5: SLA COMPLIANCE ANALYSIS
-- ============================================================

-- SLA Met vs Missed count for each Priority level
   SELECT Priority,
       SUM(CASE WHEN SLA_Status='Met' THEN 1 ELSE 0 END) AS met,
       SUM(CASE WHEN SLA_Status='Missed' THEN 1 ELSE 0 END) AS missed
FROM helpdesk_tickets
GROUP BY Priority;


   
   
   
   