-- ================================================================
-- HOUSING INTELLIGENCE SEMANTIC VIEW FOR CORTEX ANALYST
-- ================================================================
-- This script creates comprehensive semantic views that combine all data sources
-- and provide enriched dimensions for Cortex Analyst queries

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- CREATE COMPREHENSIVE SEMANTIC VIEW
-- ================================================================
-- This view combines all tables with derived dimensions and calculated fields
-- for comprehensive housing sales analysis

CREATE OR REPLACE VIEW HOUSING_SALES_SEMANTIC_VIEW AS
SELECT 
    -- Primary Keys and Identifiers
    hs.SALE_ID,
    hs.HOUSE_ID,
    hs.CUSTOMER_ID,
    pa.AGREEMENT_ID,
    
    -- Customer Information
    c.FIRST_NAME,
    c.LAST_NAME,
    c.FIRST_NAME || ' ' || c.LAST_NAME AS FULL_NAME,
    c.EMAIL,
    c.PHONE,
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
    
    -- Customer Derived Dimensions
    DATEDIFF('year', c.DATE_OF_BIRTH, CURRENT_DATE()) AS CUSTOMER_AGE,
    CASE 
        WHEN DATEDIFF('year', c.DATE_OF_BIRTH, CURRENT_DATE()) < 30 THEN 'Under 30'
        WHEN DATEDIFF('year', c.DATE_OF_BIRTH, CURRENT_DATE()) < 40 THEN '30-39'
        WHEN DATEDIFF('year', c.DATE_OF_BIRTH, CURRENT_DATE()) < 50 THEN '40-49'
        WHEN DATEDIFF('year', c.DATE_OF_BIRTH, CURRENT_DATE()) < 60 THEN '50-59'
        ELSE '60+' 
    END AS CUSTOMER_AGE_GROUP,
    
    CASE 
        WHEN c.ANNUAL_INCOME < 50000 THEN 'Under $50K'
        WHEN c.ANNUAL_INCOME < 75000 THEN '$50K-$75K'
        WHEN c.ANNUAL_INCOME < 100000 THEN '$75K-$100K'
        WHEN c.ANNUAL_INCOME < 150000 THEN '$100K-$150K'
        WHEN c.ANNUAL_INCOME < 200000 THEN '$150K-$200K'
        ELSE '$200K+' 
    END AS INCOME_BRACKET,
    
    CASE 
        WHEN c.CREDIT_SCORE < 600 THEN 'Poor (Under 600)'
        WHEN c.CREDIT_SCORE < 650 THEN 'Fair (600-649)'
        WHEN c.CREDIT_SCORE < 700 THEN 'Good (650-699)'
        WHEN c.CREDIT_SCORE < 750 THEN 'Very Good (700-749)'
        WHEN c.CREDIT_SCORE < 800 THEN 'Excellent (750-799)'
        ELSE 'Exceptional (800+)' 
    END AS CREDIT_RATING,
    
    DATEDIFF('month', c.CUSTOMER_SINCE, CURRENT_DATE()) AS CUSTOMER_TENURE_MONTHS,
    
    -- Property Information
    hc.ADDRESS,
    hc.CITY,
    hc.STATE,
    hc.ZIP_CODE,
    hc.ADDRESS || ', ' || hc.CITY || ', ' || hc.STATE || ' ' || hc.ZIP_CODE AS FULL_ADDRESS,
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
    hc.FLOORING_TYPE,
    hc.HEATING_TYPE,
    hc.COOLING_TYPE,
    hc.NEIGHBORHOOD,
    hc.SCHOOL_DISTRICT,
    hc.WALK_SCORE,
    hc.CRIME_RATE,
    hc.LISTING_DATE,
    hc.LISTING_PRICE AS ORIGINAL_LISTING_PRICE,
    hc.PROPERTY_TAX_ANNUAL,
    hc.HOA_FEE_MONTHLY,
    
    -- Property Derived Dimensions
    CURRENT_DATE() - hc.YEAR_BUILT AS PROPERTY_AGE_YEARS,
    CASE 
        WHEN hc.SQUARE_FOOTAGE < 1000 THEN 'Compact (Under 1,000 sq ft)'
        WHEN hc.SQUARE_FOOTAGE < 1500 THEN 'Small (1,000-1,499 sq ft)'
        WHEN hc.SQUARE_FOOTAGE < 2000 THEN 'Medium (1,500-1,999 sq ft)'
        WHEN hc.SQUARE_FOOTAGE < 2500 THEN 'Large (2,000-2,499 sq ft)'
        WHEN hc.SQUARE_FOOTAGE < 3500 THEN 'Very Large (2,500-3,499 sq ft)'
        ELSE 'Luxury (3,500+ sq ft)' 
    END AS PROPERTY_SIZE_CATEGORY,
    
    CASE 
        WHEN hc.YEAR_BUILT >= 2020 THEN 'New Construction (2020+)'
        WHEN hc.YEAR_BUILT >= 2010 THEN 'Recent (2010-2019)'
        WHEN hc.YEAR_BUILT >= 2000 THEN 'Modern (2000-2009)'
        WHEN hc.YEAR_BUILT >= 1990 THEN 'Established (1990-1999)'
        WHEN hc.YEAR_BUILT >= 1980 THEN 'Mature (1980-1989)'
        ELSE 'Vintage (Pre-1980)' 
    END AS PROPERTY_AGE_CATEGORY,
    
    CASE 
        WHEN hc.WALK_SCORE >= 90 THEN 'Walker\'s Paradise (90-100)'
        WHEN hc.WALK_SCORE >= 70 THEN 'Very Walkable (70-89)'
        WHEN hc.WALK_SCORE >= 50 THEN 'Somewhat Walkable (50-69)'
        WHEN hc.WALK_SCORE >= 25 THEN 'Car-Dependent (25-49)'
        ELSE 'Car Required (0-24)' 
    END AS WALKABILITY_CATEGORY,
    
    CASE 
        WHEN (hc.HAS_POOL = TRUE OR hc.HAS_FIREPLACE = TRUE OR hc.GARAGE_SPACES >= 3 OR hc.HAS_BASEMENT = TRUE) 
        THEN 'Premium Features' 
        ELSE 'Standard Features' 
    END AS PREMIUM_FEATURES,
    
    CASE 
        WHEN hc.GARAGE_SPACES = 0 THEN 'No Garage'
        WHEN hc.GARAGE_SPACES = 1 THEN 'Single Car'
        WHEN hc.GARAGE_SPACES = 2 THEN 'Two Car'
        ELSE 'Multi-Car (3+)'
    END AS GARAGE_CATEGORY,
    
    -- Sale Information
    hs.SALE_DATE,
    hs.SALE_PRICE,
    hs.LISTING_PRICE AS SALE_LISTING_PRICE,
    hs.DAYS_ON_MARKET,
    hs.SALE_TYPE,
    hs.AGENT_ID,
    hs.AGENT_NAME,
    hs.COMMISSION_RATE,
    hs.COMMISSION_AMOUNT,
    hs.FINANCING_TYPE,
    hs.DOWN_PAYMENT_AMOUNT,
    hs.LOAN_AMOUNT,
    hs.INTEREST_RATE,
    hs.CLOSING_COSTS,
    hs.INSPECTION_PASSED,
    hs.APPRAISAL_VALUE,
    hs.CONTINGENCIES,
    hs.SALE_STATUS,
    hs.PURCHASE_AGREEMENT_PATH,
    
    -- Sale Derived Dimensions
    YEAR(hs.SALE_DATE) AS SALE_YEAR,
    MONTH(hs.SALE_DATE) AS SALE_MONTH,
    QUARTER(hs.SALE_DATE) AS SALE_QUARTER,
    MONTHNAME(hs.SALE_DATE) AS SALE_MONTH_NAME,
    CASE 
        WHEN MONTH(hs.SALE_DATE) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(hs.SALE_DATE) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(hs.SALE_DATE) IN (6, 7, 8) THEN 'Summer'
        ELSE 'Fall'
    END AS SALE_SEASON,
    
    CASE 
        WHEN hs.DAYS_ON_MARKET <= 14 THEN 'Very Fast (≤2 weeks)'
        WHEN hs.DAYS_ON_MARKET <= 30 THEN 'Fast (2-4 weeks)'
        WHEN hs.DAYS_ON_MARKET <= 60 THEN 'Normal (1-2 months)'
        WHEN hs.DAYS_ON_MARKET <= 90 THEN 'Slow (2-3 months)'
        ELSE 'Very Slow (3+ months)' 
    END AS MARKET_TIMING,
    
    CASE 
        WHEN hs.INTEREST_RATE < 4.0 THEN 'Low Rates (Under 4%)'
        WHEN hs.INTEREST_RATE < 5.0 THEN 'Moderate Rates (4-5%)'
        WHEN hs.INTEREST_RATE < 6.0 THEN 'Elevated Rates (5-6%)'
        WHEN hs.INTEREST_RATE < 7.0 THEN 'High Rates (6-7%)'
        WHEN hs.INTEREST_RATE >= 7.0 THEN 'Very High Rates (7%+)'
        ELSE 'Cash Purchase'
    END AS INTEREST_RATE_ENVIRONMENT,
    
    -- Calculated Financial Measures
    ROUND(hs.SALE_PRICE / hc.SQUARE_FOOTAGE, 2) AS PRICE_PER_SQFT,
    ROUND((hs.LISTING_PRICE - hs.SALE_PRICE) / hs.LISTING_PRICE * 100, 2) AS PRICE_REDUCTION_PERCENTAGE,
    ROUND(hs.SALE_PRICE / hs.LISTING_PRICE, 4) AS SALE_TO_LIST_RATIO,
    ROUND(hs.DOWN_PAYMENT_AMOUNT / hs.SALE_PRICE * 100, 2) AS DOWN_PAYMENT_PERCENTAGE,
    ROUND(hs.LOAN_AMOUNT / hs.SALE_PRICE * 100, 2) AS LOAN_TO_VALUE_PERCENTAGE,
    ROUND(hs.COMMISSION_AMOUNT / hs.SALE_PRICE * 100, 4) AS COMMISSION_PERCENTAGE,
    
    -- Financial Analysis Categories
    CASE WHEN hs.FINANCING_TYPE = 'Cash' THEN 'Cash Purchase' ELSE 'Financed Purchase' END AS PAYMENT_METHOD,
    
    CASE 
        WHEN hs.SALE_PRICE < 300000 THEN 'Under $300K'
        WHEN hs.SALE_PRICE < 500000 THEN '$300K-$500K'
        WHEN hs.SALE_PRICE < 750000 THEN '$500K-$750K'
        WHEN hs.SALE_PRICE < 1000000 THEN '$750K-$1M'
        WHEN hs.SALE_PRICE < 1500000 THEN '$1M-$1.5M'
        ELSE '$1.5M+' 
    END AS SALE_PRICE_RANGE,
    
    CASE 
        WHEN hs.FINANCING_TYPE = 'Cash' THEN 'Cash Purchase'
        WHEN (hs.DOWN_PAYMENT_AMOUNT / hs.SALE_PRICE) < 0.05 THEN 'Low Down (Under 5%)'
        WHEN (hs.DOWN_PAYMENT_AMOUNT / hs.SALE_PRICE) < 0.10 THEN 'Standard Down (5-10%)'
        WHEN (hs.DOWN_PAYMENT_AMOUNT / hs.SALE_PRICE) < 0.20 THEN 'Moderate Down (10-20%)'
        ELSE 'High Down (20%+)'
    END AS DOWN_PAYMENT_CATEGORY,
    
    -- Geographic Market Classification
    CASE 
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('San Jose', 'Palo Alto', 'Mountain View') THEN 'Silicon Valley'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('San Francisco', 'Oakland') THEN 'Bay Area'
        WHEN hc.STATE = 'CA' AND hc.CITY IN ('Los Angeles', 'Beverly Hills', 'West Hollywood') THEN 'Greater LA'
        WHEN hc.STATE = 'CA' THEN 'California Other'
        WHEN hc.STATE = 'TX' AND hc.CITY = 'Austin' THEN 'Austin Metro'
        WHEN hc.STATE = 'TX' AND hc.CITY IN ('Round Rock', 'Pflugerville', 'Cedar Park', 'Leander', 'Georgetown') THEN 'Austin Suburbs'
        WHEN hc.STATE = 'TX' AND hc.CITY = 'Houston' THEN 'Houston Metro'
        WHEN hc.STATE = 'TX' THEN 'Texas Other'
        WHEN hc.STATE = 'FL' AND hc.CITY IN ('Miami', 'Miami Beach', 'Fort Lauderdale', 'Key Biscayne', 'Coral Gables') THEN 'South Florida'
        WHEN hc.STATE = 'FL' THEN 'Florida Other'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Denver', 'Aurora') THEN 'Denver Metro'
        WHEN hc.STATE = 'CO' AND hc.CITY IN ('Vail', 'Steamboat Springs') THEN 'Colorado Ski'
        WHEN hc.STATE = 'CO' THEN 'Colorado Other'
        WHEN hc.STATE = 'AZ' AND hc.CITY IN ('Phoenix', 'Scottsdale', 'Tempe', 'Chandler') THEN 'Phoenix Metro'
        WHEN hc.STATE = 'AZ' THEN 'Arizona Other'
        ELSE 'Other Markets'
    END AS REGIONAL_MARKET,
    
    -- Purchase Agreement Information
    pa.DOCUMENT_NAME,
    pa.DOCUMENT_PATH,
    pa.CONTRACT_DATE,
    pa.CLOSING_DATE,
    pa.SPECIAL_TERMS,
    pa.CONTINGENCY_DETAILS,
    pa.FINANCING_DETAILS,
    pa.UPLOAD_DATE AS AGREEMENT_UPLOAD_DATE,
    
    -- Agreement Derived Fields
    CASE WHEN pa.AGREEMENT_ID IS NOT NULL THEN 'Available' ELSE 'Missing' END AS AGREEMENT_STATUS,
    DATEDIFF('day', pa.CONTRACT_DATE, hs.SALE_DATE) AS CONTRACT_TO_CLOSING_DAYS

FROM HOUSE_SALES hs
JOIN HOUSE_CHARACTERISTICS hc ON hs.HOUSE_ID = hc.HOUSE_ID
JOIN CUSTOMERS c ON hs.CUSTOMER_ID = c.CUSTOMER_ID
LEFT JOIN PURCHASE_AGREEMENTS pa ON hs.SALE_ID = pa.SALE_ID;

-- ================================================================
-- CREATE SEMANTIC VIEW FOR CORTEX ANALYST
-- ================================================================
-- This creates the official semantic view that Cortex Analyst will use

CREATE OR REPLACE SEMANTIC VIEW HOUSING_INTELLIGENCE_ANALYST_VIEW AS (
    SELECT * FROM HOUSING_SALES_SEMANTIC_VIEW
) SEMANTIC MODEL = '@SEMANTIC_MODELS_STAGE/housing_sales_intelligence_model.yaml';

-- ================================================================
-- CREATE ANALYTICAL VIEWS FOR COMMON QUERIES
-- ================================================================

-- Monthly sales trends with market metrics
CREATE OR REPLACE VIEW MONTHLY_SALES_TRENDS AS
SELECT 
    SALE_YEAR,
    SALE_MONTH,
    SALE_MONTH_NAME,
    SALE_QUARTER,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    MEDIAN(SALE_PRICE) AS MEDIAN_SALE_PRICE,
    SUM(SALE_PRICE) AS TOTAL_SALES_VOLUME,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    AVG(PRICE_PER_SQFT) AS AVG_PRICE_PER_SQFT,
    AVG(INTEREST_RATE) AS AVG_INTEREST_RATE,
    COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) AS CASH_SALES_COUNT,
    ROUND(COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) * 100.0 / COUNT(*), 1) AS CASH_SALES_PERCENTAGE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY SALE_YEAR, SALE_MONTH, SALE_MONTH_NAME, SALE_QUARTER
ORDER BY SALE_YEAR, SALE_MONTH;

-- Regional market performance
CREATE OR REPLACE VIEW REGIONAL_MARKET_PERFORMANCE AS
SELECT 
    STATE,
    REGIONAL_MARKET,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    MEDIAN(SALE_PRICE) AS MEDIAN_SALE_PRICE,
    AVG(PRICE_PER_SQFT) AS AVG_PRICE_PER_SQFT,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    AVG(WALK_SCORE) AS AVG_WALK_SCORE,
    MIN(SALE_PRICE) AS MIN_SALE_PRICE,
    MAX(SALE_PRICE) AS MAX_SALE_PRICE,
    STDDEV(SALE_PRICE) AS PRICE_VOLATILITY
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY STATE, REGIONAL_MARKET
ORDER BY AVG_SALE_PRICE DESC;

-- Property type analysis
CREATE OR REPLACE VIEW PROPERTY_TYPE_ANALYSIS AS
SELECT 
    PROPERTY_TYPE,
    PROPERTY_SIZE_CATEGORY,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    AVG(PRICE_PER_SQFT) AS AVG_PRICE_PER_SQFT,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    AVG(SQUARE_FOOTAGE) AS AVG_SQUARE_FOOTAGE,
    COUNT(CASE WHEN PREMIUM_FEATURES = 'Premium Features' THEN 1 END) AS PREMIUM_COUNT,
    ROUND(COUNT(CASE WHEN PREMIUM_FEATURES = 'Premium Features' THEN 1 END) * 100.0 / COUNT(*), 1) AS PREMIUM_PERCENTAGE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY PROPERTY_TYPE, PROPERTY_SIZE_CATEGORY
ORDER BY AVG_SALE_PRICE DESC;

-- Customer segment analysis
CREATE OR REPLACE VIEW CUSTOMER_SEGMENT_ANALYSIS AS
SELECT 
    CUSTOMER_AGE_GROUP,
    INCOME_BRACKET,
    CREDIT_RATING,
    COUNT(*) AS CUSTOMER_COUNT,
    AVG(SALE_PRICE) AS AVG_PURCHASE_PRICE,
    AVG(ANNUAL_INCOME) AS AVG_INCOME,
    AVG(CREDIT_SCORE) AS AVG_CREDIT_SCORE,
    AVG(DOWN_PAYMENT_PERCENTAGE) AS AVG_DOWN_PAYMENT_PCT,
    COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) AS CASH_BUYERS,
    ROUND(COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) * 100.0 / COUNT(*), 1) AS CASH_BUYER_PERCENTAGE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY CUSTOMER_AGE_GROUP, INCOME_BRACKET, CREDIT_RATING
HAVING COUNT(*) >= 1
ORDER BY AVG_PURCHASE_PRICE DESC;

-- Agent performance analysis
CREATE OR REPLACE VIEW AGENT_PERFORMANCE_ANALYSIS AS
SELECT 
    AGENT_NAME,
    COUNT(*) AS SALES_COUNT,
    SUM(SALE_PRICE) AS TOTAL_SALES_VOLUME,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    AVG(COMMISSION_RATE) AS AVG_COMMISSION_RATE,
    SUM(COMMISSION_AMOUNT) AS TOTAL_COMMISSION,
    COUNT(DISTINCT STATE) AS STATES_COVERED,
    MIN(SALE_DATE) AS FIRST_SALE,
    MAX(SALE_DATE) AS LATEST_SALE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY AGENT_NAME
HAVING COUNT(*) >= 1
ORDER BY TOTAL_SALES_VOLUME DESC;

-- Interest rate impact analysis
CREATE OR REPLACE VIEW INTEREST_RATE_IMPACT_ANALYSIS AS
SELECT 
    INTEREST_RATE_ENVIRONMENT,
    SALE_YEAR,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    AVG(INTEREST_RATE) AS AVG_INTEREST_RATE,
    AVG(DOWN_PAYMENT_PERCENTAGE) AS AVG_DOWN_PAYMENT_PCT,
    COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) AS CASH_SALES,
    ROUND(COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) * 100.0 / COUNT(*), 1) AS CASH_SALES_PCT
FROM HOUSING_SALES_SEMANTIC_VIEW
WHERE FINANCING_TYPE != 'Cash'
GROUP BY INTEREST_RATE_ENVIRONMENT, SALE_YEAR
ORDER BY SALE_YEAR, AVG_INTEREST_RATE;

-- ================================================================
-- GRANT PERMISSIONS FOR ALL VIEWS
-- ================================================================
GRANT SELECT ON VIEW HOUSING_SALES_SEMANTIC_VIEW TO ROLE SYSADMIN;
GRANT ALL ON SEMANTIC VIEW HOUSING_INTELLIGENCE_ANALYST_VIEW TO ROLE SYSADMIN;
GRANT SELECT ON VIEW MONTHLY_SALES_TRENDS TO ROLE SYSADMIN;
GRANT SELECT ON VIEW REGIONAL_MARKET_PERFORMANCE TO ROLE SYSADMIN;
GRANT SELECT ON VIEW PROPERTY_TYPE_ANALYSIS TO ROLE SYSADMIN;
GRANT SELECT ON VIEW CUSTOMER_SEGMENT_ANALYSIS TO ROLE SYSADMIN;
GRANT SELECT ON VIEW AGENT_PERFORMANCE_ANALYSIS TO ROLE SYSADMIN;
GRANT SELECT ON VIEW INTEREST_RATE_IMPACT_ANALYSIS TO ROLE SYSADMIN;

-- ================================================================
-- VALIDATION AND TESTING
-- ================================================================

-- Test the semantic view
SELECT COUNT(*) AS TOTAL_RECORDS FROM HOUSING_SALES_SEMANTIC_VIEW;

-- Test derived dimensions
SELECT 
    REGIONAL_MARKET,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_PRICE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY REGIONAL_MARKET
ORDER BY AVG_PRICE DESC;

-- Test temporal analysis
SELECT 
    SALE_YEAR,
    SALE_QUARTER,
    COUNT(*) AS SALES_COUNT,
    AVG(INTEREST_RATE) AS AVG_RATE
FROM HOUSING_SALES_SEMANTIC_VIEW
WHERE FINANCING_TYPE != 'Cash'
GROUP BY SALE_YEAR, SALE_QUARTER
ORDER BY SALE_YEAR, SALE_QUARTER;

-- Display creation summary
SELECT 
    'Semantic View: HOUSING_SALES_SEMANTIC_VIEW' AS CREATED,
    'Rows: ' || COUNT(*) AS RECORD_COUNT,
    'Date Range: ' || MIN(SALE_DATE) || ' to ' || MAX(SALE_DATE) AS DATE_RANGE,
    'States: ' || COUNT(DISTINCT STATE) AS STATE_COUNT,
    'Price Range: $' || MIN(SALE_PRICE) || ' to $' || MAX(SALE_PRICE) AS PRICE_RANGE
FROM HOUSING_SALES_SEMANTIC_VIEW;

COMMENT ON VIEW HOUSING_SALES_SEMANTIC_VIEW IS 'Comprehensive semantic view combining all housing data with enriched dimensions for Cortex Analyst';
COMMENT ON SEMANTIC VIEW HOUSING_INTELLIGENCE_ANALYST_VIEW IS 'Cortex Analyst semantic view with YAML model for natural language querying';
COMMENT ON VIEW MONTHLY_SALES_TRENDS IS 'Monthly aggregated sales metrics for temporal trend analysis';
COMMENT ON VIEW REGIONAL_MARKET_PERFORMANCE IS 'Regional market comparison and performance metrics';
COMMENT ON VIEW PROPERTY_TYPE_ANALYSIS IS 'Property type and size category performance analysis';
COMMENT ON VIEW CUSTOMER_SEGMENT_ANALYSIS IS 'Customer demographic and financial segment analysis';
COMMENT ON VIEW AGENT_PERFORMANCE_ANALYSIS IS 'Real estate agent performance and productivity metrics';
COMMENT ON VIEW INTEREST_RATE_IMPACT_ANALYSIS IS 'Interest rate environment impact on sales patterns';