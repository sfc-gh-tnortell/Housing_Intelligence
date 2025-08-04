-- ================================================================
-- HOUSING INTELLIGENCE SALES DATA V2 - 60 SALES WITH 1:1 MAPPING
-- ================================================================
-- Perfect 1:1 customer-house relationship across 2022-2023
-- Each customer buys exactly one house, each house sells to exactly one customer

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- HOUSE SALES DATA - 60 transactions (1:1 customer-house mapping)
-- ================================================================
-- Strategic matching based on customer budgets, location preferences, and property characteristics
-- Sales distributed across 2022-2023 with realistic market conditions

INSERT INTO HOUSE_SALES VALUES
-- ================================================================
-- 2022 Q1 SALES (January-March) - Rising market
-- ================================================================
-- Texas Sales
(4001, 2001, 1001, '2022-03-15', 615000.00, 625000.00, 28, 'Financed', 'Conventional', 123000.00, 492000.00, 4.750, 30, 2650.00, 101, 'Sarah Johnson', 'Keller Williams Austin', 0.030, 18450.00, 12500.00, TRUE, 620000.00, 'Stewart Title', 'Fidelity National Title', 'Inspection contingency passed', 'First-time homebuyer in Austin tech scene', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4001.pdf'),

(4002, 2002, 1002, '2022-03-22', 375000.00, 385000.00, 32, 'Financed', 'FHA', 18750.00, 356250.00, 5.125, 30, 1945.00, 102, 'Sarah Johnson', 'Keller Williams Austin', 0.030, 11250.00, 8500.00, TRUE, 380000.00, 'Stewart Title', 'Chicago Title', 'FHA inspection contingency', 'First-time buyer, downtown condo lifestyle', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4002.pdf'),

(4003, 2009, 1003, '2022-04-05', 1250000.00, 1285000.00, 42, 'Financed', 'Jumbo', 250000.00, 1000000.00, 4.625, 30, 5125.00, 104, 'David Rodriguez', 'Century 21 Houston', 0.025, 31250.00, 28500.00, TRUE, 1275000.00, 'First American Title', 'Old Republic Title', 'Luxury home inspection passed', 'Energy executive luxury estate purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4003.pdf'),

(4004, 2006, 1004, '2022-04-12', 275000.00, 285000.00, 38, 'Financed', 'FHA', 13750.00, 261250.00, 5.375, 30, 1465.00, 102, 'Sarah Johnson', 'Keller Williams Austin', 0.030, 8250.00, 7200.00, TRUE, 280000.00, 'Stewart Title', 'Fidelity National Title', 'FHA financing contingency', 'Healthcare professional starter home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4004.pdf'),

-- California Sales
(4005, 2013, 1013, '2022-04-18', 1425000.00, 1485000.00, 45, 'Financed', 'Jumbo', 285000.00, 1140000.00, 4.875, 30, 6025.00, 105, 'Emily Thompson', 'Compass San Francisco', 0.025, 35625.00, 32500.00, TRUE, 1450000.00, 'First American Title', 'Chicago Title', 'SF inspection and earthquake contingency', 'Tech professional Marina District purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4005.pdf'),

(4006, 2014, 1014, '2022-04-25', 885000.00, 925000.00, 35, 'Financed', 'Conventional', 177000.00, 708000.00, 5.000, 30, 3800.00, 105, 'Emily Thompson', 'Compass San Francisco', 0.030, 26550.00, 22500.00, TRUE, 900000.00, 'First American Title', 'Fidelity National Title', 'Tech company relocation package', 'Entertainment industry SOMA living', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4006.pdf'),

-- ================================================================
-- 2022 Q2 SALES (April-June) - Peak spring market
-- ================================================================
-- Texas Sales  
(4007, 2005, 1005, '2022-05-10', 725000.00, 745000.00, 25, 'Cash', 'Cash', 725000.00, 0.00, 0.000, 0, 0.00, 103, 'Jennifer Williams', 'Coldwell Banker Austin', 0.025, 18125.00, 0.00, TRUE, 735000.00, 'Stewart Title', 'Old Republic Title', 'Cash purchase, no financing contingency', 'Tech consultant cash purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4007.pdf'),

(4008, 2008, 1006, '2022-05-17', 375000.00, 385000.00, 48, 'Financed', 'FHA', 18750.00, 356250.00, 5.250, 30, 1960.00, 102, 'Sarah Johnson', 'Keller Williams Austin', 0.030, 11250.00, 8200.00, TRUE, 380000.00, 'Stewart Title', 'Chicago Title', 'First-time buyer FHA program', 'Teacher East Austin duplex purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4008.pdf'),

(4009, 2007, 1007, '2022-05-24', 515000.00, 535000.00, 42, 'Financed', 'Conventional', 103000.00, 412000.00, 5.125, 30, 2245.00, 103, 'Jennifer Williams', 'Coldwell Banker Austin', 0.030, 15450.00, 11800.00, TRUE, 525000.00, 'Stewart Title', 'First American Title', 'Family home with lake access', 'Oracle employee Lake Travis community', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4009.pdf'),

(4010, 2010, 1008, '2022-06-02', 665000.00, 685000.00, 38, 'Financed', 'Conventional', 133000.00, 532000.00, 5.250, 30, 2940.00, 104, 'David Rodriguez', 'Century 21 Houston', 0.030, 19950.00, 15500.00, TRUE, 675000.00, 'First American Title', 'Old Republic Title', 'Conventional financing approved', 'Financial analyst Houston luxury condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4010.pdf'),

-- California Sales
(4011, 2015, 1015, '2022-06-08', 1575000.00, 1625000.00, 32, 'Financed', 'Jumbo', 315000.00, 1260000.00, 5.000, 30, 6765.00, 107, 'Lisa Zhang', 'Douglas Elliman Silicon Valley', 0.025, 39375.00, 35500.00, TRUE, 1600000.00, 'First American Title', 'Stewart Title', 'Tech executive relocation', 'Apple product manager Silicon Valley', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4011.pdf'),

(4012, 2017, 1016, '2022-06-15', 765000.00, 785000.00, 42, 'Financed', 'Conventional', 153000.00, 612000.00, 5.375, 30, 3420.00, 107, 'Lisa Zhang', 'Douglas Elliman Silicon Valley', 0.030, 22950.00, 18500.00, TRUE, 775000.00, 'First American Title', 'Chicago Title', 'Biotech professional purchase', 'Illumina researcher San Jose condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4012.pdf'),

-- ================================================================
-- 2022 Q3 SALES (July-September) - Summer market
-- ================================================================
-- Texas Sales
(4013, 2011, 1009, '2022-07-12', 895000.00, 925000.00, 35, 'Financed', 'Conventional', 179000.00, 716000.00, 5.500, 30, 4065.00, 104, 'David Rodriguez', 'Century 21 Houston', 0.030, 26850.00, 22500.00, TRUE, 910000.00, 'First American Title', 'Stewart Title', 'American Airlines executive purchase', 'Project manager West University family home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4013.pdf'),

(4014, 2012, 1010, '2022-07-20', 465000.00, 485000.00, 38, 'Financed', 'Conventional', 93000.00, 372000.00, 5.625, 30, 2145.00, 104, 'David Rodriguez', 'Century 21 Houston', 0.030, 13950.00, 12200.00, TRUE, 475000.00, 'First American Title', 'Old Republic Title', 'Tech professional Heights purchase', 'Facebook UX designer Heights townhouse', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4014.pdf'),

(4015, 2003, 1011, '2022-08-05', 825000.00, 875000.00, 55, 'Financed', 'Jumbo', 165000.00, 660000.00, 5.750, 30, 3855.00, 102, 'Michael Chen', 'RE/MAX Texas', 0.025, 20625.00, 18500.00, TRUE, 850000.00, 'Stewart Title', 'First American Title', 'Energy professional luxury purchase', 'Chevron engineer Steiner Ranch estate', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4015.pdf'),

(4016, 2004, 1012, '2022-08-15', 445000.00, 465000.00, 42, 'Financed', 'Conventional', 89000.00, 356000.00, 5.875, 30, 2110.00, 103, 'Jennifer Williams', 'Coldwell Banker Austin', 0.030, 13350.00, 11500.00, TRUE, 455000.00, 'Stewart Title', 'Chicago Title', 'Creative professional Mueller home', 'Whole Foods designer Mueller townhouse', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4016.pdf'),

-- California Sales
(4017, 2016, 1017, '2022-08-22', 2225000.00, 2285000.00, 28, 'Cash', 'Cash', 2225000.00, 0.00, 0.000, 0, 0.00, 107, 'Lisa Zhang', 'Douglas Elliman Silicon Valley', 0.020, 44500.00, 0.00, TRUE, 2250000.00, 'First American Title', 'Stewart Title', 'Cash purchase luxury estate', 'Winery manager Saratoga luxury estate', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4017.pdf'),

(4018, 2018, 1018, '2022-09-05', 525000.00, 585000.00, 62, 'Financed', 'Conventional', 105000.00, 420000.00, 6.000, 30, 2515.00, 108, 'Robert Garcia', 'Redfin Los Angeles', 0.030, 15750.00, 13800.00, TRUE, 545000.00, 'First American Title', 'Fidelity National Title', 'State employee purchase', 'California DMV employee Sacramento home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4018.pdf'),

-- ================================================================
-- 2022 Q4 SALES (October-December) - Interest rates rising
-- ================================================================
-- California Sales
(4019, 2019, 1019, '2022-10-12', 1395000.00, 1485000.00, 65, 'Cash', 'Cash', 1395000.00, 0.00, 0.000, 0, 0.00, 106, 'James Park', 'Sotheby\'s Beverly Hills', 0.025, 34875.00, 0.00, TRUE, 1425000.00, 'First American Title', 'Stewart Title', 'Tech startup founder cash purchase', 'Startup founder Santa Barbara luxury', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4019.pdf'),

(4020, 2020, 1020, '2022-10-20', 615000.00, 685000.00, 75, 'Financed', 'Conventional', 123000.00, 492000.00, 6.250, 30, 3030.00, 108, 'Robert Garcia', 'Redfin Los Angeles', 0.030, 18450.00, 16800.00, TRUE, 635000.00, 'First American Title', 'Chicago Title', 'Market correction pricing', 'Uber data scientist Oakland purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4020.pdf'),

(4021, 2021, 1021, '2022-11-08', 1385000.00, 1485000.00, 58, 'Financed', 'Jumbo', 277000.00, 1108000.00, 6.125, 30, 6745.00, 105, 'Emily Thompson', 'Compass San Francisco', 0.025, 34625.00, 32500.00, TRUE, 1425000.00, 'First American Title', 'Stewart Title', 'Real estate developer purchase', 'Developer Beverly Hills luxury estate', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4021.pdf'),

(4022, 2022, 1022, '2022-11-18', 765000.00, 785000.00, 45, 'Financed', 'Conventional', 153000.00, 612000.00, 6.375, 30, 3825.00, 108, 'Robert Garcia', 'Redfin Los Angeles', 0.030, 22950.00, 18500.00, TRUE, 775000.00, 'First American Title', 'Old Republic Title', 'Qualcomm executive purchase', 'Marketing director San Diego home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4022.pdf'),

(4023, 2023, 1023, '2022-12-02', 695000.00, 785000.00, 82, 'Financed', 'Conventional', 139000.00, 556000.00, 6.500, 30, 3520.00, 107, 'Lisa Zhang', 'Douglas Elliman Silicon Valley', 0.030, 20850.00, 18200.00, TRUE, 725000.00, 'First American Title', 'Stewart Title', 'Marine biologist purchase', 'Monterey Bay researcher coastal home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4023.pdf'),

(4024, 2024, 1024, '2022-12-15', 565000.00, 640000.00, 95, 'Financed', 'Conventional', 113000.00, 452000.00, 6.750, 30, 2935.00, 107, 'Lisa Zhang', 'Douglas Elliman Silicon Valley', 0.030, 16950.00, 15500.00, TRUE, 585000.00, 'First American Title', 'Chicago Title', 'Aerospace engineer purchase', 'JPL engineer Napa wine country', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4024.pdf'),

-- ================================================================
-- 2023 Q1 SALES (January-March) - Higher interest rates
-- ================================================================
-- Florida Sales
(4025, 2025, 1025, '2023-01-12', 765000.00, 785000.00, 42, 'Financed', 'Conventional', 153000.00, 612000.00, 6.875, 30, 4025.00, 109, 'Maria Martinez', 'Berkshire Hathaway Miami', 0.030, 22950.00, 18500.00, TRUE, 775000.00, 'First American Title', 'Fidelity National Title', 'International banker Miami Beach', 'Banking executive South Beach condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4025.pdf'),

(4026, 2026, 1026, '2023-01-20', 415000.00, 450000.00, 65, 'Financed', 'FHA', 20750.00, 394250.00, 7.000, 30, 2625.00, 111, 'Amanda Davis', 'RE/MAX Orlando', 0.030, 12450.00, 11200.00, TRUE, 435000.00, 'First American Title', 'Chicago Title', 'Healthcare admin first-time buyer', 'Hospital admin Tampa family home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4026.pdf'),

(4027, 2027, 1027, '2023-02-08', 465000.00, 485000.00, 52, 'Financed', 'Conventional', 93000.00, 372000.00, 7.125, 30, 2515.00, 111, 'Amanda Davis', 'RE/MAX Orlando', 0.030, 13950.00, 12200.00, TRUE, 475000.00, 'First American Title', 'Stewart Title', 'Disney manager family purchase', 'Theme park manager Tampa townhouse', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4027.pdf'),

(4028, 2028, 1028, '2023-02-18', 405000.00, 425000.00, 48, 'Financed', 'FHA', 20250.00, 384750.00, 7.250, 30, 2625.00, 109, 'Maria Martinez', 'Berkshire Hathaway Miami', 0.030, 12150.00, 10800.00, TRUE, 415000.00, 'First American Title', 'Old Republic Title', 'Cruise line executive purchase', 'Royal Caribbean exec Fort Lauderdale', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4028.pdf'),

-- Colorado Sales
(4029, 2037, 1037, '2023-02-25', 565000.00, 585000.00, 38, 'Financed', 'Conventional', 113000.00, 452000.00, 7.000, 30, 3015.00, 112, 'Kevin Miller', 'LIV Sotheby\'s Denver', 0.030, 16950.00, 15500.00, TRUE, 575000.00, 'First American Title', 'Fidelity National Title', 'Tech professional Denver purchase', 'Palantir architect Highland townhouse', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4029.pdf'),

(4030, 2038, 1038, '2023-03-08', 505000.00, 520000.00, 35, 'Financed', 'Conventional', 101000.00, 404000.00, 7.125, 30, 2725.00, 113, 'Rachel Wilson', 'Engel & Völkers Boulder', 0.030, 15150.00, 13800.00, TRUE, 515000.00, 'First American Title', 'Stewart Title', 'Environmental scientist Boulder', 'NCAR scientist Boulder home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4030.pdf'),

-- ================================================================
-- 2023 Q2 SALES (April-June) - Market stabilization
-- ================================================================
-- Colorado Sales
(4031, 2039, 1039, '2023-04-12', 415000.00, 425000.00, 32, 'Financed', 'VA', 0.00, 415000.00, 6.750, 30, 2695.00, 114, 'Nathan Taylor', 'RE/MAX Colorado Springs', 0.030, 12450.00, 11200.00, TRUE, 420000.00, 'First American Title', 'Chicago Title', 'Air Force officer VA purchase', 'Military officer Colorado Springs', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4031.pdf'),

(4032, 2040, 1040, '2023-04-20', 565000.00, 590000.00, 55, 'Financed', 'Conventional', 113000.00, 452000.00, 6.875, 30, 2975.00, 113, 'Rachel Wilson', 'Engel & Völkers Boulder', 0.030, 16950.00, 15500.00, TRUE, 575000.00, 'First American Title', 'Stewart Title', 'Veterinarian Fort Collins purchase', 'CSU veterinarian Denver condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4032.pdf'),

-- Florida Sales
(4033, 2029, 1029, '2023-04-28', 425000.00, 445000.00, 52, 'Financed', 'Conventional', 85000.00, 340000.00, 6.750, 30, 2215.00, 110, 'Christopher Lee', 'Coldwell Banker Tampa', 0.030, 12750.00, 11500.00, TRUE, 435000.00, 'First American Title', 'Old Republic Title', 'Logistics manager Jacksonville', 'CSX manager Jacksonville home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4033.pdf'),

(4034, 2030, 1030, '2023-05-05', 365000.00, 385000.00, 58, 'Financed', 'FHA', 18250.00, 346750.00, 6.875, 30, 2285.00, 110, 'Christopher Lee', 'Coldwell Banker Tampa', 0.030, 10950.00, 9800.00, TRUE, 375000.00, 'First American Title', 'Chicago Title', 'Museum curator St. Petersburg', 'Dalí Museum curator purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4034.pdf'),

(4035, 2031, 1031, '2023-05-15', 545000.00, 585000.00, 72, 'Financed', 'Conventional', 109000.00, 436000.00, 6.625, 30, 2785.00, 109, 'Maria Martinez', 'Berkshire Hathaway Miami', 0.030, 16350.00, 14800.00, TRUE, 565000.00, 'First American Title', 'Stewart Title', 'Investment advisor Sarasota', 'Edward Jones advisor Naples condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4035.pdf'),

(4036, 2032, 1032, '2023-05-25', 385000.00, 400000.00, 45, 'Financed', 'Conventional', 77000.00, 308000.00, 6.750, 30, 2005.00, 110, 'Christopher Lee', 'Coldwell Banker Tampa', 0.030, 11550.00, 10200.00, TRUE, 395000.00, 'First American Title', 'Fidelity National Title', 'Real estate agent purchase', 'Coldwell Banker agent St. Pete', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4036.pdf'),

-- ================================================================
-- 2023 Q3 SALES (July-September) - Peak interest rates
-- ================================================================
-- Florida Sales
(4037, 2033, 1033, '2023-07-08', 415000.00, 460000.00, 88, 'Financed', 'Conventional', 83000.00, 332000.00, 7.375, 30, 2315.00, 111, 'Amanda Davis', 'RE/MAX Orlando', 0.030, 12450.00, 11200.00, TRUE, 435000.00, 'First American Title', 'Old Republic Title', 'State government Tallahassee', 'Health dept employee purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4037.pdf'),

(4038, 2034, 1034, '2023-07-18', 485000.00, 520000.00, 65, 'Financed', 'Conventional', 97000.00, 388000.00, 7.250, 30, 2695.00, 109, 'Maria Martinez', 'Berkshire Hathaway Miami', 0.030, 14550.00, 13200.00, TRUE, 505000.00, 'First American Title', 'Stewart Title', 'Resort manager Naples luxury', 'Ritz-Carlton manager Naples home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4038.pdf'),

(4039, 2035, 1035, '2023-08-02', 385000.00, 400000.00, 42, 'Financed', 'Conventional', 77000.00, 308000.00, 7.125, 30, 2140.00, 110, 'Christopher Lee', 'Coldwell Banker Tampa', 0.030, 11550.00, 10200.00, TRUE, 395000.00, 'First American Title', 'Chicago Title', 'NASA engineer Space Coast', 'Kennedy Space Center engineer', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4039.pdf'),

(4040, 2036, 1036, '2023-08-15', 315000.00, 340000.00, 78, 'Financed', 'FHA', 15750.00, 299250.00, 7.500, 30, 2095.00, 111, 'Amanda Davis', 'RE/MAX Orlando', 0.030, 9450.00, 8500.00, TRUE, 325000.00, 'First American Title', 'Fidelity National Title', 'University researcher Gainesville', 'UF researcher first-time buyer', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4040.pdf'),

-- Colorado Sales
(4041, 2041, 1041, '2023-08-22', 665000.00, 685000.00, 35, 'Cash', 'Cash', 665000.00, 0.00, 0.000, 0, 0.00, 112, 'Kevin Miller', 'LIV Sotheby\'s Denver', 0.025, 16625.00, 0.00, TRUE, 675000.00, 'First American Title', 'Stewart Title', 'Business consultant cash purchase', 'Cooper & Associates Fort Collins', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4041.pdf'),

(4042, 2042, 1042, '2023-09-05', 455000.00, 520000.00, 95, 'Financed', 'Conventional', 91000.00, 364000.00, 7.250, 30, 2530.00, 112, 'Kevin Miller', 'LIV Sotheby\'s Denver', 0.030, 13650.00, 12500.00, TRUE, 475000.00, 'First American Title', 'Old Republic Title', 'Ski instructor Vail purchase', 'Vail Resorts instructor condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4042.pdf'),

-- Arizona Sales
(4043, 2049, 1049, '2023-09-12', 565000.00, 620000.00, 82, 'Financed', 'Conventional', 113000.00, 452000.00, 7.125, 30, 3055.00, 115, 'Jessica Brown', 'Russ Lyon Scottsdale', 0.030, 16950.00, 15500.00, TRUE, 585000.00, 'First American Title', 'Stewart Title', 'Real estate broker Scottsdale', 'Berkshire Hathaway broker purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4043.pdf'),

(4044, 2050, 1050, '2023-09-20', 365000.00, 385000.00, 52, 'Financed', 'FHA', 18250.00, 346750.00, 7.375, 30, 2435.00, 116, 'Brandon Smith', 'HomeSmart Phoenix', 0.030, 10950.00, 9800.00, TRUE, 375000.00, 'First American Title', 'Chicago Title', 'Social worker Phoenix purchase', 'Maricopa County social worker', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4044.pdf'),

-- ================================================================
-- 2023 Q4 SALES (October-December) - Market cooling
-- ================================================================
-- Arizona Sales
(4045, 2051, 1051, '2023-10-08', 465000.00, 485000.00, 42, 'Cash', 'Cash', 465000.00, 0.00, 0.000, 0, 0.00, 116, 'Brandon Smith', 'HomeSmart Phoenix', 0.025, 11625.00, 0.00, TRUE, 475000.00, 'First American Title', 'Stewart Title', 'Contractor cash purchase', 'Kelly Construction owner purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4045.pdf'),

(4046, 2052, 1052, '2023-10-18', 315000.00, 340000.00, 68, 'Financed', 'FHA', 15750.00, 299250.00, 7.250, 30, 2085.00, 116, 'Brandon Smith', 'HomeSmart Phoenix', 0.030, 9450.00, 8500.00, TRUE, 325000.00, 'First American Title', 'Old Republic Title', 'Teacher Glendale purchase', 'Elementary teacher first-time buyer', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4046.pdf'),

(4047, 2053, 1053, '2023-10-25', 645000.00, 720000.00, 95, 'Financed', 'Conventional', 129000.00, 516000.00, 7.000, 30, 3440.00, 115, 'Jessica Brown', 'Russ Lyon Scottsdale', 0.030, 19350.00, 17500.00, TRUE, 665000.00, 'First American Title', 'Stewart Title', 'Golf course manager Scottsdale', 'TPC Scottsdale manager purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4047.pdf'),

(4048, 2054, 1054, '2023-11-05', 365000.00, 385000.00, 58, 'Financed', 'Conventional', 73000.00, 292000.00, 7.125, 30, 2025.00, 117, 'Nicole Johnson', 'Realty One Tucson', 0.030, 10950.00, 9800.00, TRUE, 375000.00, 'First American Title', 'Chicago Title', 'Park ranger Flagstaff purchase', 'National Park Service mountain home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4048.pdf'),

-- Colorado Sales
(4049, 2043, 1043, '2023-11-12', 485000.00, 520000.00, 72, 'Financed', 'Conventional', 97000.00, 388000.00, 6.875, 30, 2555.00, 114, 'Nathan Taylor', 'RE/MAX Colorado Springs', 0.030, 14550.00, 13200.00, TRUE, 505000.00, 'First American Title', 'Stewart Title', 'Teacher Aurora family purchase', 'Cherry Creek teacher family home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4049.pdf'),

(4050, 2044, 1044, '2023-11-20', 565000.00, 570000.00, 25, 'Financed', 'Conventional', 113000.00, 452000.00, 6.750, 30, 2935.00, 113, 'Rachel Wilson', 'Engel & Völkers Boulder', 0.030, 16950.00, 15500.00, TRUE, 570000.00, 'First American Title', 'Fidelity National Title', 'Google analyst Boulder purchase', 'Google Boulder data analyst', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4050.pdf'),

(4051, 2045, 1045, '2023-11-28', 415000.00, 420000.00, 18, 'Financed', 'Conventional', 83000.00, 332000.00, 6.625, 30, 2115.00, 114, 'Nathan Taylor', 'RE/MAX Colorado Springs', 0.030, 12450.00, 11200.00, TRUE, 420000.00, 'First American Title', 'Old Republic Title', 'Energy analyst Grand Junction', 'Colorado Energy Office analyst', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4051.pdf'),

(4052, 2046, 1046, '2023-12-05', 465000.00, 470000.00, 28, 'Financed', 'Conventional', 93000.00, 372000.00, 6.500, 30, 2355.00, 114, 'Nathan Taylor', 'RE/MAX Colorado Springs', 0.030, 13950.00, 12500.00, TRUE, 470000.00, 'First American Title', 'Stewart Title', 'Cybersecurity analyst purchase', 'Northrop Grumman analyst Golden', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4052.pdf'),

(4053, 2047, 1047, '2023-12-12', 565000.00, 585000.00, 42, 'Financed', 'Conventional', 113000.00, 452000.00, 6.375, 30, 2845.00, 112, 'Kevin Miller', 'LIV Sotheby\'s Denver', 0.030, 16950.00, 15500.00, TRUE, 575000.00, 'First American Title', 'Chicago Title', 'Finance director Denver purchase', 'Charles Schwab director Breckenridge', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4053.pdf'),

(4054, 2048, 1048, '2023-12-20', 565000.00, 600000.00, 68, 'Financed', 'Conventional', 113000.00, 452000.00, 6.250, 30, 2795.00, 113, 'Rachel Wilson', 'Engel & Völkers Boulder', 0.030, 16950.00, 15500.00, TRUE, 585000.00, 'First American Title', 'Stewart Title', 'UX designer Denver purchase', 'Twitter Boulder designer family home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4054.pdf'),

-- Arizona Sales - Final 2023 sales
(4055, 2055, 1055, '2023-12-22', 465000.00, 485000.00, 52, 'Financed', 'Conventional', 93000.00, 372000.00, 6.125, 30, 2265.00, 116, 'Brandon Smith', 'HomeSmart Phoenix', 0.030, 13950.00, 12500.00, TRUE, 475000.00, 'First American Title', 'Old Republic Title', 'Intel operations manager Phoenix', 'Intel manager Glendale family home', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4055.pdf'),

(4056, 2056, 1056, '2023-12-28', 415000.00, 430000.00, 62, 'Financed', 'Conventional', 83000.00, 332000.00, 6.000, 30, 1995.00, 117, 'Nicole Johnson', 'Realty One Tucson', 0.030, 12450.00, 11200.00, TRUE, 425000.00, 'First American Title', 'Chicago Title', 'ASU research scientist purchase', 'University researcher Tempe condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4056.pdf'),

(4057, 2057, 1057, '2023-12-29', 1425000.00, 1485000.00, 38, 'Cash', 'Cash', 1425000.00, 0.00, 0.000, 0, 0.00, 115, 'Jessica Brown', 'Russ Lyon Scottsdale', 0.025, 35625.00, 0.00, TRUE, 1450000.00, 'First American Title', 'Stewart Title', 'Aerospace engineer luxury purchase', 'Raytheon engineer Scottsdale estate', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4057.pdf'),

(4058, 2058, 1058, '2023-12-30', 385000.00, 400000.00, 45, 'Financed', 'FHA', 19250.00, 365750.00, 5.875, 30, 2165.00, 116, 'Brandon Smith', 'HomeSmart Phoenix', 0.030, 11550.00, 10200.00, TRUE, 395000.00, 'First American Title', 'Fidelity National Title', 'Marketing coordinator Phoenix', 'Banner Health coordinator purchase', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4058.pdf'),

(4059, 2059, 1059, '2023-12-31', 1395000.00, 1450000.00, 28, 'Financed', 'Jumbo', 279000.00, 1116000.00, 5.750, 30, 6515.00, 115, 'Jessica Brown', 'Russ Lyon Scottsdale', 0.025, 34875.00, 32500.00, TRUE, 1425000.00, 'First American Title', 'Stewart Title', 'Investment manager Paradise Valley', 'Fidelity manager desert estate', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4059.pdf'),

(4060, 2060, 1060, '2023-12-31', 265000.00, 285000.00, 58, 'Financed', 'FHA', 13250.00, 251750.00, 5.750, 30, 1470.00, 117, 'Nicole Johnson', 'Realty One Tucson', 0.030, 7950.00, 7200.00, TRUE, 275000.00, 'First American Title', 'Old Republic Title', 'Physical therapist Tempe purchase', 'Children\'s Hospital therapist condo', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_4060.pdf');

-- ================================================================
-- VERIFY PERFECT 1:1 RELATIONSHIP
-- ================================================================
CALL VALIDATE_ONE_TO_ONE_RELATIONSHIP();

-- ================================================================
-- DATA VERIFICATION AND ANALYSIS
-- ================================================================
SELECT 'HOUSE_SALES' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM HOUSE_SALES
UNION ALL
SELECT 'Unique Customers' AS INFO, COUNT(DISTINCT CUSTOMER_ID)::STRING AS DETAILS FROM HOUSE_SALES
UNION ALL
SELECT 'Unique Houses' AS INFO, COUNT(DISTINCT HOUSE_ID)::STRING AS DETAILS FROM HOUSE_SALES
UNION ALL
SELECT 'Date Range' AS INFO, MIN(SALE_DATE) || ' to ' || MAX(SALE_DATE) AS DETAILS FROM HOUSE_SALES
UNION ALL
SELECT 'Average Sale Price' AS INFO, '$' || ROUND(AVG(SALE_PRICE), 0)::STRING AS DETAILS FROM HOUSE_SALES
UNION ALL
SELECT 'Price Range' AS INFO, '$' || MIN(SALE_PRICE) || ' to $' || MAX(SALE_PRICE) AS DETAILS FROM HOUSE_SALES;

-- Sales by year and financing type
SELECT 
    YEAR(SALE_DATE) AS SALE_YEAR,
    FINANCING_TYPE,
    COUNT(*) AS SALES_COUNT,
    ROUND(AVG(SALE_PRICE), 0) AS AVG_PRICE,
    ROUND(AVG(INTEREST_RATE), 3) AS AVG_RATE
FROM HOUSE_SALES
GROUP BY YEAR(SALE_DATE), FINANCING_TYPE
ORDER BY SALE_YEAR, AVG_PRICE DESC;

-- Geographic distribution
SELECT 
    hc.STATE,
    COUNT(*) AS SALES_COUNT,
    ROUND(AVG(hs.SALE_PRICE), 0) AS AVG_SALE_PRICE,
    ROUND(MIN(hs.SALE_PRICE), 0) AS MIN_PRICE,
    ROUND(MAX(hs.SALE_PRICE), 0) AS MAX_PRICE
FROM HOUSE_SALES hs
JOIN HOUSE_CHARACTERISTICS hc ON hs.HOUSE_ID = hc.HOUSE_ID
GROUP BY hc.STATE
ORDER BY AVG_SALE_PRICE DESC;

COMMENT ON TABLE HOUSE_SALES IS '60 sales transactions with perfect 1:1 customer-house mapping across 2022-2023, spanning 5 states with realistic market conditions and financing scenarios';