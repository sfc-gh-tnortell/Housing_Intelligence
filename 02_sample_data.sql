-- ================================================================
-- HOUSING INTELLIGENCE SAMPLE DATA
-- ================================================================
-- This script populates the database with sample data for demonstration

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- INSERT SAMPLE CUSTOMERS
-- ================================================================
INSERT INTO CUSTOMERS VALUES
(1001, 'John', 'Smith', 'john.smith@email.com', '555-0101', '1985-03-15', 85000.00, 750, 'Full-time', 'Married', 2, 'Downtown', 300000.00, 450000.00, '2023-01-15'),
(1002, 'Sarah', 'Johnson', 'sarah.johnson@email.com', '555-0102', '1990-07-22', 95000.00, 720, 'Full-time', 'Single', 1, 'Suburbs', 250000.00, 350000.00, '2023-02-01'),
(1003, 'Michael', 'Brown', 'michael.brown@email.com', '555-0103', '1982-11-08', 120000.00, 780, 'Full-time', 'Married', 4, 'Family neighborhood', 400000.00, 600000.00, '2023-01-20'),
(1004, 'Emily', 'Davis', 'emily.davis@email.com', '555-0104', '1988-05-12', 78000.00, 680, 'Part-time', 'Single', 1, 'Urban', 200000.00, 300000.00, '2023-03-10'),
(1005, 'David', 'Wilson', 'david.wilson@email.com', '555-0105', '1975-09-30', 150000.00, 800, 'Self-employed', 'Married', 3, 'Waterfront', 500000.00, 800000.00, '2022-12-01'),
(1006, 'Jennifer', 'Miller', 'jennifer.miller@email.com', '555-0106', '1992-01-18', 65000.00, 650, 'Full-time', 'Single', 1, 'City center', 180000.00, 280000.00, '2023-02-15'),
(1007, 'Robert', 'Garcia', 'robert.garcia@email.com', '555-0107', '1980-06-25', 110000.00, 740, 'Full-time', 'Married', 2, 'Quiet neighborhood', 350000.00, 500000.00, '2023-01-08'),
(1008, 'Lisa', 'Martinez', 'lisa.martinez@email.com', '555-0108', '1987-12-03', 88000.00, 700, 'Full-time', 'Divorced', 2, 'School district', 280000.00, 400000.00, '2023-02-28'),
(1009, 'James', 'Anderson', 'james.anderson@email.com', '555-0109', '1983-04-14', 95000.00, 710, 'Full-time', 'Married', 3, 'Suburban', 320000.00, 450000.00, '2023-01-25'),
(1010, 'Amanda', 'Taylor', 'amanda.taylor@email.com', '555-0110', '1991-08-07', 72000.00, 690, 'Full-time', 'Single', 1, 'Metro area', 220000.00, 320000.00, '2023-03-05');

-- ================================================================
-- INSERT SAMPLE HOUSE CHARACTERISTICS
-- ================================================================
INSERT INTO HOUSE_CHARACTERISTICS VALUES
(2001, '123 Main St', 'Austin', 'TX', '78701', 3, 2.0, 1800, 7500, 2015, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Downtown', 'Austin ISD', 85, 'Low', '2023-01-10', 385000.00, 8500.00, 0.00),
(2002, '456 Oak Ave', 'Austin', 'TX', '78702', 2, 1.5, 1200, 6000, 2010, 'Condo', 1, false, false, false, 'Carpet', 'Central Air', 'Central Air', 'East Austin', 'Austin ISD', 78, 'Medium', '2023-01-15', 285000.00, 4200.00, 250.00),
(2003, '789 Pine Dr', 'Round Rock', 'TX', '78664', 4, 3.0, 2400, 9000, 2018, 'Single Family', 3, true, true, true, 'Tile', 'Central Air', 'Central Air', 'Westside', 'Round Rock ISD', 65, 'Low', '2023-01-20', 485000.00, 12000.00, 150.00),
(2004, '321 Elm St', 'Austin', 'TX', '78703', 2, 2.0, 1400, 5500, 2008, 'Townhouse', 2, false, true, false, 'Laminate', 'Central Air', 'Central Air', 'South Austin', 'Austin ISD', 82, 'Low', '2023-02-01', 325000.00, 6800.00, 180.00),
(2005, '654 Cedar Ln', 'Pflugerville', 'TX', '78660', 5, 4.0, 3200, 12000, 2020, 'Single Family', 3, true, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Heritage', 'Pflugerville ISD', 60, 'Low', '2023-02-05', 625000.00, 15500.00, 200.00),
(2006, '987 Birch Way', 'Austin', 'TX', '78704', 1, 1.0, 900, 4000, 2005, 'Condo', 1, false, false, false, 'Concrete', 'Window Unit', 'Window Unit', 'South First', 'Austin ISD', 90, 'Medium', '2023-02-10', 235000.00, 3500.00, 300.00),
(2007, '147 Maple St', 'Cedar Park', 'TX', '78613', 3, 2.5, 2000, 8500, 2016, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Northwest Hills', 'Leander ISD', 55, 'Low', '2023-02-15', 435000.00, 9800.00, 0.00),
(2008, '258 Walnut Ave', 'Austin', 'TX', '78705', 2, 1.5, 1300, 5800, 2012, 'Condo', 1, false, false, false, 'Vinyl', 'Central Air', 'Central Air', 'University Area', 'Austin ISD', 88, 'Medium', '2023-02-20', 295000.00, 5200.00, 275.00),
(2009, '369 Hickory Dr', 'Leander', 'TX', '78641', 4, 3.5, 2800, 11000, 2019, 'Single Family', 3, true, true, true, 'Tile', 'Central Air', 'Central Air', 'Crystal Falls', 'Leander ISD', 50, 'Low', '2023-02-25', 545000.00, 13200.00, 175.00),
(2010, '741 Spruce Ct', 'Austin', 'TX', '78746', 3, 2.0, 1750, 7200, 2014, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'West Lake Hills', 'Eanes ISD', 70, 'Low', '2023-03-01', 425000.00, 11000.00, 0.00),
(2011, '852 Redwood Blvd', 'Austin', 'TX', '78759', 2, 2.0, 1500, 6500, 2011, 'Condo', 2, false, false, false, 'Carpet', 'Central Air', 'Central Air', 'North Austin', 'Austin ISD', 75, 'Medium', '2023-03-05', 315000.00, 5800.00, 225.00),
(2012, '963 Poplar Ave', 'Georgetown', 'TX', '78628', 3, 2.5, 2100, 8800, 2017, 'Single Family', 2, false, true, false, 'Laminate', 'Central Air', 'Central Air', 'Downtown Georgetown', 'Georgetown ISD', 68, 'Low', '2023-03-10', 395000.00, 8900.00, 0.00);

-- ================================================================
-- INSERT SAMPLE HOUSE SALES
-- ================================================================
INSERT INTO HOUSE_SALES VALUES
(3001, 2001, 1001, '2023-03-15', 375000.00, 385000.00, 45, 'Financed', 101, 'Jane Agent', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 6.250, 8500.00, true, 378000.00, 'Inspection contingency', 'COMPLETED'),
(3002, 2002, 1002, '2023-03-20', 280000.00, 285000.00, 35, 'FHA', 102, 'Bob Realtor', 0.030, 8400.00, 'FHA', 14000.00, 266000.00, 6.500, 7200.00, true, 282000.00, 'Financing contingency', 'COMPLETED'),
(3003, 2003, 1003, '2023-04-01', 475000.00, 485000.00, 52, 'Conventional', 103, 'Carol Sales', 0.030, 14250.00, 'Conventional', 95000.00, 380000.00, 6.000, 12000.00, true, 480000.00, 'Appraisal contingency', 'COMPLETED'),
(3004, 2004, 1004, '2023-04-10', 315000.00, 325000.00, 38, 'VA', 104, 'David Broker', 0.030, 9450.00, 'VA', 0.00, 315000.00, 5.750, 6800.00, true, 318000.00, 'VA inspection', 'COMPLETED'),
(3005, 2005, 1005, '2023-04-15', 615000.00, 625000.00, 28, 'Cash', 105, 'Emma Homes', 0.025, 15375.00, 'Cash', 615000.00, 0.00, 0.000, 5200.00, true, 620000.00, 'None', 'COMPLETED'),
(3006, 2006, 1006, '2023-04-25', 225000.00, 235000.00, 42, 'FHA', 106, 'Frank Realty', 0.030, 6750.00, 'FHA', 11250.00, 213750.00, 6.750, 5800.00, true, 228000.00, 'Inspection contingency', 'COMPLETED'),
(3007, 2007, 1007, '2023-05-05', 425000.00, 435000.00, 48, 'Conventional', 107, 'Grace Property', 0.030, 12750.00, 'Conventional', 85000.00, 340000.00, 6.125, 9500.00, true, 430000.00, 'Appraisal contingency', 'COMPLETED'),
(3008, 2008, 1008, '2023-05-12', 290000.00, 295000.00, 33, 'Conventional', 108, 'Henry Estate', 0.030, 8700.00, 'Conventional', 58000.00, 232000.00, 6.375, 7800.00, true, 292000.00, 'None', 'COMPLETED'),
(3009, 2009, 1009, '2023-05-20', 535000.00, 545000.00, 25, 'Conventional', 109, 'Ivy Homes', 0.030, 16050.00, 'Conventional', 107000.00, 428000.00, 5.875, 11500.00, true, 540000.00, 'Inspection contingency', 'COMPLETED'),
(3010, 2010, 1010, '2023-05-28', 405000.00, 425000.00, 55, 'Conventional', 110, 'Jack Properties', 0.030, 12150.00, 'Conventional', 81000.00, 324000.00, 6.500, 9200.00, true, 410000.00, 'Appraisal contingency', 'COMPLETED');

-- ================================================================
-- VERIFY DATA INSERTION
-- ================================================================
SELECT 'CUSTOMERS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM CUSTOMERS
UNION ALL
SELECT 'HOUSE_CHARACTERISTICS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM HOUSE_CHARACTERISTICS
UNION ALL
SELECT 'HOUSE_SALES' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM HOUSE_SALES;

-- ================================================================
-- SAMPLE ANALYTICAL QUERIES FOR TESTING
-- ================================================================

-- Average sale price by property type
SELECT 
    hc.PROPERTY_TYPE,
    COUNT(*) AS SALES_COUNT,
    AVG(hs.SALE_PRICE) AS AVG_SALE_PRICE,
    MIN(hs.SALE_PRICE) AS MIN_SALE_PRICE,
    MAX(hs.SALE_PRICE) AS MAX_SALE_PRICE
FROM HOUSE_SALES hs
JOIN HOUSE_CHARACTERISTICS hc ON hs.HOUSE_ID = hc.HOUSE_ID
GROUP BY hc.PROPERTY_TYPE
ORDER BY AVG_SALE_PRICE DESC;

-- Customer demographics and purchase patterns
SELECT 
    c.MARITAL_STATUS,
    AVG(c.ANNUAL_INCOME) AS AVG_INCOME,
    AVG(hs.SALE_PRICE) AS AVG_PURCHASE_PRICE,
    COUNT(*) AS PURCHASE_COUNT
FROM CUSTOMERS c
JOIN HOUSE_SALES hs ON c.CUSTOMER_ID = hs.CUSTOMER_ID
GROUP BY c.MARITAL_STATUS;

COMMENT ON TABLE CUSTOMERS IS 'Contains demographic and financial information about home buyers';
COMMENT ON TABLE HOUSE_CHARACTERISTICS IS 'Detailed property information including location, size, features, and amenities';
COMMENT ON TABLE HOUSE_SALES IS 'Transaction records linking customers to properties with pricing and financing details';