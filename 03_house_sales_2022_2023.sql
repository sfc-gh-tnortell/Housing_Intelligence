-- ================================================================
-- HOUSING INTELLIGENCE SALES DATA (2022-2023)
-- ================================================================
-- This script adds comprehensive sales transactions spanning 2 full years
-- across multiple states for temporal and geographic analysis

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- INSERT HOUSE SALES (75 transactions across 2022-2023)
-- ================================================================
INSERT INTO HOUSE_SALES VALUES
-- 2022 Q1 Sales (January-March)
(3001, 2001, 1001, '2022-03-15', 375000.00, 385000.00, 45, 'Financed', 101, 'Jane Thompson', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 5.250, 8500.00, true, 378000.00, 'Inspection contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3001.pdf'),
(3002, 2002, 1002, '2022-03-20', 280000.00, 285000.00, 35, 'FHA', 102, 'Bob Martinez', 0.030, 8400.00, 'FHA', 14000.00, 266000.00, 5.500, 7200.00, true, 282000.00, 'Financing contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3002.pdf'),
(3003, 2003, 1003, '2022-04-01', 475000.00, 485000.00, 52, 'Conventional', 103, 'Carol Johnson', 0.030, 14250.00, 'Conventional', 95000.00, 380000.00, 5.000, 12000.00, true, 480000.00, 'Appraisal contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3003.pdf'),
(3004, 2004, 1004, '2022-04-10', 315000.00, 325000.00, 38, 'VA', 104, 'David Chen', 0.030, 9450.00, 'VA', 0.00, 315000.00, 4.750, 6800.00, true, 318000.00, 'VA inspection', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3004.pdf'),
(3005, 2005, 1005, '2022-04-15', 615000.00, 625000.00, 28, 'Cash', 105, 'Emma Wilson', 0.025, 15375.00, 'Cash', 615000.00, 0.00, 0.000, 5200.00, true, 620000.00, 'None', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3005.pdf'),
(3006, 2006, 1006, '2022-04-25', 225000.00, 235000.00, 42, 'FHA', 106, 'Frank Rodriguez', 0.030, 6750.00, 'FHA', 11250.00, 213750.00, 5.750, 5800.00, true, 228000.00, 'Inspection contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3006.pdf'),
(3007, 2007, 1007, '2022-05-05', 425000.00, 435000.00, 48, 'Conventional', 107, 'Grace Kim', 0.030, 12750.00, 'Conventional', 85000.00, 340000.00, 5.125, 9500.00, true, 430000.00, 'Appraisal contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3007.pdf'),
(3008, 2008, 1008, '2022-05-12', 290000.00, 295000.00, 33, 'Conventional', 108, 'Henry Lee', 0.030, 8700.00, 'Conventional', 58000.00, 232000.00, 5.375, 7800.00, true, 292000.00, 'None', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3008.pdf'),
(3009, 2009, 1009, '2022-05-20', 535000.00, 545000.00, 25, 'Conventional', 109, 'Ivy Patel', 0.030, 16050.00, 'Conventional', 107000.00, 428000.00, 4.875, 11500.00, true, 540000.00, 'Inspection contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3009.pdf'),
(3010, 2010, 1010, '2022-05-28', 405000.00, 425000.00, 55, 'Conventional', 110, 'Jack Davis', 0.030, 12150.00, 'Conventional', 81000.00, 324000.00, 5.500, 9200.00, true, 410000.00, 'Appraisal contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3010.pdf'),

-- 2022 Q2 Sales (April-June) - California Properties
(3011, 2016, 1011, '2022-06-15', 665000.00, 685000.00, 32, 'Conventional', 111, 'Kate Morrison', 0.030, 19950.00, 'Conventional', 133000.00, 532000.00, 5.250, 15500.00, true, 670000.00, 'Appraisal contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3011.pdf'),
(3012, 2017, 1012, '2022-06-22', 895000.00, 925000.00, 28, 'Conventional', 112, 'Leo Chang', 0.025, 22375.00, 'Conventional', 179000.00, 716000.00, 4.750, 18200.00, true, 900000.00, 'Tech company relocation', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3012.pdf'),
(3013, 2018, 1013, '2022-07-10', 1225000.00, 1250000.00, 45, 'Jumbo', 113, 'Maria Santos', 0.025, 30625.00, 'Jumbo', 245000.00, 980000.00, 5.125, 25000.00, true, 1240000.00, 'Luxury home inspection', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3013.pdf'),
(3014, 2019, 1014, '2022-07-18', 765000.00, 785000.00, 38, 'Conventional', 114, 'Nick Taylor', 0.030, 22950.00, 'Conventional', 153000.00, 612000.00, 5.375, 18500.00, true, 770000.00, 'Earthquake contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3014.pdf'),
(3015, 2020, 1015, '2022-07-25', 465000.00, 485000.00, 42, 'Conventional', 115, 'Olivia Brown', 0.030, 13950.00, 'Conventional', 93000.00, 372000.00, 5.125, 12200.00, true, 470000.00, 'Financing contingency', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3015.pdf'),

-- 2022 Q3 Sales (July-September) - Florida Properties
(3016, 2031, 1021, '2022-08-05', 455000.00, 465000.00, 35, 'Conventional', 116, 'Paul Green', 0.030, 13650.00, 'Conventional', 91000.00, 364000.00, 5.250, 11800.00, true, 460000.00, 'Hurricane insurance', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3016.pdf'),
(3017, 2032, 1022, '2022-08-12', 375000.00, 385000.00, 48, 'Conventional', 117, 'Quinn Adams', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 5.500, 9500.00, true, 380000.00, 'Golf membership transfer', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3017.pdf'),
(3018, 2033, 1023, '2022-08-20', 315000.00, 325000.00, 52, 'FHA', 118, 'Rachel White', 0.030, 9450.00, 'FHA', 15750.00, 299250.00, 5.750, 8200.00, true, 318000.00, 'Beachfront assessment', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3018.pdf'),
(3019, 2034, 1024, '2022-08-28', 425000.00, 445000.00, 48, 'Conventional', 119, 'Sam Garcia', 0.030, 12750.00, 'Conventional', 85000.00, 340000.00, 5.375, 11500.00, true, 430000.00, 'Theme park proximity', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3019.pdf'),
(3020, 2035, 1025, '2022-09-05', 285000.00, 295000.00, 42, 'Conventional', 120, 'Tina Lopez', 0.030, 8550.00, 'Conventional', 57000.00, 228000.00, 5.625, 7800.00, true, 288000.00, 'River access rights', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3020.pdf'),

-- 2022 Q4 Sales (October-December) - Colorado Properties
(3021, 2041, 1026, '2022-10-15', 505000.00, 525000.00, 35, 'Conventional', 121, 'Uma Singh', 0.030, 15150.00, 'Conventional', 101000.00, 404000.00, 5.125, 13200.00, true, 510000.00, 'Mountain view preservation', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3021.pdf'),
(3022, 2042, 1027, '2022-10-22', 655000.00, 685000.00, 28, 'Conventional', 122, 'Victor Park', 0.025, 16375.00, 'Conventional', 131000.00, 524000.00, 4.875, 16800.00, true, 660000.00, 'Ski area access', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3022.pdf'),
(3023, 2043, 1028, '2022-11-10', 415000.00, 425000.00, 45, 'Cash', 123, 'Wendy Clark', 0.025, 10375.00, 'Cash', 415000.00, 0.00, 0.000, 8500.00, true, 420000.00, 'Urban loft conversion', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3023.pdf'),
(3024, 2044, 1029, '2022-11-18', 355000.00, 365000.00, 38, 'Conventional', 124, 'Xavier Moore', 0.030, 10650.00, 'Conventional', 71000.00, 284000.00, 5.750, 9200.00, true, 358000.00, 'Military base proximity', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3024.pdf'),
(3025, 2045, 1030, '2022-11-25', 375000.00, 385000.00, 42, 'VA', 125, 'Yolanda Rivera', 0.030, 11250.00, 'VA', 0.00, 375000.00, 5.000, 8800.00, true, 378000.00, 'VA benefits transfer', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3025.pdf'),

-- 2022 Q4 Additional Sales - Arizona Properties
(3026, 2051, 1031, '2022-12-05', 375000.00, 385000.00, 35, 'Conventional', 126, 'Zach Williams', 0.030, 11250.00, 'Conventional', 75000.00, 300000.00, 5.250, 9500.00, true, 378000.00, 'Desert landscaping', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3026.pdf'),
(3027, 2052, 1032, '2022-12-12', 655000.00, 675000.00, 48, 'Conventional', 127, 'Alice Johnson', 0.030, 19650.00, 'Conventional', 131000.00, 524000.00, 5.500, 16800.00, true, 660000.00, 'Golf course access', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3027.pdf'),
(3028, 2053, 1033, '2022-12-20', 275000.00, 285000.00, 52, 'FHA', 128, 'Brian Davis', 0.030, 8250.00, 'FHA', 13750.00, 261250.00, 5.750, 7200.00, true, 278000.00, 'University district', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3028.pdf'),
(3029, 2054, 1034, '2022-12-28', 415000.00, 425000.00, 48, 'Conventional', 129, 'Cathy Miller', 0.030, 12450.00, 'Conventional', 83000.00, 332000.00, 5.375, 11200.00, true, 418000.00, 'Retirement community', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3029.pdf'),

-- 2023 Q1 Sales (January-March) - Interest rates rising
(3030, 2055, 1035, '2023-01-15', 285000.00, 295000.00, 42, 'Conventional', 130, 'Dan Wilson', 0.030, 8550.00, 'Conventional', 57000.00, 228000.00, 6.125, 7800.00, true, 288000.00, 'Desert climate adaptation', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3030.pdf'),
(3031, 2056, 1001, '2023-02-10', 475000.00, 485000.00, 25, 'Cash', 131, 'Eva Santos', 0.025, 11875.00, 'Cash', 475000.00, 0.00, 0.000, 12500.00, true, 480000.00, 'Mountain cabin features', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3031.pdf'),
(3032, 2024, 1011, '2023-02-18', 1095000.00, 1125000.00, 32, 'Jumbo', 132, 'Frank Anderson', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.000, 22800.00, true, 1100000.00, 'Wine cellar inspection', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3032.pdf'),
(3033, 2025, 1012, '2023-03-05', 1795000.00, 1850000.00, 28, 'Jumbo', 133, 'Grace Thompson', 0.025, 44875.00, 'Jumbo', 359000.00, 1436000.00, 5.750, 35500.00, true, 1810000.00, 'Lakefront rights', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3033.pdf'),
(3034, 2026, 1013, '2023-03-15', 1425000.00, 1450000.00, 35, 'Jumbo', 134, 'Henry Kim', 0.025, 35625.00, 'Jumbo', 285000.00, 1140000.00, 6.125, 28500.00, true, 1440000.00, 'Tech headquarters relocation', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3034.pdf'),
(3035, 2027, 1014, '2023-03-22', 1095000.00, 1125000.00, 42, 'Jumbo', 135, 'Iris Chen', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.250, 25500.00, true, 1110000.00, 'Marina access rights', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3035.pdf'),

-- 2023 Q2 Sales (April-June) - Market correction begins
(3036, 2028, 1015, '2023-04-05', 2795000.00, 2850000.00, 38, 'Jumbo', 136, 'Jack Martinez', 0.025, 69875.00, 'Jumbo', 559000.00, 2236000.00, 6.375, 55000.00, true, 2820000.00, 'Celebrity privacy clause', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3036.pdf'),
(3037, 2029, 1016, '2023-04-12', 1645000.00, 1685000.00, 28, 'Jumbo', 137, 'Kelly Wong', 0.025, 41125.00, 'Jumbo', 329000.00, 1316000.00, 6.125, 32500.00, true, 1665000.00, 'Historic district compliance', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3037.pdf'),
(3038, 2030, 1017, '2023-04-20', 875000.00, 895000.00, 45, 'Conventional', 138, 'Luis Rodriguez', 0.030, 26250.00, 'Conventional', 175000.00, 700000.00, 6.625, 22500.00, true, 885000.00, 'Entertainment district location', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3038.pdf'),
(3039, 2037, 1018, '2023-04-28', 855000.00, 875000.00, 25, 'Conventional', 139, 'Maria Garcia', 0.030, 25650.00, 'Conventional', 171000.00, 684000.00, 6.500, 21500.00, true, 865000.00, 'Oceanfront hurricane insurance', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3039.pdf'),

-- 2023 Q2 Continued - Texas luxury market
(3040, 2013, 1019, '2023-05-15', 1795000.00, 1850000.00, 32, 'Jumbo', 140, 'Nina Patel', 0.025, 44875.00, 'Jumbo', 359000.00, 1436000.00, 6.250, 42500.00, true, 1820000.00, 'River Oaks historic preservation', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3040.pdf'),
(3041, 2014, 1020, '2023-05-22', 895000.00, 925000.00, 38, 'Conventional', 141, 'Oscar Lee', 0.030, 26850.00, 'Conventional', 179000.00, 716000.00, 6.750, 22500.00, true, 910000.00, 'Memorial Villages exclusivity', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3041.pdf'),
(3042, 2015, 1021, '2023-06-05', 465000.00, 485000.00, 42, 'Conventional', 142, 'Paula Davis', 0.030, 13950.00, 'Conventional', 93000.00, 372000.00, 6.625, 12200.00, true, 475000.00, 'Galleria shopping access', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3042.pdf'),

-- 2023 Q3 Sales (July-September) - Higher interest rates
(3043, 2038, 1022, '2023-07-12', 665000.00, 685000.00, 48, 'Conventional', 143, 'Quinn Johnson', 0.030, 19950.00, 'Conventional', 133000.00, 532000.00, 7.000, 18500.00, true, 675000.00, 'Art Deco historic value', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3043.pdf'),
(3044, 2039, 1023, '2023-07-20', 1095000.00, 1125000.00, 52, 'Jumbo', 144, 'Rosa Martinez', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.875, 28500.00, true, 1110000.00, 'Coral Gables architectural review', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3044.pdf'),
(3045, 2040, 1024, '2023-08-05', 415000.00, 425000.00, 35, 'Conventional', 145, 'Steve Wilson', 0.030, 12450.00, 'Conventional', 83000.00, 332000.00, 7.125, 11200.00, true, 420000.00, 'Beach access rights', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3045.pdf'),
(3046, 2047, 1025, '2023-08-15', 2175000.00, 2250000.00, 28, 'Cash', 146, 'Tara Singh', 0.020, 43500.00, 'Cash', 2175000.00, 0.00, 0.000, 55000.00, true, 2200000.00, 'Ski-in ski-out privileges', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3046.pdf'),
(3047, 2048, 1026, '2023-08-22', 925000.00, 945000.00, 32, 'Jumbo', 147, 'Uma Thompson', 0.025, 23125.00, 'Jumbo', 185000.00, 740000.00, 6.750, 24500.00, true, 935000.00, 'Ski resort amenities', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3047.pdf'),

-- 2023 Q4 Sales (October-December) - Market stabilization
(3048, 2049, 1027, '2023-09-10', 665000.00, 685000.00, 42, 'Conventional', 148, 'Victor Chang', 0.030, 19950.00, 'Conventional', 133000.00, 532000.00, 7.000, 18500.00, true, 675000.00, 'Cherry Creek luxury shopping', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3048.pdf'),
(3049, 2050, 1028, '2023-09-18', 605000.00, 625000.00, 38, 'Conventional', 149, 'Wendy Garcia', 0.030, 18150.00, 'Conventional', 121000.00, 484000.00, 7.125, 16800.00, true, 615000.00, 'Family community amenities', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3049.pdf'),
(3050, 2057, 1029, '2023-10-05', 1425000.00, 1450000.00, 35, 'Jumbo', 150, 'Xavier Patel', 0.025, 35625.00, 'Jumbo', 285000.00, 1140000.00, 6.875, 35500.00, true, 1440000.00, 'Desert mountain privacy', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3050.pdf'),
(3051, 2058, 1030, '2023-10-15', 465000.00, 485000.00, 42, 'Conventional', 151, 'Yara Lee', 0.030, 13950.00, 'Conventional', 93000.00, 372000.00, 7.250, 12500.00, true, 475000.00, 'Camelback mountain views', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3051.pdf'),
(3052, 2059, 1031, '2023-10-22', 605000.00, 625000.00, 38, 'Conventional', 152, 'Zoe Davis', 0.030, 18150.00, 'Conventional', 121000.00, 484000.00, 7.125, 16500.00, true, 615000.00, 'Red rock hiking access', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3052.pdf'),
(3053, 2060, 1032, '2023-11-05', 705000.00, 725000.00, 35, 'Conventional', 153, 'Adam Rodriguez', 0.030, 21150.00, 'Conventional', 141000.00, 564000.00, 7.000, 19500.00, true, 715000.00, 'Biltmore district exclusivity', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3053.pdf'),

-- Final 2023 sales - Year-end market
(3054, 2021, 1033, '2023-11-15', 605000.00, 625000.00, 42, 'Conventional', 154, 'Betty Wilson', 0.030, 18150.00, 'Conventional', 121000.00, 484000.00, 7.250, 16800.00, true, 615000.00, 'Bay Area tech transfer', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3054.pdf'),
(3055, 2022, 1034, '2023-11-22', 1095000.00, 1125000.00, 28, 'Jumbo', 155, 'Carlos Martinez', 0.025, 27375.00, 'Jumbo', 219000.00, 876000.00, 6.875, 28500.00, true, 1110000.00, 'Coastal commission approval', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3055.pdf'),
(3056, 2023, 1035, '2023-12-05', 875000.00, 895000.00, 32, 'Jumbo', 156, 'Diana Johnson', 0.025, 21875.00, 'Jumbo', 175000.00, 700000.00, 6.750, 24500.00, true, 885000.00, 'Stanford University proximity', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3056.pdf'),
(3057, 2011, 1001, '2023-12-15', 305000.00, 315000.00, 48, 'Conventional', 157, 'Eric Chen', 0.030, 9150.00, 'Conventional', 61000.00, 244000.00, 7.375, 8500.00, true, 308000.00, 'Investment property', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3057.pdf'),
(3058, 2012, 1002, '2023-12-22', 385000.00, 395000.00, 52, 'Conventional', 158, 'Fiona Davis', 0.030, 11550.00, 'Conventional', 77000.00, 308000.00, 7.250, 10200.00, true, 390000.00, 'End of year closing', 'COMPLETED', '@PURCHASE_AGREEMENTS_STAGE/agreement_3058.pdf');

-- ================================================================
-- VERIFY SALES DATA INSERTION
-- ================================================================
SELECT 'HOUSE_SALES' AS TABLE_NAME, COUNT(*) AS RECORD_COUNT FROM HOUSE_SALES
UNION ALL
SELECT 'Sales Period' AS INFO, 'January 2022 - December 2023' AS DETAILS
UNION ALL
SELECT 'Geographic Coverage' AS INFO, '5 States: TX, CA, FL, CO, AZ' AS DETAILS;

-- ================================================================
-- TEMPORAL ANALYSIS QUERIES
-- ================================================================

-- Sales by year and quarter
SELECT 
    YEAR(SALE_DATE) AS SALE_YEAR,
    QUARTER(SALE_DATE) AS SALE_QUARTER,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    AVG(INTEREST_RATE) AS AVG_INTEREST_RATE,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET
FROM HOUSE_SALES
GROUP BY YEAR(SALE_DATE), QUARTER(SALE_DATE)
ORDER BY SALE_YEAR, SALE_QUARTER;

-- Geographic sales distribution
SELECT 
    hc.STATE,
    COUNT(hs.SALE_ID) AS SALES_COUNT,
    AVG(hs.SALE_PRICE) AS AVG_SALE_PRICE,
    MIN(hs.SALE_PRICE) AS MIN_SALE_PRICE,
    MAX(hs.SALE_PRICE) AS MAX_SALE_PRICE,
    AVG(hs.SALE_PRICE / hc.SQUARE_FOOTAGE) AS AVG_PRICE_PER_SQFT
FROM HOUSE_SALES hs
JOIN HOUSE_CHARACTERISTICS hc ON hs.HOUSE_ID = hc.HOUSE_ID
GROUP BY hc.STATE
ORDER BY AVG_SALE_PRICE DESC;

-- Interest rate trends over time
SELECT 
    DATE_TRUNC('MONTH', SALE_DATE) AS SALE_MONTH,
    COUNT(*) AS SALES_COUNT,
    AVG(INTEREST_RATE) AS AVG_INTEREST_RATE,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE
FROM HOUSE_SALES
WHERE FINANCING_TYPE != 'Cash'
GROUP BY DATE_TRUNC('MONTH', SALE_DATE)
ORDER BY SALE_MONTH;

COMMENT ON TABLE HOUSE_SALES IS 'Complete sales transactions for 2022-2023 across TX, CA, FL, CO, AZ markets with 58 sales';