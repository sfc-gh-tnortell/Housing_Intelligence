-- ================================================================
-- HOUSING INTELLIGENCE SEMANTIC VIEW V2
-- ================================================================
-- Comprehensive semantic view joining all housing data with derived dimensions
-- Optimized for Cortex Analyst with 1:1 customer-house relationship
-- Supports natural language queries across sales, customers, and properties

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- CREATE COMPREHENSIVE SEMANTIC VIEW
-- ================================================================
CREATE OR REPLACE VIEW HOUSING_SALES_SEMANTIC_VIEW AS
SELECT 
    -- ================================================================
    -- PRIMARY KEYS AND IDENTIFIERS
    -- ================================================================
    hs.SALE_ID,
    hs.HOUSE_ID,
    hs.CUSTOMER_ID,
    hs.AGENT_ID,
    
    -- ================================================================
    -- CORE TRANSACTION DATA
    -- ================================================================
    hs.SALE_DATE,
    hs.SALE_PRICE,
    hs.LISTING_PRICE,
    hs.DAYS_ON_MARKET,
    hs.SALE_TYPE,
    hs.FINANCING_TYPE,
    hs.DOWN_PAYMENT_AMOUNT,
    hs.LOAN_AMOUNT,
    hs.INTEREST_RATE,
    hs.LOAN_TERM_YEARS,
    hs.MONTHLY_PAYMENT,
    hs.COMMISSION_RATE,
    hs.COMMISSION_AMOUNT,
    hs.CLOSING_COSTS,
    hs.INSPECTION_PASSED,
    hs.APPRAISAL_VALUE,
    hs.TITLE_COMPANY,
    hs.ESCROW_COMPANY,
    hs.CONTINGENCIES,
    hs.SPECIAL_TERMS,
    hs.SALE_STATUS,
    hs.PURCHASE_AGREEMENT_PATH,
    
    -- ================================================================
    -- AGENT INFORMATION
    -- ================================================================
    hs.AGENT_NAME,
    hs.AGENT_COMPANY,
    
    -- ================================================================
    -- PROPERTY CHARACTERISTICS
    -- ================================================================
    hc.ADDRESS AS PROPERTY_ADDRESS,
    hc.CITY AS PROPERTY_CITY,
    hc.STATE AS PROPERTY_STATE,
    hc.ZIP_CODE AS PROPERTY_ZIP_CODE,
    hc.COUNTY AS PROPERTY_COUNTY,
    hc.BEDROOMS,
    hc.BATHROOMS,
    hc.SQUARE_FOOTAGE,
    hc.LOT_SIZE_SQFT,
    hc.YEAR_BUILT,
    hc.PROPERTY_TYPE,
    hc.GARAGE_SPACES,
    hc.HAS_POOL,
    hc.HAS_FIREPLACE,
    hc.HAS_BASEMENT,
    hc.HAS_DECK_PATIO,
    hc.HAS_GARDEN,
    hc.FLOORING_TYPE,
    hc.HEATING_TYPE,
    hc.COOLING_TYPE,
    hc.NEIGHBORHOOD,
    hc.SCHOOL_DISTRICT,
    hc.WALK_SCORE,
    hc.CRIME_RATE,
    hc.PROXIMITY_TO_TRANSIT,
    hc.PROPERTY_TAX_ANNUAL,
    hc.HOA_FEE_MONTHLY,
    hc.LAST_SOLD_DATE,
    hc.LAST_SOLD_PRICE,
    hc.CONDITION_RATING,
    hc.RECENT_UPDATES,
    hc.ENERGY_EFFICIENCY_RATING,
    
    -- ================================================================
    -- CUSTOMER INFORMATION
    -- ================================================================
    c.FIRST_NAME AS CUSTOMER_FIRST_NAME,
    c.LAST_NAME AS CUSTOMER_LAST_NAME,
    c.EMAIL AS CUSTOMER_EMAIL,
    c.PHONE AS CUSTOMER_PHONE,
    c.DATE_OF_BIRTH,
    c.ANNUAL_INCOME,
    c.CREDIT_SCORE,
    c.EMPLOYMENT_STATUS,
    c.MARITAL_STATUS,
    c.FAMILY_SIZE,
    c.PREFERRED_LOCATION,
    c.BUDGET_MIN,
    c.BUDGET_MAX,
    c.CUSTOMER_SINCE,
    c.HOME_STATE AS CUSTOMER_STATE,
    c.OCCUPATION,
    c.EMPLOYER,
    c.YEARS_EMPLOYED,
    c.MONTHLY_INCOME,
    c.DEBT_TO_INCOME_RATIO,
    c.SAVINGS_AMOUNT,
    c.FIRST_TIME_BUYER,
    c.PRE_APPROVED_AMOUNT,
    
    -- ================================================================
    -- DERIVED PROPERTY DIMENSIONS
    -- ================================================================
    
    -- Property Type Category
    CASE 
        WHEN hc.PROPERTY_TYPE IN ('Single Family') THEN 'Detached'
        WHEN hc.PROPERTY_TYPE IN ('Townhouse', 'Duplex') THEN 'Attached'
        WHEN hc.PROPERTY_TYPE IN ('Condo') THEN 'Multi-Unit'
        ELSE 'Other'
    END AS PROPERTY_TYPE_CATEGORY,
    
    -- Size Category based on square footage
    CASE 
        WHEN hc.SQUARE_FOOTAGE < 1500 THEN 'Compact'
        WHEN hc.SQUARE_FOOTAGE BETWEEN 1500 AND 2499 THEN 'Medium'
        WHEN hc.SQUARE_FOOTAGE BETWEEN 2500 AND 3999 THEN 'Large'
        WHEN hc.SQUARE_FOOTAGE >= 4000 THEN 'Luxury'
        ELSE 'Unknown'
    END AS SIZE_CATEGORY,
    
    -- Property Age Category
    CASE 
        WHEN (YEAR(CURRENT_DATE()) - hc.YEAR_BUILT) <= 5 THEN 'New'
        WHEN (YEAR(CURRENT_DATE()) - hc.YEAR_BUILT) <= 15 THEN 'Recent'
        ELSE 'Established'
    END AS AGE_CATEGORY,
    
    -- Bathroom Range
    CASE 
        WHEN hc.BATHROOMS <= 1.5 THEN '1-1.5'
        WHEN hc.BATHROOMS <= 2.5 THEN '2-2.5'
        WHEN hc.BATHROOMS <= 3.5 THEN '3-3.5'
        ELSE '4+'
    END AS BATHROOM_RANGE,
    
    -- Metro Area Classification
    CASE 
        WHEN hc.STATE = 'TX' AND hc.CITY IN ('Austin') THEN 'Austin Metro'
        WHEN hc.STATE = 'TX' AND hc.CITY IN ('Houston') THEN 'Houston Metro'
        WHEN hc.STATE = 'TX' AND hc.CITY IN ('Dallas', 'Fort Worth') THEN 'Dallas-Fort Worth'
        WHEN hc.STATE = 'TX' AND hc.CITY IN ('San Antonio') THEN 'San Antonio Metro'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('San Francisco', 'Mountain View', 'Saratoga', 'San Jose', 'Oakland') THEN 'Bay Area'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('Los Angeles', 'Pasadena') THEN 'Los Angeles Metro'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('San Diego', 'La Jolla') THEN 'San Diego Metro'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('Santa Barbara') THEN 'Santa Barbara Metro'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('Sacramento') THEN 'Sacramento Metro'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('Napa') THEN 'Napa Valley'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Miami Beach', 'Miami') THEN 'Miami-Dade'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Tampa') THEN 'Tampa Bay'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Fort Lauderdale') THEN 'Broward County'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Orlando') THEN 'Orlando Metro'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Jacksonville') THEN 'Jacksonville Metro'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Naples') THEN 'Southwest Florida'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('St. Petersburg') THEN 'Tampa Bay'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Palm Beach') THEN 'Palm Beach County'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Gainesville') THEN 'North Central Florida'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Key Largo') THEN 'Florida Keys'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Sarasota') THEN 'Sarasota Metro'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Denver', 'Aurora', 'Glendale') THEN 'Denver Metro'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Boulder') THEN 'Boulder County'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Colorado Springs') THEN 'Colorado Springs Metro'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Fort Collins') THEN 'Northern Colorado'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Keystone', 'Vail', 'Breckenridge') THEN 'Mountain Resort'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Golden') THEN 'West Denver'
        WHEN hc.STATE = 'AZ' AND hc.CITY IN ('Scottsdale', 'Phoenix', 'Chandler', 'Glendale', 'Tempe') THEN 'Phoenix Metro'
        WHEN hc.STATE = 'AZ' AND hc.CITY IN ('Tucson') THEN 'Tucson Metro'
        WHEN hc.STATE = 'AZ' AND hc.CITY IN ('Carefree') THEN 'North Phoenix'
        ELSE hc.CITY || ' Area'
    END AS METRO_AREA,
    
    -- ================================================================
    -- DERIVED CUSTOMER DIMENSIONS
    -- ================================================================
    
    -- Customer Age Group
    CASE 
        WHEN YEAR(CURRENT_DATE()) - YEAR(c.DATE_OF_BIRTH) BETWEEN 25 AND 30 THEN '25-30'
        WHEN YEAR(CURRENT_DATE()) - YEAR(c.DATE_OF_BIRTH) BETWEEN 31 AND 35 THEN '31-35'
        WHEN YEAR(CURRENT_DATE()) - YEAR(c.DATE_OF_BIRTH) BETWEEN 36 AND 40 THEN '36-40'
        ELSE '41+'
    END AS AGE_GROUP,
    
    -- Income Bracket
    CASE 
        WHEN c.ANNUAL_INCOME < 75000 THEN 'Under $75K'
        WHEN c.ANNUAL_INCOME BETWEEN 75000 AND 99999 THEN '$75K-$100K'
        WHEN c.ANNUAL_INCOME BETWEEN 100000 AND 149999 THEN '$100K-$150K'
        ELSE '$150K+'
    END AS INCOME_BRACKET,
    
    -- Occupation Category
    CASE 
        WHEN c.OCCUPATION IN ('Software Engineer', 'Software Architect', 'Data Scientist', 'Data Analyst', 'UX Designer', 'Product Manager', 'Tech Consultant', 'Cybersecurity Analyst') THEN 'Technology'
        WHEN c.OCCUPATION IN ('Nurse', 'Physical Therapist', 'Healthcare Admin') THEN 'Healthcare'
        WHEN c.OCCUPATION IN ('Teacher', 'University Researcher', 'Elementary Teacher') THEN 'Education'
        WHEN c.OCCUPATION IN ('Financial Analyst', 'Investment Advisor', 'Investment Manager', 'Finance Director') THEN 'Finance'
        WHEN c.OCCUPATION IN ('State Employee', 'State Government', 'Air Force Officer', 'NASA Engineer') THEN 'Government'
        WHEN c.OCCUPATION IN ('Real Estate Broker', 'Real Estate Agent') THEN 'Real Estate'
        WHEN c.OCCUPATION IN ('Energy Executive', 'Petroleum Engineer', 'Energy Analyst') THEN 'Energy'
        WHEN c.OCCUPATION IN ('Aerospace Engineer', 'Operations Manager', 'Project Manager') THEN 'Engineering'
        WHEN c.OCCUPATION IN ('Marketing Manager', 'Marketing Director', 'Marketing Coordinator') THEN 'Marketing'
        ELSE 'Other'
    END AS OCCUPATION_CATEGORY,
    
    -- ================================================================
    -- DERIVED FINANCIAL DIMENSIONS
    -- ================================================================
    
    -- Sale Price Range
    CASE 
        WHEN hs.SALE_PRICE < 400000 THEN 'Under $400K'
        WHEN hs.SALE_PRICE BETWEEN 400000 AND 599999 THEN '$400K-$600K'
        WHEN hs.SALE_PRICE BETWEEN 600000 AND 999999 THEN '$600K-$1M'
        ELSE '$1M+'
    END AS SALE_PRICE_RANGE,
    
    -- Interest Rate Range (for financed purchases)
    CASE 
        WHEN hs.FINANCING_TYPE = 'Cash' THEN 'Cash Purchase'
        WHEN hs.INTEREST_RATE < 5.0 THEN 'Under 5%'
        WHEN hs.INTEREST_RATE BETWEEN 5.0 AND 5.999 THEN '5-6%'
        WHEN hs.INTEREST_RATE BETWEEN 6.0 AND 6.999 THEN '6-7%'
        ELSE '7%+'
    END AS INTEREST_RATE_RANGE,
    
    -- Loan-to-Value Category
    CASE 
        WHEN hs.FINANCING_TYPE = 'Cash' THEN 'Cash Purchase'
        WHEN (hs.LOAN_AMOUNT / hs.SALE_PRICE) > 0.90 THEN 'High LTV (>90%)'
        WHEN (hs.LOAN_AMOUNT / hs.SALE_PRICE) BETWEEN 0.80 AND 0.90 THEN 'Medium LTV (80-90%)'
        ELSE 'Low LTV (<80%)'
    END AS LTV_CATEGORY,
    
    -- Days on Market Range
    CASE 
        WHEN hs.DAYS_ON_MARKET <= 30 THEN 'Quick (0-30)'
        WHEN hs.DAYS_ON_MARKET BETWEEN 31 AND 60 THEN 'Normal (31-60)'
        ELSE 'Slow (61+)'
    END AS DAYS_ON_MARKET_RANGE,
    
    -- Price vs Listing Performance
    CASE 
        WHEN hs.SALE_PRICE > hs.LISTING_PRICE THEN 'Above Listing'
        WHEN hs.SALE_PRICE = hs.LISTING_PRICE THEN 'At Listing'
        ELSE 'Below Listing'
    END AS PRICE_VS_LISTING,
    
    -- ================================================================
    -- CALCULATED FINANCIAL METRICS
    -- ================================================================
    
    -- Price per square foot
    ROUND(hs.SALE_PRICE / hc.SQUARE_FOOTAGE, 2) AS PRICE_PER_SQFT,
    
    -- Property age at time of sale
    YEAR(hs.SALE_DATE) - hc.YEAR_BUILT AS PROPERTY_AGE,
    
    -- Down payment percentage
    CASE 
        WHEN hs.FINANCING_TYPE = 'Cash' THEN 100.0
        ELSE ROUND((hs.DOWN_PAYMENT_AMOUNT / hs.SALE_PRICE) * 100, 1)
    END AS DOWN_PAYMENT_PERCENTAGE,
    
    -- Monthly payment as percentage of customer income
    CASE 
        WHEN hs.FINANCING_TYPE = 'Cash' THEN 0.0
        ELSE ROUND((hs.MONTHLY_PAYMENT / c.MONTHLY_INCOME) * 100, 1)
    END AS PAYMENT_TO_INCOME_RATIO,
    
    -- Price difference from listing
    hs.SALE_PRICE - hs.LISTING_PRICE AS PRICE_DIFFERENCE,
    
    -- Price difference percentage
    ROUND(((hs.SALE_PRICE - hs.LISTING_PRICE) / hs.LISTING_PRICE) * 100, 2) AS PRICE_DIFFERENCE_PCT,
    
    -- Total cost of homeownership (monthly)
    CASE 
        WHEN hs.FINANCING_TYPE = 'Cash' THEN 
            ROUND((hc.PROPERTY_TAX_ANNUAL / 12) + COALESCE(hc.HOA_FEE_MONTHLY, 0), 2)
        ELSE 
            ROUND(hs.MONTHLY_PAYMENT + (hc.PROPERTY_TAX_ANNUAL / 12) + COALESCE(hc.HOA_FEE_MONTHLY, 0), 2)
    END AS TOTAL_MONTHLY_COST,
    
    -- ================================================================
    -- TEMPORAL DERIVED FIELDS
    -- ================================================================
    YEAR(hs.SALE_DATE) AS SALE_YEAR,
    QUARTER(hs.SALE_DATE) AS SALE_QUARTER,
    MONTH(hs.SALE_DATE) AS SALE_MONTH,
    DAYOFWEEK(hs.SALE_DATE) AS SALE_DAY_OF_WEEK,
    
    -- Season classification
    CASE 
        WHEN MONTH(hs.SALE_DATE) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(hs.SALE_DATE) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(hs.SALE_DATE) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END AS SALE_SEASON,
    
    -- Contract date (estimated 30 days before sale)
    DATEADD(day, -30, hs.SALE_DATE) AS ESTIMATED_CONTRACT_DATE,
    
    -- Time between customer signup and purchase
    DATEDIFF(month, c.CUSTOMER_SINCE, hs.SALE_DATE) AS MONTHS_AS_CUSTOMER,
    
    -- ================================================================
    -- MARKET PERFORMANCE INDICATORS
    -- ================================================================
    
    -- Is this a premium property (top 25% by price in the area)?
    CASE 
        WHEN hs.SALE_PRICE > (
            SELECT PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY s.SALE_PRICE)
            FROM HOUSE_SALES s 
            JOIN HOUSE_CHARACTERISTICS h ON s.HOUSE_ID = h.HOUSE_ID
            WHERE h.STATE = hc.STATE
        ) THEN TRUE
        ELSE FALSE
    END AS IS_PREMIUM_PROPERTY,
    
    -- Market velocity indicator
    CASE 
        WHEN hs.DAYS_ON_MARKET <= 14 THEN 'Hot Market'
        WHEN hs.DAYS_ON_MARKET <= 30 THEN 'Normal Market'
        WHEN hs.DAYS_ON_MARKET <= 60 THEN 'Slow Market'
        ELSE 'Cold Market'
    END AS MARKET_VELOCITY,
    
    -- ================================================================
    -- BOOLEAN FLAGS FOR ANALYSIS
    -- ================================================================
    
    -- Property feature flags
    hc.HAS_POOL AS HAS_SWIMMING_POOL,
    hc.HAS_FIREPLACE AS HAS_FIREPLACE_FLAG,
    hc.HAS_BASEMENT AS HAS_BASEMENT_FLAG,
    hc.HAS_DECK_PATIO AS HAS_OUTDOOR_SPACE,
    hc.HAS_GARDEN AS HAS_GARDEN_FLAG,
    
    -- Transaction type flags
    CASE WHEN hs.FINANCING_TYPE = 'Cash' THEN TRUE ELSE FALSE END AS IS_CASH_PURCHASE,
    CASE WHEN hs.FINANCING_TYPE = 'FHA' THEN TRUE ELSE FALSE END AS IS_FHA_LOAN,
    CASE WHEN hs.FINANCING_TYPE = 'VA' THEN TRUE ELSE FALSE END AS IS_VA_LOAN,
    CASE WHEN hs.FINANCING_TYPE = 'Jumbo' THEN TRUE ELSE FALSE END AS IS_JUMBO_LOAN,
    
    -- Customer characteristic flags
    c.FIRST_TIME_BUYER AS IS_FIRST_TIME_BUYER,
    CASE WHEN c.MARITAL_STATUS = 'Married' THEN TRUE ELSE FALSE END AS IS_MARRIED,
    CASE WHEN c.FAMILY_SIZE > 2 THEN TRUE ELSE FALSE END AS HAS_CHILDREN,
    CASE WHEN c.EMPLOYMENT_STATUS = 'Self-employed' THEN TRUE ELSE FALSE END AS IS_SELF_EMPLOYED,
    
    -- High-value indicators
    CASE WHEN hs.SALE_PRICE >= 1000000 THEN TRUE ELSE FALSE END AS IS_LUXURY_PURCHASE,
    CASE WHEN c.ANNUAL_INCOME >= 200000 THEN TRUE ELSE FALSE END AS IS_HIGH_INCOME,
    CASE WHEN c.CREDIT_SCORE >= 750 THEN TRUE ELSE FALSE END AS HAS_EXCELLENT_CREDIT

FROM 
    HOUSE_SALES hs
    INNER JOIN HOUSE_CHARACTERISTICS hc ON hs.HOUSE_ID = hc.HOUSE_ID
    INNER JOIN CUSTOMERS c ON hs.CUSTOMER_ID = c.CUSTOMER_ID;

-- ================================================================
-- ADD COMMENTS FOR DOCUMENTATION
-- ================================================================
COMMENT ON VIEW HOUSING_SALES_SEMANTIC_VIEW IS 
'Comprehensive semantic view for Housing Intelligence V2 with 1:1 customer-house relationships. 
Combines sales transactions, property characteristics, and customer demographics with derived dimensions for Cortex Analyst. 
Supports natural language queries across 59 sales transactions spanning 5 states from 2022-2023.';

-- ================================================================
-- GRANT PERMISSIONS
-- ================================================================
GRANT SELECT ON VIEW HOUSING_SALES_SEMANTIC_VIEW TO ROLE SYSADMIN;
GRANT SELECT ON VIEW HOUSING_SALES_SEMANTIC_VIEW TO ROLE PUBLIC;

-- ================================================================
-- CREATE PERFORMANCE-OPTIMIZED INDEXES
-- ================================================================
-- Note: Indexes on views are created automatically based on underlying table indexes

-- ================================================================
-- VERIFICATION QUERIES
-- ================================================================

-- Verify the view works and shows expected data
SELECT 
    'SEMANTIC VIEW VERIFICATION' AS TEST_NAME,
    COUNT(*) AS TOTAL_RECORDS,
    COUNT(DISTINCT CUSTOMER_ID) AS UNIQUE_CUSTOMERS,
    COUNT(DISTINCT HOUSE_ID) AS UNIQUE_PROPERTIES,
    MIN(SALE_DATE) AS EARLIEST_SALE,
    MAX(SALE_DATE) AS LATEST_SALE
FROM HOUSING_SALES_SEMANTIC_VIEW;

-- Test derived dimensions
SELECT 
    PROPERTY_STATE,
    SALE_PRICE_RANGE,
    INCOME_BRACKET,
    FINANCING_TYPE,
    COUNT(*) AS SALES_COUNT
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY PROPERTY_STATE, SALE_PRICE_RANGE, INCOME_BRACKET, FINANCING_TYPE
ORDER BY PROPERTY_STATE, SALES_COUNT DESC
LIMIT 20;

-- Test calculated metrics
SELECT 
    PROPERTY_STATE,
    ROUND(AVG(PRICE_PER_SQFT), 2) AS AVG_PRICE_PER_SQFT,
    ROUND(AVG(PROPERTY_AGE), 1) AS AVG_PROPERTY_AGE,
    ROUND(AVG(DOWN_PAYMENT_PERCENTAGE), 1) AS AVG_DOWN_PAYMENT_PCT,
    COUNT(*) AS SALES_COUNT
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY PROPERTY_STATE
ORDER BY AVG_PRICE_PER_SQFT DESC;

-- Test temporal dimensions
SELECT 
    SALE_YEAR,
    SALE_QUARTER,
    SALE_SEASON,
    COUNT(*) AS SALES_COUNT,
    ROUND(AVG(SALE_PRICE), 0) AS AVG_PRICE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY SALE_YEAR, SALE_QUARTER, SALE_SEASON
ORDER BY SALE_YEAR, SALE_QUARTER;

SELECT 'Semantic view created successfully with all derived dimensions and metrics' AS STATUS;