-- ================================================================
-- HOUSING INTELLIGENCE CUSTOMER DATA V2 - 60 CUSTOMERS
-- ================================================================
-- Comprehensive customer profiles across 5 states (TX, CA, FL, CO, AZ)
-- Each customer will purchase exactly one house (1:1 relationship)

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- AGENTS DATA - Real estate professionals
-- ================================================================
INSERT INTO AGENTS VALUES
-- Texas Agents
(101, 'Sarah', 'Johnson', 'Keller Williams Austin', 'TX-LIC-45892', 'sarah.johnson@kw.com', '512-555-0101', 8, 'Luxury homes, first-time buyers', 45000000.00, 0.030, 'TX'),
(102, 'Michael', 'Chen', 'RE/MAX Texas', 'TX-LIC-67234', 'michael.chen@remax.com', '713-555-0102', 12, 'Investment properties, relocation', 67000000.00, 0.025, 'TX'),
(103, 'Jennifer', 'Williams', 'Coldwell Banker Austin', 'TX-LIC-89456', 'jennifer.williams@cb.com', '512-555-0103', 6, 'New construction, suburbs', 32000000.00, 0.030, 'TX'),
(104, 'David', 'Rodriguez', 'Century 21 Houston', 'TX-LIC-12789', 'david.rodriguez@c21.com', '713-555-0104', 15, 'Luxury estates, waterfront', 89000000.00, 0.025, 'TX'),

-- California Agents  
(105, 'Emily', 'Thompson', 'Compass San Francisco', 'CA-LIC-34567', 'emily.thompson@compass.com', '415-555-0105', 10, 'Tech professionals, condos', 125000000.00, 0.025, 'CA'),
(106, 'James', 'Park', 'Sotheby\'s Beverly Hills', 'CA-LIC-78901', 'james.park@sothebys.com', '310-555-0106', 18, 'Celebrity homes, luxury estates', 250000000.00, 0.020, 'CA'),
(107, 'Lisa', 'Zhang', 'Douglas Elliman Silicon Valley', 'CA-LIC-23456', 'lisa.zhang@elliman.com', '650-555-0107', 7, 'Tech executives, new developments', 78000000.00, 0.025, 'CA'),
(108, 'Robert', 'Garcia', 'Redfin Los Angeles', 'CA-LIC-56789', 'robert.garcia@redfin.com', '323-555-0108', 9, 'First-time buyers, millennials', 45000000.00, 0.030, 'CA'),

-- Florida Agents
(109, 'Maria', 'Martinez', 'Berkshire Hathaway Miami', 'FL-LIC-67890', 'maria.martinez@bhhsflorida.com', '305-555-0109', 11, 'Waterfront, international buyers', 85000000.00, 0.025, 'FL'),
(110, 'Christopher', 'Lee', 'Coldwell Banker Tampa', 'FL-LIC-90123', 'christopher.lee@cb.com', '813-555-0110', 13, 'Golf communities, retirees', 67000000.00, 0.030, 'FL'),
(111, 'Amanda', 'Davis', 'RE/MAX Orlando', 'FL-LIC-34567', 'amanda.davis@remax.com', '407-555-0111', 5, 'Family homes, vacation properties', 34000000.00, 0.030, 'FL'),

-- Colorado Agents
(112, 'Kevin', 'Miller', 'LIV Sotheby\'s Denver', 'CO-LIC-78901', 'kevin.miller@livsothebys.com', '303-555-0112', 14, 'Mountain properties, luxury ski homes', 95000000.00, 0.025, 'CO'),
(113, 'Rachel', 'Wilson', 'Engel & Völkers Boulder', 'CO-LIC-23456', 'rachel.wilson@evrealestate.com', '720-555-0113', 8, 'Eco-friendly homes, tech professionals', 56000000.00, 0.030, 'CO'),
(114, 'Nathan', 'Taylor', 'RE/MAX Colorado Springs', 'CO-LIC-56789', 'nathan.taylor@remax.com', '719-555-0114', 10, 'Military families, first-time buyers', 42000000.00, 0.030, 'CO'),

-- Arizona Agents
(115, 'Jessica', 'Brown', 'Russ Lyon Scottsdale', 'AZ-LIC-90123', 'jessica.brown@russlyon.com', '480-555-0115', 12, 'Desert luxury, golf communities', 78000000.00, 0.025, 'AZ'),
(116, 'Brandon', 'Smith', 'HomeSmart Phoenix', 'AZ-LIC-34567', 'brandon.smith@homesmart.com', '602-555-0116', 7, 'Retirees, investment properties', 45000000.00, 0.030, 'AZ'),
(117, 'Nicole', 'Johnson', 'Realty One Tucson', 'AZ-LIC-78901', 'nicole.johnson@realtyonegroup.com', '520-555-0117', 9, 'Family homes, relocations', 38000000.00, 0.030, 'AZ');

-- ================================================================
-- CUSTOMER DATA - 60 customers across 5 states (12 per state)
-- ================================================================
INSERT INTO CUSTOMERS VALUES
-- ================================================================
-- TEXAS CUSTOMERS (1001-1012) - 12 customers
-- ================================================================
(1001, 'Alexander', 'Richardson', 'alexander.richardson@email.com', '512-555-1001', '1988-03-15', 145000.00, 780, 'Full-time', 'Married', 3, 'Austin Metro', 450000.00, 650000.00, '2021-01-15', 'TX', 'Software Engineer', 'Dell Technologies', 6, 12083.33, 0.28, 85000.00, FALSE, 550000.00),
(1002, 'Sophia', 'Mitchell', 'sophia.mitchell@email.com', '512-555-1002', '1992-07-22', 89000.00, 720, 'Full-time', 'Single', 1, 'Austin Urban', 280000.00, 380000.00, '2021-02-01', 'TX', 'Marketing Manager', 'Indeed', 4, 7416.67, 0.22, 45000.00, TRUE, 320000.00),
(1003, 'Marcus', 'Thompson', 'marcus.thompson@email.com', '713-555-1003', '1985-11-08', 185000.00, 810, 'Full-time', 'Married', 4, 'Houston Luxury', 750000.00, 1200000.00, '2021-01-20', 'TX', 'Energy Executive', 'ExxonMobil', 12, 15416.67, 0.25, 180000.00, FALSE, 950000.00),
(1004, 'Isabella', 'Garcia', 'isabella.garcia@email.com', '210-555-1004', '1990-05-12', 72000.00, 685, 'Part-time', 'Single', 1, 'San Antonio', 220000.00, 310000.00, '2021-03-10', 'TX', 'Nurse', 'Methodist Hospital', 3, 6000.00, 0.35, 25000.00, TRUE, 280000.00),
(1005, 'William', 'Carter', 'william.carter@email.com', '512-555-1005', '1982-09-30', 165000.00, 795, 'Self-employed', 'Married', 2, 'Austin Tech', 600000.00, 850000.00, '2020-12-01', 'TX', 'Tech Consultant', 'Carter Consulting LLC', 8, 13750.00, 0.18, 125000.00, FALSE, 720000.00),
(1006, 'Olivia', 'Martinez', 'olivia.martinez@email.com', '713-555-1006', '1994-01-18', 68000.00, 650, 'Full-time', 'Single', 1, 'Houston Young Prof', 200000.00, 290000.00, '2021-02-15', 'TX', 'Teacher', 'Houston ISD', 2, 5666.67, 0.28, 22000.00, TRUE, 250000.00),
(1007, 'Ethan', 'Rodriguez', 'ethan.rodriguez@email.com', '512-555-1007', '1987-06-25', 128000.00, 745, 'Full-time', 'Married', 3, 'Austin Family', 450000.00, 580000.00, '2021-01-08', 'TX', 'Account Manager', 'Oracle', 5, 10666.67, 0.32, 68000.00, FALSE, 520000.00),
(1008, 'Ava', 'Hernandez', 'ava.hernandez@email.com', '713-555-1008', '1989-12-03', 95000.00, 705, 'Full-time', 'Divorced', 2, 'Houston Suburban', 350000.00, 475000.00, '2021-02-28', 'TX', 'Financial Analyst', 'JPMorgan Chase', 4, 7916.67, 0.24, 52000.00, FALSE, 420000.00),
(1009, 'Noah', 'Lopez', 'noah.lopez@email.com', '817-555-1009', '1986-04-14', 112000.00, 725, 'Full-time', 'Married', 4, 'Dallas-Fort Worth', 400000.00, 525000.00, '2021-01-25', 'TX', 'Project Manager', 'American Airlines', 7, 9333.33, 0.29, 75000.00, FALSE, 480000.00),
(1010, 'Emma', 'Wilson', 'emma.wilson@email.com', '512-555-1010', '1993-08-07', 78000.00, 695, 'Full-time', 'Single', 1, 'Austin Millennial', 250000.00, 350000.00, '2021-03-05', 'TX', 'UX Designer', 'Facebook', 3, 6500.00, 0.31, 35000.00, TRUE, 320000.00),
(1011, 'James', 'Anderson', 'james.anderson@email.com', '713-555-1011', '1984-10-19', 152000.00, 775, 'Full-time', 'Married', 2, 'Houston Energy', 550000.00, 750000.00, '2021-04-12', 'TX', 'Petroleum Engineer', 'Chevron', 9, 12666.67, 0.21, 95000.00, FALSE, 650000.00),
(1012, 'Charlotte', 'Taylor', 'charlotte.taylor@email.com', '512-555-1012', '1991-02-28', 85000.00, 710, 'Full-time', 'Single', 1, 'Austin Creative', 280000.00, 385000.00, '2021-05-20', 'TX', 'Graphic Designer', 'Whole Foods Market', 3, 7083.33, 0.26, 42000.00, TRUE, 350000.00),

-- ================================================================
-- CALIFORNIA CUSTOMERS (1013-1024) - 12 customers  
-- ================================================================
(1013, 'Liam', 'White', 'liam.white@email.com', '415-555-1013', '1987-07-04', 235000.00, 795, 'Full-time', 'Married', 2, 'San Francisco Tech', 950000.00, 1400000.00, '2021-03-20', 'CA', 'Senior Software Engineer', 'Google', 8, 19583.33, 0.24, 185000.00, FALSE, 1200000.00),
(1014, 'Mia', 'Harris', 'mia.harris@email.com', '310-555-1014', '1990-11-16', 125000.00, 690, 'Full-time', 'Single', 1, 'Los Angeles Entertainment', 550000.00, 750000.00, '2021-06-01', 'CA', 'Film Producer', 'Warner Bros', 5, 10416.67, 0.35, 78000.00, FALSE, 680000.00),
(1015, 'Benjamin', 'Clark', 'benjamin.clark@email.com', '650-555-1015', '1985-05-30', 195000.00, 760, 'Full-time', 'Married', 3, 'Silicon Valley', 780000.00, 1100000.00, '2021-04-25', 'CA', 'Product Manager', 'Apple', 7, 16250.00, 0.28, 145000.00, FALSE, 950000.00),
(1016, 'Harper', 'Lewis', 'harper.lewis@email.com', '619-555-1016', '1992-06-14', 98000.00, 715, 'Full-time', 'Single', 1, 'San Diego Beach', 450000.00, 620000.00, '2021-05-20', 'CA', 'Biotech Researcher', 'Illumina', 4, 8166.67, 0.33, 58000.00, TRUE, 550000.00),
(1017, 'Lucas', 'Walker', 'lucas.walker@email.com', '707-555-1017', '1988-09-03', 142000.00, 735, 'Full-time', 'Married', 2, 'Napa Wine Country', 650000.00, 900000.00, '2021-06-10', 'CA', 'Winery Manager', 'Opus One', 6, 11833.33, 0.22, 92000.00, FALSE, 780000.00),
(1018, 'Amelia', 'Hall', 'amelia.hall@email.com', '916-555-1018', '1993-12-08', 87000.00, 680, 'Full-time', 'Single', 1, 'Sacramento State', 380000.00, 520000.00, '2021-07-01', 'CA', 'State Employee', 'California DMV', 3, 7250.00, 0.29, 46000.00, TRUE, 460000.00),
(1019, 'Mason', 'Allen', 'mason.allen@email.com', '408-555-1019', '1986-04-17', 185000.00, 785, 'Self-employed', 'Married', 2, 'San Jose Tech', 750000.00, 1150000.00, '2021-05-05', 'CA', 'Tech Startup Founder', 'Allen Innovations', 5, 15416.67, 0.19, 165000.00, FALSE, 980000.00),
(1020, 'Evelyn', 'Young', 'evelyn.young@email.com', '510-555-1020', '1989-11-22', 118000.00, 705, 'Full-time', 'Divorced', 1, 'Oakland Urban', 520000.00, 680000.00, '2021-06-25', 'CA', 'Data Scientist', 'Uber', 4, 9833.33, 0.31, 72000.00, FALSE, 620000.00),
(1021, 'Elijah', 'King', 'elijah.king@email.com', '805-555-1021', '1984-01-11', 165000.00, 770, 'Full-time', 'Married', 3, 'Santa Barbara Coast', 700000.00, 1000000.00, '2021-07-15', 'CA', 'Real Estate Developer', 'Coastal Properties Inc', 10, 13750.00, 0.25, 125000.00, FALSE, 850000.00),
(1022, 'Abigail', 'Wright', 'abigail.wright@email.com', '760-555-1022', '1991-09-25', 92000.00, 685, 'Full-time', 'Single', 1, 'San Diego North', 420000.00, 580000.00, '2021-08-10', 'CA', 'Marketing Director', 'Qualcomm', 3, 7666.67, 0.27, 48000.00, TRUE, 520000.00),
(1023, 'Logan', 'Green', 'logan.green@email.com', '831-555-1023', '1987-12-30', 135000.00, 750, 'Full-time', 'Married', 2, 'Monterey Bay', 580000.00, 780000.00, '2021-09-05', 'CA', 'Marine Biologist', 'Monterey Bay Aquarium', 6, 11250.00, 0.23, 85000.00, FALSE, 700000.00),
(1024, 'Ella', 'Adams', 'ella.adams@email.com', '626-555-1024', '1992-03-18', 105000.00, 725, 'Full-time', 'Single', 1, 'Pasadena Tech', 480000.00, 640000.00, '2021-09-20', 'CA', 'Aerospace Engineer', 'JPL NASA', 4, 8750.00, 0.26, 62000.00, TRUE, 580000.00),

-- ================================================================
-- FLORIDA CUSTOMERS (1025-1036) - 12 customers
-- ================================================================
(1025, 'Jackson', 'Baker', 'jackson.baker@email.com', '305-555-1025', '1983-01-22', 125000.00, 745, 'Full-time', 'Married', 2, 'Miami Beach', 520000.00, 720000.00, '2021-07-01', 'FL', 'International Banker', 'Bank of America', 8, 10416.67, 0.31, 82000.00, FALSE, 650000.00),
(1026, 'Avery', 'Nelson', 'avery.nelson@email.com', '813-555-1026', '1990-04-17', 85000.00, 700, 'Full-time', 'Single', 1, 'Tampa Bay', 320000.00, 450000.00, '2021-07-15', 'FL', 'Healthcare Admin', 'Tampa General Hospital', 4, 7083.33, 0.28, 45000.00, TRUE, 400000.00),
(1027, 'Aiden', 'Carter', 'aiden.carter@email.com', '407-555-1027', '1986-09-05', 105000.00, 760, 'Full-time', 'Married', 3, 'Orlando Family', 380000.00, 520000.00, '2021-08-01', 'FL', 'Theme Park Manager', 'Disney World', 7, 8750.00, 0.26, 68000.00, FALSE, 480000.00),
(1028, 'Scarlett', 'Mitchell', 'scarlett.mitchell@email.com', '954-555-1028', '1988-12-11', 92000.00, 720, 'Full-time', 'Single', 1, 'Fort Lauderdale', 380000.00, 520000.00, '2021-08-15', 'FL', 'Cruise Line Executive', 'Royal Caribbean', 5, 7666.67, 0.25, 52000.00, TRUE, 460000.00),
(1029, 'Carter', 'Roberts', 'carter.roberts@email.com', '904-555-1029', '1985-07-28', 98000.00, 735, 'Full-time', 'Married', 2, 'Jacksonville', 350000.00, 480000.00, '2021-09-01', 'FL', 'Logistics Manager', 'CSX Transportation', 6, 8166.67, 0.29, 58000.00, FALSE, 430000.00),
(1030, 'Grace', 'Phillips', 'grace.phillips@email.com', '727-555-1030', '1991-02-14', 78000.00, 695, 'Full-time', 'Single', 1, 'St. Petersburg', 280000.00, 380000.00, '2021-09-15', 'FL', 'Museum Curator', 'Salvador Dalí Museum', 3, 6500.00, 0.32, 38000.00, TRUE, 340000.00),
(1031, 'Owen', 'Campbell', 'owen.campbell@email.com', '941-555-1031', '1987-11-03', 118000.00, 755, 'Full-time', 'Married', 1, 'Sarasota Arts', 450000.00, 620000.00, '2021-10-01', 'FL', 'Investment Advisor', 'Edward Jones', 8, 9833.33, 0.24, 78000.00, FALSE, 560000.00),
(1032, 'Chloe', 'Parker', 'chloe.parker@email.com', '561-555-1032', '1989-05-20', 88000.00, 680, 'Part-time', 'Single', 1, 'West Palm Beach', 330000.00, 450000.00, '2021-10-15', 'FL', 'Real Estate Agent', 'Coldwell Banker', 2, 7333.33, 0.27, 42000.00, TRUE, 400000.00),
(1033, 'Wyatt', 'Evans', 'wyatt.evans@email.com', '850-555-1033', '1984-08-07', 95000.00, 720, 'Full-time', 'Married', 4, 'Tallahassee Gov', 340000.00, 460000.00, '2021-11-01', 'FL', 'State Government', 'Florida Department of Health', 6, 7916.67, 0.30, 52000.00, FALSE, 420000.00),
(1034, 'Zoey', 'Collins', 'zoey.collins@email.com', '239-555-1034', '1990-01-12', 102000.00, 740, 'Full-time', 'Single', 1, 'Naples Luxury', 420000.00, 580000.00, '2021-11-15', 'FL', 'Resort Manager', 'Ritz-Carlton Naples', 5, 8500.00, 0.22, 68000.00, TRUE, 520000.00),
(1035, 'Grayson', 'Stewart', 'grayson.stewart@email.com', '321-555-1035', '1986-12-04', 89000.00, 705, 'Full-time', 'Married', 2, 'Space Coast', 320000.00, 440000.00, '2022-02-01', 'FL', 'Aerospace Engineer', 'NASA Kennedy Space Center', 4, 7416.67, 0.28, 48000.00, FALSE, 400000.00),
(1036, 'Layla', 'Morris', 'layla.morris@email.com', '352-555-1036', '1993-06-22', 72000.00, 665, 'Full-time', 'Single', 1, 'Gainesville University', 240000.00, 340000.00, '2022-01-15', 'FL', 'University Researcher', 'University of Florida', 2, 6000.00, 0.35, 28000.00, TRUE, 310000.00),

-- ================================================================
-- COLORADO CUSTOMERS (1037-1048) - 12 customers
-- ================================================================
(1037, 'Luke', 'Reed', 'luke.reed@email.com', '303-555-1037', '1985-02-14', 128000.00, 765, 'Full-time', 'Married', 2, 'Denver Tech', 480000.00, 650000.00, '2021-09-15', 'CO', 'Software Architect', 'Palantir', 7, 10666.67, 0.25, 85000.00, FALSE, 580000.00),
(1038, 'Zoe', 'Cook', 'zoe.cook@email.com', '720-555-1038', '1991-11-03', 95000.00, 715, 'Full-time', 'Single', 1, 'Boulder Outdoor', 420000.00, 580000.00, '2021-10-01', 'CO', 'Environmental Scientist', 'NCAR', 4, 7916.67, 0.29, 58000.00, TRUE, 520000.00),
(1039, 'Caleb', 'Bailey', 'caleb.bailey@email.com', '719-555-1039', '1987-05-20', 89000.00, 695, 'Full-time', 'Married', 3, 'Colorado Springs Military', 350000.00, 480000.00, '2021-10-15', 'CO', 'Air Force Officer', 'Peterson Air Force Base', 6, 7416.67, 0.31, 52000.00, FALSE, 430000.00),
(1040, 'Leah', 'Rivera', 'leah.rivera@email.com', '970-555-1040', '1989-08-07', 112000.00, 740, 'Full-time', 'Single', 1, 'Fort Collins University', 440000.00, 590000.00, '2021-11-01', 'CO', 'Veterinarian', 'Colorado State University', 5, 9333.33, 0.23, 72000.00, TRUE, 530000.00),
(1041, 'Ian', 'Cooper', 'ian.cooper@email.com', '303-555-1041', '1984-01-12', 145000.00, 780, 'Self-employed', 'Married', 2, 'Denver Business', 550000.00, 750000.00, '2021-11-15', 'CO', 'Business Consultant', 'Cooper & Associates', 8, 12083.33, 0.20, 98000.00, FALSE, 680000.00),
(1042, 'Maya', 'Richardson', 'maya.richardson@email.com', '970-555-1042', '1990-12-04', 85000.00, 705, 'Full-time', 'Single', 1, 'Vail Ski', 380000.00, 520000.00, '2022-02-01', 'CO', 'Ski Instructor', 'Vail Resorts', 3, 7083.33, 0.26, 45000.00, TRUE, 460000.00),
(1043, 'Jordan', 'Cox', 'jordan.cox@email.com', '303-555-1043', '1986-06-22', 105000.00, 725, 'Full-time', 'Married', 4, 'Aurora Family', 380000.00, 520000.00, '2021-12-01', 'CO', 'Teacher', 'Cherry Creek School District', 7, 8750.00, 0.28, 65000.00, FALSE, 470000.00),
(1044, 'Kai', 'Ward', 'kai.ward@email.com', '720-555-1044', '1988-09-15', 118000.00, 750, 'Full-time', 'Single', 1, 'Boulder Tech', 460000.00, 630000.00, '2022-01-15', 'CO', 'Data Analyst', 'Google Boulder', 4, 9833.33, 0.24, 78000.00, TRUE, 570000.00),
(1045, 'Aaliyah', 'Torres', 'aaliyah.torres@email.com', '970-555-1045', '1992-03-30', 92000.00, 690, 'Full-time', 'Married', 2, 'Grand Junction', 340000.00, 460000.00, '2022-02-15', 'CO', 'Energy Analyst', 'Colorado Energy Office', 3, 7666.67, 0.30, 52000.00, FALSE, 420000.00),
(1046, 'Xavier', 'Peterson', 'xavier.peterson@email.com', '719-555-1046', '1987-07-18', 98000.00, 710, 'Full-time', 'Single', 1, 'Colorado Springs Tech', 380000.00, 520000.00, '2022-01-01', 'CO', 'Cybersecurity Analyst', 'Northrop Grumman', 5, 8166.67, 0.27, 58000.00, TRUE, 470000.00),
(1047, 'Genesis', 'Gray', 'genesis.gray@email.com', '303-555-1047', '1985-11-25', 135000.00, 770, 'Full-time', 'Married', 3, 'Denver Highlands', 520000.00, 720000.00, '2021-12-15', 'CO', 'Finance Director', 'Charles Schwab', 9, 11250.00, 0.22, 88000.00, FALSE, 650000.00),
(1048, 'Jaxon', 'Ramirez', 'jaxon.ramirez@email.com', '720-555-1048', '1990-04-08', 108000.00, 730, 'Full-time', 'Single', 1, 'Boulder Creative', 440000.00, 600000.00, '2022-03-01', 'CO', 'UX Designer', 'Twitter Boulder', 4, 9000.00, 0.25, 68000.00, TRUE, 540000.00),

-- ================================================================
-- ARIZONA CUSTOMERS (1049-1060) - 12 customers
-- ================================================================
(1049, 'Adriel', 'Watson', 'adriel.watson@email.com', '480-555-1049', '1984-03-25', 115000.00, 745, 'Full-time', 'Married', 2, 'Scottsdale Luxury', 450000.00, 620000.00, '2021-12-01', 'AZ', 'Real Estate Broker', 'Berkshire Hathaway', 8, 9583.33, 0.26, 75000.00, FALSE, 560000.00),
(1050, 'Aubrey', 'Brooks', 'aubrey.brooks@email.com', '602-555-1050', '1989-06-18', 88000.00, 695, 'Full-time', 'Single', 1, 'Phoenix Urban', 320000.00, 440000.00, '2021-12-15', 'AZ', 'Social Worker', 'Maricopa County', 4, 7333.33, 0.32, 48000.00, TRUE, 400000.00),
(1051, 'Axel', 'Kelly', 'axel.kelly@email.com', '520-555-1051', '1986-10-30', 105000.00, 720, 'Self-employed', 'Married', 3, 'Tucson Desert', 380000.00, 520000.00, '2022-01-01', 'AZ', 'Construction Contractor', 'Kelly Construction', 10, 8750.00, 0.24, 68000.00, FALSE, 470000.00),
(1052, 'Ariana', 'Sanders', 'ariana.sanders@email.com', '623-555-1052', '1991-07-12', 78000.00, 680, 'Full-time', 'Single', 1, 'Glendale Family', 280000.00, 380000.00, '2022-01-15', 'AZ', 'Elementary Teacher', 'Glendale Elementary District', 3, 6500.00, 0.34, 35000.00, TRUE, 340000.00),
(1053, 'Kingston', 'Price', 'kingston.price@email.com', '480-555-1053', '1983-12-04', 138000.00, 765, 'Full-time', 'Married', 2, 'Scottsdale Golf', 520000.00, 720000.00, '2022-02-01', 'AZ', 'Golf Course Manager', 'TPC Scottsdale', 12, 11500.00, 0.21, 92000.00, FALSE, 650000.00),
(1054, 'Melody', 'Bennett', 'melody.bennett@email.com', '928-555-1054', '1988-04-28', 85000.00, 705, 'Full-time', 'Single', 1, 'Flagstaff Mountain', 350000.00, 480000.00, '2022-02-15', 'AZ', 'Park Ranger', 'National Park Service', 5, 7083.33, 0.28, 45000.00, TRUE, 430000.00),
(1055, 'Diego', 'Wood', 'diego.wood@email.com', '602-555-1055', '1987-09-14', 112000.00, 735, 'Full-time', 'Married', 4, 'Phoenix Family', 400000.00, 550000.00, '2022-03-01', 'AZ', 'Operations Manager', 'Intel', 6, 9333.33, 0.25, 72000.00, FALSE, 500000.00),
(1056, 'Paisley', 'Barnes', 'paisley.barnes@email.com', '480-555-1056', '1990-01-07', 92000.00, 715, 'Full-time', 'Single', 1, 'Tempe University', 350000.00, 480000.00, '2022-03-15', 'AZ', 'Research Scientist', 'Arizona State University', 3, 7666.67, 0.29, 52000.00, TRUE, 430000.00),
(1057, 'Cash', 'Ross', 'cash.ross@email.com', '520-555-1057', '1985-11-21', 125000.00, 750, 'Full-time', 'Married', 2, 'Tucson Professional', 480000.00, 650000.00, '2022-04-01', 'AZ', 'Aerospace Engineer', 'Raytheon', 8, 10416.67, 0.23, 82000.00, FALSE, 590000.00),
(1058, 'Leilani', 'Henderson', 'leilani.henderson@email.com', '623-555-1058', '1992-05-16', 89000.00, 700, 'Full-time', 'Single', 1, 'Phoenix West', 320000.00, 440000.00, '2022-04-15', 'AZ', 'Marketing Coordinator', 'Banner Health', 2, 7416.67, 0.30, 46000.00, TRUE, 400000.00),
(1059, 'Brayden', 'Coleman', 'brayden.coleman@email.com', '480-555-1059', '1986-08-03', 158000.00, 785, 'Full-time', 'Married', 3, 'Paradise Valley', 650000.00, 950000.00, '2022-05-01', 'AZ', 'Investment Manager', 'Fidelity Investments', 10, 13166.67, 0.19, 125000.00, FALSE, 800000.00),
(1060, 'Nova', 'Jenkins', 'nova.jenkins@email.com', '602-555-1060', '1988-12-09', 98000.00, 725, 'Full-time', 'Single', 1, 'Phoenix Central', 370000.00, 510000.00, '2022-05-15', 'AZ', 'Physical Therapist', 'Phoenix Children\'s Hospital', 4, 8166.67, 0.27, 58000.00, TRUE, 460000.00);

-- ================================================================
-- VERIFY DATA INSERTION
-- ================================================================
SELECT 'AGENTS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM AGENTS
UNION ALL
SELECT 'CUSTOMERS' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM CUSTOMERS
UNION ALL
SELECT 'Geographic Distribution:' AS INFO, 'TX: 12, CA: 12, FL: 12, CO: 12, AZ: 12' AS DETAILS
UNION ALL
SELECT 'Customer Age Range:' AS INFO, 'Born 1982-1994 (Ages 30-42)' AS DETAILS
UNION ALL
SELECT 'Income Range:' AS INFO, '$68K - $235K annually' AS DETAILS
UNION ALL
SELECT 'Ready for 1:1 Sales Mapping' AS STATUS, 'Each customer will buy exactly one house' AS CONFIRMATION;

COMMENT ON TABLE AGENTS IS 'Real estate professionals across 5 states with specialties and performance metrics';
COMMENT ON TABLE CUSTOMERS IS '60 customers with comprehensive demographics, financial profiles, and geographic distribution for 1:1 house purchases';