-- ================================================================
-- HOUSING INTELLIGENCE MULTI-STATE SAMPLE DATA (2022-2023)
-- ================================================================
-- This script populates the database with comprehensive sample data
-- spanning 2 years across multiple states for Cortex Analyst and Search

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- INSERT CUSTOMERS (35 customers across multiple states)
-- ================================================================
INSERT INTO CUSTOMERS VALUES
-- Texas Customers (10)
(1001, 'John', 'Smith', 'john.smith@email.com', '555-0101', '1985-03-15', 85000.00, 750, 'Full-time', 'Married', 2, 'Texas Metro', 300000.00, 450000.00, '2021-01-15'),
(1002, 'Sarah', 'Johnson', 'sarah.johnson@email.com', '555-0102', '1990-07-22', 95000.00, 720, 'Full-time', 'Single', 1, 'Texas Suburbs', 250000.00, 350000.00, '2021-02-01'),
(1003, 'Michael', 'Brown', 'michael.brown@email.com', '555-0103', '1982-11-08', 120000.00, 780, 'Full-time', 'Married', 4, 'Texas Family Area', 400000.00, 600000.00, '2021-01-20'),
(1004, 'Emily', 'Davis', 'emily.davis@email.com', '555-0104', '1988-05-12', 78000.00, 680, 'Part-time', 'Single', 1, 'Texas Urban', 200000.00, 300000.00, '2021-03-10'),
(1005, 'David', 'Wilson', 'david.wilson@email.com', '555-0105', '1975-09-30', 150000.00, 800, 'Self-employed', 'Married', 3, 'Texas Luxury', 500000.00, 800000.00, '2020-12-01'),
(1006, 'Jennifer', 'Miller', 'jennifer.miller@email.com', '555-0106', '1992-01-18', 65000.00, 650, 'Full-time', 'Single', 1, 'Texas Urban', 180000.00, 280000.00, '2021-02-15'),
(1007, 'Robert', 'Garcia', 'robert.garcia@email.com', '555-0107', '1980-06-25', 110000.00, 740, 'Full-time', 'Married', 2, 'Texas Quiet', 350000.00, 500000.00, '2021-01-08'),
(1008, 'Lisa', 'Martinez', 'lisa.martinez@email.com', '555-0108', '1987-12-03', 88000.00, 700, 'Full-time', 'Divorced', 2, 'Texas Schools', 280000.00, 400000.00, '2021-02-28'),
(1009, 'James', 'Anderson', 'james.anderson@email.com', '555-0109', '1983-04-14', 95000.00, 710, 'Full-time', 'Married', 3, 'Texas Suburban', 320000.00, 450000.00, '2021-01-25'),
(1010, 'Amanda', 'Taylor', 'amanda.taylor@email.com', '555-0110', '1991-08-07', 72000.00, 690, 'Full-time', 'Single', 1, 'Texas Metro', 220000.00, 320000.00, '2021-03-05'),

-- California Customers (10)
(1011, 'William', 'Thompson', 'william.thompson@email.com', '555-0111', '1986-09-12', 145000.00, 760, 'Full-time', 'Married', 2, 'California Coast', 700000.00, 1000000.00, '2021-04-10'),
(1012, 'Jessica', 'White', 'jessica.white@email.com', '555-0112', '1993-02-28', 118000.00, 700, 'Full-time', 'Single', 1, 'California Tech', 500000.00, 750000.00, '2021-05-15'),
(1013, 'Christopher', 'Lee', 'christopher.lee@email.com', '555-0113', '1981-07-04', 185000.00, 790, 'Full-time', 'Married', 3, 'California Silicon Valley', 900000.00, 1400000.00, '2021-03-20'),
(1014, 'Ashley', 'Harris', 'ashley.harris@email.com', '555-0114', '1989-11-16', 92000.00, 680, 'Full-time', 'Single', 1, 'California Urban', 450000.00, 650000.00, '2021-06-01'),
(1015, 'Matthew', 'Clark', 'matthew.clark@email.com', '555-0115', '1984-05-30', 160000.00, 750, 'Full-time', 'Married', 4, 'California Family', 650000.00, 950000.00, '2021-04-25'),
(1016, 'Rachel', 'Turner', 'rachel.turner@email.com', '555-0116', '1990-06-14', 135000.00, 720, 'Full-time', 'Single', 1, 'California Bay Area', 600000.00, 850000.00, '2021-05-20'),
(1017, 'Kevin', 'Moore', 'kevin.moore@email.com', '555-0117', '1987-09-03', 125000.00, 730, 'Full-time', 'Married', 2, 'California Wine Country', 550000.00, 800000.00, '2021-06-10'),
(1018, 'Michelle', 'Wright', 'michelle.wright@email.com', '555-0118', '1992-12-08', 98000.00, 710, 'Full-time', 'Single', 1, 'California Central', 420000.00, 600000.00, '2021-07-01'),
(1019, 'Daniel', 'Lopez', 'daniel.lopez@email.com', '555-0119', '1985-04-17', 155000.00, 770, 'Self-employed', 'Married', 3, 'California Luxury', 750000.00, 1100000.00, '2021-05-05'),
(1020, 'Nicole', 'Hill', 'nicole.hill@email.com', '555-0120', '1988-11-22', 108000.00, 690, 'Full-time', 'Divorced', 2, 'California Suburban', 480000.00, 700000.00, '2021-06-25'),

-- Florida Customers (5)
(1021, 'Brian', 'Scott', 'brian.scott@email.com', '555-0121', '1983-01-22', 95000.00, 740, 'Full-time', 'Married', 3, 'Florida Golf', 350000.00, 550000.00, '2021-07-01'),
(1022, 'Stephanie', 'Green', 'stephanie.green@email.com', '555-0122', '1991-04-17', 82000.00, 700, 'Full-time', 'Single', 1, 'Florida Beach', 280000.00, 450000.00, '2021-07-15'),
(1023, 'Gregory', 'Adams', 'gregory.adams@email.com', '555-0123', '1980-09-05', 115000.00, 760, 'Full-time', 'Married', 2, 'Florida Luxury', 400000.00, 650000.00, '2021-08-01'),
(1024, 'Melissa', 'Baker', 'melissa.baker@email.com', '555-0124', '1988-12-11', 88000.00, 720, 'Full-time', 'Single', 1, 'Florida Urban', 320000.00, 480000.00, '2021-08-15'),
(1025, 'Anthony', 'Nelson', 'anthony.nelson@email.com', '555-0125', '1982-07-28', 105000.00, 750, 'Full-time', 'Married', 4, 'Florida Family', 380000.00, 580000.00, '2021-09-01'),

-- Colorado Customers (5)
(1026, 'Kimberly', 'Carter', 'kimberly.carter@email.com', '555-0126', '1986-02-14', 98000.00, 690, 'Full-time', 'Single', 1, 'Colorado Mountain', 420000.00, 620000.00, '2021-09-15'),
(1027, 'Joshua', 'Mitchell', 'joshua.mitchell@email.com', '555-0127', '1984-11-03', 125000.00, 730, 'Full-time', 'Married', 3, 'Colorado Ski', 480000.00, 750000.00, '2021-10-01'),
(1028, 'Laura', 'Perez', 'laura.perez@email.com', '555-0128', '1989-05-20', 85000.00, 680, 'Part-time', 'Single', 1, 'Colorado Urban', 380000.00, 550000.00, '2021-10-15'),
(1029, 'Ryan', 'Roberts', 'ryan.roberts@email.com', '555-0129', '1981-08-07', 135000.00, 770, 'Full-time', 'Married', 2, 'Colorado Tech', 500000.00, 750000.00, '2021-11-01'),
(1030, 'Samantha', 'Phillips', 'samantha.phillips@email.com', '555-0130', '1990-01-12', 92000.00, 710, 'Full-time', 'Single', 1, 'Colorado Outdoor', 400000.00, 600000.00, '2021-11-15'),

-- Arizona Customers (5)
(1031, 'Timothy', 'Campbell', 'timothy.campbell@email.com', '555-0131', '1987-03-25', 89000.00, 700, 'Full-time', 'Married', 2, 'Arizona Desert', 320000.00, 480000.00, '2021-12-01'),
(1032, 'Angela', 'Parker', 'angela.parker@email.com', '555-0132', '1985-06-18', 102000.00, 730, 'Full-time', 'Single', 1, 'Arizona Golf', 350000.00, 520000.00, '2021-12-15'),
(1033, 'Mark', 'Evans', 'mark.evans@email.com', '555-0133', '1983-10-30', 118000.00, 750, 'Self-employed', 'Married', 3, 'Arizona Luxury', 450000.00, 700000.00, '2022-01-01'),
(1034, 'Christina', 'Edwards', 'christina.edwards@email.com', '555-0134', '1991-07-12', 78000.00, 680, 'Full-time', 'Single', 1, 'Arizona Urban', 280000.00, 420000.00, '2022-01-15'),
(1035, 'Steven', 'Collins', 'steven.collins@email.com', '555-0135', '1988-12-04', 95000.00, 720, 'Full-time', 'Married', 2, 'Arizona Suburban', 340000.00, 510000.00, '2022-02-01');

-- ================================================================
-- INSERT HOUSE CHARACTERISTICS (60 properties across 5 states)
-- ================================================================
INSERT INTO HOUSE_CHARACTERISTICS VALUES
-- Texas Properties (15 properties)
(2001, '123 Main St', 'Austin', 'TX', '78701', 3, 2.0, 1800, 7500, 2015, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Downtown Austin', 'Austin ISD', 85, 'Low', '2022-01-10', 385000.00, 8500.00, 0.00),
(2002, '456 Oak Ave', 'Austin', 'TX', '78702', 2, 1.5, 1200, 6000, 2010, 'Condo', 1, false, false, false, 'Carpet', 'Central Air', 'Central Air', 'East Austin', 'Austin ISD', 78, 'Medium', '2022-01-15', 285000.00, 4200.00, 250.00),
(2003, '789 Pine Dr', 'Round Rock', 'TX', '78664', 4, 3.0, 2400, 9000, 2018, 'Single Family', 3, true, true, true, 'Tile', 'Central Air', 'Central Air', 'Round Rock West', 'Round Rock ISD', 65, 'Low', '2022-01-20', 485000.00, 12000.00, 150.00),
(2004, '321 Elm St', 'Austin', 'TX', '78703', 2, 2.0, 1400, 5500, 2008, 'Townhouse', 2, false, true, false, 'Laminate', 'Central Air', 'Central Air', 'South Austin', 'Austin ISD', 82, 'Low', '2022-02-01', 325000.00, 6800.00, 180.00),
(2005, '654 Cedar Ln', 'Pflugerville', 'TX', '78660', 5, 4.0, 3200, 12000, 2020, 'Single Family', 3, true, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Pflugerville Heritage', 'Pflugerville ISD', 60, 'Low', '2022-02-05', 625000.00, 15500.00, 200.00),
(2006, '987 Birch Way', 'Austin', 'TX', '78704', 1, 1.0, 900, 4000, 2005, 'Condo', 1, false, false, false, 'Concrete', 'Window Unit', 'Window Unit', 'South First', 'Austin ISD', 90, 'Medium', '2022-02-10', 235000.00, 3500.00, 300.00),
(2007, '147 Maple St', 'Cedar Park', 'TX', '78613', 3, 2.5, 2000, 8500, 2016, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Cedar Park Hills', 'Leander ISD', 55, 'Low', '2022-02-15', 435000.00, 9800.00, 0.00),
(2008, '258 Walnut Ave', 'Austin', 'TX', '78705', 2, 1.5, 1300, 5800, 2012, 'Condo', 1, false, false, false, 'Vinyl', 'Central Air', 'Central Air', 'University Area', 'Austin ISD', 88, 'Medium', '2022-02-20', 295000.00, 5200.00, 275.00),
(2009, '369 Hickory Dr', 'Leander', 'TX', '78641', 4, 3.5, 2800, 11000, 2019, 'Single Family', 3, true, true, true, 'Tile', 'Central Air', 'Central Air', 'Crystal Falls', 'Leander ISD', 50, 'Low', '2022-02-25', 545000.00, 13200.00, 175.00),
(2010, '741 Spruce Ct', 'Austin', 'TX', '78746', 3, 2.0, 1750, 7200, 2014, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'West Lake Hills', 'Eanes ISD', 70, 'Low', '2022-03-01', 425000.00, 11000.00, 0.00),
(2011, '852 Redwood Blvd', 'Austin', 'TX', '78759', 2, 2.0, 1500, 6500, 2011, 'Condo', 2, false, false, false, 'Carpet', 'Central Air', 'Central Air', 'North Austin', 'Austin ISD', 75, 'Medium', '2022-03-05', 315000.00, 5800.00, 225.00),
(2012, '963 Poplar Ave', 'Georgetown', 'TX', '78628', 3, 2.5, 2100, 8800, 2017, 'Single Family', 2, false, true, false, 'Laminate', 'Central Air', 'Central Air', 'Georgetown Historic', 'Georgetown ISD', 68, 'Low', '2022-03-10', 395000.00, 8900.00, 0.00),
(2013, '111 River Oaks Dr', 'Houston', 'TX', '77027', 5, 4.5, 4200, 15000, 2021, 'Single Family', 4, true, true, true, 'Marble', 'Central Air', 'Central Air', 'River Oaks', 'HISD', 72, 'Low', '2022-07-15', 1850000.00, 35000.00, 0.00),
(2014, '222 Memorial Dr', 'Houston', 'TX', '77024', 4, 3.0, 2800, 10000, 2019, 'Single Family', 3, false, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Memorial Villages', 'Spring Branch ISD', 75, 'Low', '2022-08-01', 925000.00, 18500.00, 0.00),
(2015, '333 Galleria Blvd', 'Houston', 'TX', '77056', 2, 2.5, 1600, 0, 2020, 'Condo', 2, false, false, false, 'Luxury Vinyl', 'Central Air', 'Central Air', 'Galleria', 'HISD', 85, 'Low', '2022-08-15', 485000.00, 8200.00, 450.00),

-- California Properties (15 properties)
(2016, '123 Beach Blvd', 'San Diego', 'CA', '92101', 2, 2.0, 1400, 5000, 2017, 'Condo', 1, false, false, false, 'Hardwood', 'Central Air', 'Central Air', 'Downtown San Diego', 'San Diego USD', 92, 'Low', '2022-03-05', 685000.00, 12500.00, 450.00),
(2017, '456 Tech Dr', 'San Jose', 'CA', '95110', 3, 2.5, 1800, 6500, 2019, 'Single Family', 2, false, true, false, 'Tile', 'Central Air', 'Central Air', 'Silicon Valley', 'San Jose USD', 75, 'Low', '2022-03-10', 925000.00, 18200.00, 0.00),
(2018, '789 Ocean View', 'Los Angeles', 'CA', '90210', 4, 3.0, 2600, 8000, 2021, 'Single Family', 3, true, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Beverly Hills', 'Beverly Hills USD', 88, 'Low', '2022-03-15', 1250000.00, 25800.00, 0.00),
(2019, '321 Sunset Ave', 'San Francisco', 'CA', '94102', 2, 1.5, 1200, 4500, 2014, 'Condo', 1, false, false, false, 'Hardwood', 'Central Air', 'Central Air', 'Mission District', 'SFUSD', 95, 'Medium', '2022-03-20', 785000.00, 14200.00, 520.00),
(2020, '654 Valley Rd', 'Sacramento', 'CA', '95814', 3, 2.0, 1900, 7200, 2016, 'Single Family', 2, false, true, false, 'Laminate', 'Central Air', 'Central Air', 'Midtown Sacramento', 'Sacramento USD', 72, 'Medium', '2022-03-25', 485000.00, 9800.00, 0.00),
(2021, '987 Highland St', 'Oakland', 'CA', '94601', 3, 2.5, 1650, 6000, 2013, 'Townhouse', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Oakland Hills', 'Oakland USD', 80, 'Medium', '2022-04-01', 625000.00, 11500.00, 285.00),
(2022, '147 Coast Hwy', 'Santa Barbara', 'CA', '93101', 4, 3.5, 2800, 9500, 2020, 'Single Family', 3, true, true, true, 'Tile', 'Central Air', 'Central Air', 'Santa Barbara Beach', 'Santa Barbara USD', 85, 'Low', '2022-04-05', 1125000.00, 22400.00, 0.00),
(2023, '258 University Ave', 'Palo Alto', 'CA', '94301', 2, 2.0, 1500, 5500, 2018, 'Condo', 2, false, false, false, 'Hardwood', 'Central Air', 'Central Air', 'Palo Alto University Area', 'Palo Alto USD', 90, 'Low', '2022-04-10', 895000.00, 16800.00, 675.00),
(2024, '369 Vineyard Ln', 'Napa', 'CA', '94558', 3, 2.5, 2400, 10000, 2019, 'Single Family', 3, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Napa Wine Country', 'Napa Valley USD', 58, 'Low', '2022-07-20', 1125000.00, 18500.00, 0.00),
(2025, '741 Lake Shore', 'Lake Tahoe', 'CA', '96150', 4, 3.0, 2800, 12000, 2018, 'Single Family', 3, false, true, true, 'Pine', 'Radiant Heat', 'None', 'Lake Tahoe Lakefront', 'Lake Tahoe USD', 45, 'Low', '2022-08-15', 1850000.00, 22500.00, 0.00),
(2026, '852 Silicon Dr', 'Mountain View', 'CA', '94041', 3, 2.5, 2000, 7500, 2020, 'Single Family', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Mountain View Tech', 'Mountain View Whisman', 82, 'Low', '2022-09-01', 1450000.00, 28500.00, 0.00),
(2027, '963 Marina Blvd', 'San Francisco', 'CA', '94123', 2, 2.0, 1300, 0, 2019, 'Condo', 1, false, false, false, 'Hardwood', 'Central Air', 'Central Air', 'Marina District', 'SFUSD', 95, 'Low', '2022-09-15', 1125000.00, 22400.00, 650.00),
(2028, '111 Rodeo Dr', 'Beverly Hills', 'CA', '90210', 5, 4.0, 3800, 12000, 2021, 'Single Family', 4, true, true, true, 'Marble', 'Central Air', 'Central Air', 'Beverly Hills Central', 'Beverly Hills USD', 88, 'Low', '2022-10-01', 2850000.00, 45000.00, 0.00),
(2029, '222 Lombard St', 'San Francisco', 'CA', '94133', 3, 2.5, 2200, 6000, 2017, 'Townhouse', 2, false, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Russian Hill', 'SFUSD', 98, 'Low', '2022-10-15', 1685000.00, 28200.00, 0.00),
(2030, '333 Sunset Strip', 'West Hollywood', 'CA', '90069', 2, 2.0, 1400, 0, 2020, 'Condo', 2, false, false, false, 'Hardwood', 'Central Air', 'Central Air', 'Sunset Strip', 'Los Angeles USD', 90, 'Medium', '2022-11-01', 895000.00, 16800.00, 485.00),

-- Florida Properties (10 properties)
(2031, '123 Bayshore Dr', 'Miami', 'FL', '33101', 2, 2.0, 1300, 0, 2019, 'Condo', 1, false, false, false, 'Tile', 'Central Air', 'Central Air', 'Miami Biscayne Bay', 'Miami-Dade', 88, 'Medium', '2022-04-15', 465000.00, 8200.00, 380.00),
(2032, '456 Golf Course Rd', 'Tampa', 'FL', '33602', 3, 2.5, 2100, 8500, 2017, 'Single Family', 2, false, true, false, 'Laminate', 'Central Air', 'Central Air', 'Tampa Westchase', 'Hillsborough', 65, 'Low', '2022-04-20', 385000.00, 7500.00, 0.00),
(2033, '789 Beach Walk', 'Fort Lauderdale', 'FL', '33301', 1, 1.0, 850, 0, 2015, 'Condo', 1, false, false, false, 'Tile', 'Central Air', 'Central Air', 'Fort Lauderdale Las Olas', 'Broward', 92, 'Low', '2022-04-25', 325000.00, 5800.00, 425.00),
(2034, '321 Palmetto St', 'Orlando', 'FL', '32801', 4, 3.0, 2400, 9000, 2018, 'Single Family', 3, true, true, true, 'Hardwood', 'Central Air', 'Central Air', 'Orlando Lake Nona', 'Orange County', 58, 'Low', '2022-05-01', 445000.00, 8900.00, 0.00),
(2035, '654 Sunset Blvd', 'Jacksonville', 'FL', '32202', 3, 2.0, 1800, 7000, 2016, 'Single Family', 2, false, true, false, 'Vinyl', 'Central Air', 'Central Air', 'Jacksonville Riverside', 'Duval County', 70, 'Medium', '2022-05-05', 295000.00, 5200.00, 0.00),
(2036, '987 Marina Way', 'Naples', 'FL', '34102', 2, 2.5, 1600, 6500, 2020, 'Condo', 2, false, false, false, 'Tile', 'Central Air', 'Central Air', 'Naples Waterfront', 'Collier County', 75, 'Low', '2022-05-10', 525000.00, 9800.00, 450.00),
(2037, '147 Key Biscayne', 'Key Biscayne', 'FL', '33149', 3, 3.0, 2100, 7500, 2020, 'Condo', 2, false, false, false, 'Marble', 'Central Air', 'Central Air', 'Key Biscayne Oceanfront', 'Miami-Dade', 85, 'Low', '2022-07-25', 875000.00, 15200.00, 650.00),
(2038, '258 South Beach', 'Miami Beach', 'FL', '33139', 2, 2.0, 1200, 0, 2019, 'Condo', 1, false, false, false, 'Modern Tile', 'Central Air', 'Central Air', 'South Beach Art Deco', 'Miami-Dade', 95, 'Medium', '2022-08-10', 685000.00, 12500.00, 525.00),
(2039, '369 Coral Gables', 'Coral Gables', 'FL', '33134', 4, 3.5, 2800, 9500, 2018, 'Single Family', 3, true, true, false, 'Hardwood', 'Central Air', 'Central Air', 'Coral Gables Historic', 'Miami-Dade', 78, 'Low', '2022-09-05', 1125000.00, 18500.00, 0.00),
(2040, '741 Clearwater', 'Clearwater', 'FL', '33755', 3, 2.5, 2000, 8000, 2017, 'Single Family', 2, false, true, false, 'Tile', 'Central Air', 'Central Air', 'Clearwater Beach Area', 'Pinellas County', 68, 'Low', '2022-09-20', 425000.00, 7800.00, 0.00),

-- Colorado Properties (10 properties)
(2041, '123 Mountain View Dr', 'Denver', 'CO', '80202', 3, 2.5, 2000, 7500, 2018, 'Single Family', 2, false, true, false, 'Hardwood', 'Forced Air', 'Central Air', 'Denver Highlands', 'Denver Public', 78, 'Low', '2022-05-15', 525000.00, 9200.00, 0.00),
(2042, '456 Ski Trail Rd', 'Boulder', 'CO', '80301', 4, 3.0, 2600, 9500, 2019, 'Single Family', 3, false, true, true, 'Hardwood', 'Radiant Heat', 'Central Air', 'Boulder Foothills', 'Boulder Valley', 82, 'Low', '2022-05-20', 685000.00, 12800.00, 0.00),
(2043, '789 Downtown Loft', 'Denver', 'CO', '80203', 2, 2.0, 1400, 0, 2017, 'Condo', 1, false, false, false, 'Concrete', 'Forced Air', 'Central Air', 'Denver RiNo', 'Denver Public', 95, 'Medium', '2022-05-25', 425000.00, 7500.00, 325.00),
(2044, '321 Aspen Grove', 'Colorado Springs', 'CO', '80903', 3, 2.0, 1900, 8000, 2016, 'Single Family', 2, false, true, false, 'Carpet', 'Forced Air', 'Central Air', 'Colorado Springs Old Town', 'District 11', 65, 'Low', '2022-06-01', 365000.00, 6200.00, 0.00),
(2045, '654 Tech Center', 'Aurora', 'CO', '80014', 2, 1.5, 1300, 5500, 2020, 'Townhouse', 2, false, false, false, 'Laminate', 'Forced Air', 'Central Air', 'Aurora DTC', 'Cherry Creek', 72, 'Low', '2022-06-05', 385000.00, 6800.00, 180.00),
(2046, '987 Valley View', 'Fort Collins', 'CO', '80521', 4, 3.5, 2700, 10000, 2021, 'Single Family', 3, true, true, true, 'Tile', 'Radiant Heat', 'Central Air', 'Fort Collins Harmony', 'Poudre School', 68, 'Low', '2022-06-10', 595000.00, 10500.00, 0.00),
(2047, '147 Ski Village', 'Vail', 'CO', '81657', 4, 3.5, 3200, 11000, 2021, 'Single Family', 3, true, true, true, 'Hardwood', 'Radiant Heat', 'Central Air', 'Vail Village Core', 'Eagle County', 70, 'Low', '2022-08-01', 2250000.00, 28500.00, 0.00),
(2048, '258 Steamboat', 'Steamboat Springs', 'CO', '80487', 3, 2.5, 2200, 8500, 2019, 'Single Family', 2, false, true, true, 'Hardwood', 'Radiant Heat', 'None', 'Steamboat Ski Area', 'Steamboat Springs', 45, 'Low', '2022-08-20', 945000.00, 12500.00, 0.00),
(2049, '369 Cherry Creek', 'Denver', 'CO', '80206', 2, 2.0, 1500, 0, 2020, 'Condo', 2, false, false, false, 'Hardwood', 'Central Air', 'Central Air', 'Cherry Creek', 'Denver Public', 88, 'Low', '2022-09-10', 685000.00, 12200.00, 425.00),
(2050, '741 Highlands Ranch', 'Highlands Ranch', 'CO', '80126', 4, 3.0, 2600, 9800, 2018, 'Single Family', 3, false, true, false, 'Laminate', 'Forced Air', 'Central Air', 'Highlands Ranch', 'Douglas County', 62, 'Low', '2022-09-25', 625000.00, 11200.00, 185.00),

-- Arizona Properties (10 properties)
(2051, '123 Desert Ridge Dr', 'Phoenix', 'AZ', '85001', 3, 2.0, 1950, 8500, 2017, 'Single Family', 2, true, false, false, 'Tile', 'Central Air', 'Central Air', 'Phoenix Ahwatukee', 'Phoenix Elementary', 55, 'Low', '2022-06-15', 385000.00, 6800.00, 0.00),
(2052, '456 Cactus Rd', 'Scottsdale', 'AZ', '85251', 4, 3.5, 2800, 12000, 2019, 'Single Family', 3, true, true, false, 'Travertine', 'Central Air', 'Central Air', 'Scottsdale North', 'Scottsdale USD', 45, 'Low', '2022-06-20', 675000.00, 11200.00, 0.00),
(2053, '789 University Dr', 'Tempe', 'AZ', '85281', 2, 1.5, 1200, 4500, 2015, 'Condo', 1, false, false, false, 'Laminate', 'Central Air', 'Central Air', 'Tempe Mill Avenue', 'Tempe Elementary', 88, 'Medium', '2022-06-25', 285000.00, 4500.00, 250.00),
(2054, '321 Golf Club Dr', 'Chandler', 'AZ', '85224', 3, 2.5, 2200, 9000, 2018, 'Single Family', 3, false, true, false, 'Tile', 'Central Air', 'Central Air', 'Chandler Ocotillo', 'Chandler USD', 52, 'Low', '2022-07-01', 425000.00, 7500.00, 0.00),
(2055, '654 Sunset Mesa', 'Tucson', 'AZ', '85701', 2, 2.0, 1500, 6500, 2016, 'Single Family', 2, false, false, false, 'Saltillo', 'Evaporative', 'Central Air', 'Tucson Foothills', 'Tucson USD', 60, 'Medium', '2022-07-05', 295000.00, 4200.00, 0.00),
(2056, '987 Mountain Park', 'Flagstaff', 'AZ', '86001', 3, 2.0, 1800, 7500, 2020, 'Single Family', 2, false, true, true, 'Hardwood', 'Forced Air', 'Swamp Cooler', 'Flagstaff Pine Canyon', 'Flagstaff USD', 65, 'Low', '2022-07-10', 485000.00, 6800.00, 0.00),
(2057, '147 Desert Oasis', 'Paradise Valley', 'AZ', '85253', 4, 4.0, 3500, 18000, 2020, 'Single Family', 4, true, true, false, 'Travertine', 'Central Air', 'Central Air', 'Paradise Valley Desert Mountain', 'Paradise Valley USD', 35, 'Low', '2022-08-05', 1450000.00, 18200.00, 0.00),
(2058, '258 Camelback', 'Phoenix', 'AZ', '85018', 3, 2.5, 2100, 8800, 2019, 'Single Family', 2, true, true, false, 'Tile', 'Central Air', 'Central Air', 'Phoenix Camelback', 'Phoenix Union', 58, 'Low', '2022-08-25', 485000.00, 8200.00, 0.00),
(2059, '369 Sedona Red Rock', 'Sedona', 'AZ', '86336', 2, 2.0, 1600, 7200, 2018, 'Single Family', 2, false, true, false, 'Tile', 'Central Air', 'Central Air', 'Sedona Red Rock', 'Sedona-Oak Creek', 42, 'Low', '2022-09-15', 625000.00, 8500.00, 0.00),
(2060, '741 Biltmore', 'Phoenix', 'AZ', '85016', 3, 3.0, 2400, 9500, 2020, 'Single Family', 3, true, true, false, 'Travertine', 'Central Air', 'Central Air', 'Phoenix Biltmore', 'Phoenix Elementary', 62, 'Low', '2022-10-05', 725000.00, 12500.00, 0.00);

-- ================================================================
-- VERIFY DATA INSERTION
-- ================================================================
SELECT 'CUSTOMERS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM CUSTOMERS
UNION ALL
SELECT 'HOUSE_CHARACTERISTICS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM HOUSE_CHARACTERISTICS
UNION ALL
SELECT 'Data loaded for' AS INFO, 'Multi-state analysis ready' AS STATUS;

-- ================================================================
-- SAMPLE ANALYTICAL QUERIES
-- ================================================================

-- State-by-state property analysis
SELECT 
    hc.STATE,
    COUNT(*) AS PROPERTY_COUNT,
    AVG(hc.LISTING_PRICE) AS AVG_LISTING_PRICE,
    MIN(hc.LISTING_PRICE) AS MIN_PRICE,
    MAX(hc.LISTING_PRICE) AS MAX_PRICE,
    AVG(hc.SQUARE_FOOTAGE) AS AVG_SQFT
FROM HOUSE_CHARACTERISTICS hc
GROUP BY hc.STATE
ORDER BY AVG_LISTING_PRICE DESC;

-- Property type distribution by state
SELECT 
    hc.STATE,
    hc.PROPERTY_TYPE,
    COUNT(*) AS COUNT,
    AVG(hc.LISTING_PRICE) AS AVG_PRICE
FROM HOUSE_CHARACTERISTICS hc
GROUP BY hc.STATE, hc.PROPERTY_TYPE
ORDER BY hc.STATE, AVG_PRICE DESC;

COMMENT ON TABLE CUSTOMERS IS 'Customer demographics and financial profiles across TX, CA, FL, CO, AZ markets';
COMMENT ON TABLE HOUSE_CHARACTERISTICS IS 'Property details for 60 homes across 5 states with diverse market segments';