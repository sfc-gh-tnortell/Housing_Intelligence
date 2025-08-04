-- ================================================================
-- HOUSING INTELLIGENCE SEMANTIC VIEW CREATION
-- ================================================================
-- This script creates the semantic view for Cortex Analyst

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- CREATE SEMANTIC VIEW
-- ================================================================
-- The semantic view combines all three tables with enriched dimensions
-- and calculated fields for comprehensive housing sales analysis

CREATE OR REPLACE VIEW HOUSING_SALES_SEMANTIC_VIEW AS
SELECT 
    -- Primary Keys
    hs.SALE_ID,
    hs.HOUSE_ID,
    hs.CUSTOMER_ID,
    
    -- Customer Information
    c.FIRST_NAME,
    c.LAST_NAME,
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
        ELSE '$150K+' 
    END AS INCOME_BRACKET,
    
    CASE 
        WHEN c.CREDIT_SCORE < 600 THEN 'Poor'
        WHEN c.CREDIT_SCORE < 700 THEN 'Fair'
        WHEN c.CREDIT_SCORE < 750 THEN 'Good'
        WHEN c.CREDIT_SCORE < 800 THEN 'Very Good'
        ELSE 'Excellent' 
    END AS CREDIT_RATING,
    
    -- Property Information
    hc.ADDRESS,
    hc.CITY,
    hc.STATE,
    hc.ZIP_CODE,
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
    CASE 
        WHEN hc.SQUARE_FOOTAGE < 1200 THEN 'Small (Under 1,200 sq ft)'
        WHEN hc.SQUARE_FOOTAGE < 1800 THEN 'Medium (1,200-1,800 sq ft)'
        WHEN hc.SQUARE_FOOTAGE < 2500 THEN 'Large (1,800-2,500 sq ft)'
        ELSE 'Very Large (2,500+ sq ft)' 
    END AS PROPERTY_SIZE_CATEGORY,
    
    CASE 
        WHEN hc.YEAR_BUILT >= 2020 THEN 'New (2020+)'
        WHEN hc.YEAR_BUILT >= 2010 THEN 'Recent (2010-2019)'
        WHEN hc.YEAR_BUILT >= 2000 THEN 'Modern (2000-2009)'
        WHEN hc.YEAR_BUILT >= 1990 THEN 'Established (1990-1999)'
        ELSE 'Vintage (Pre-1990)' 
    END AS PROPERTY_AGE_CATEGORY,
    
    CASE 
        WHEN hc.WALK_SCORE >= 90 THEN 'Walker\'s Paradise'
        WHEN hc.WALK_SCORE >= 70 THEN 'Very Walkable'
        WHEN hc.WALK_SCORE >= 50 THEN 'Somewhat Walkable'
        ELSE 'Car-Dependent' 
    END AS WALKABILITY_CATEGORY,
    
    CASE 
        WHEN (hc.HAS_POOL = TRUE OR hc.HAS_FIREPLACE = TRUE OR hc.GARAGE_SPACES >= 3) 
        THEN 'Yes' 
        ELSE 'No' 
    END AS HAS_PREMIUM_FEATURES,
    
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
    
    -- Sale Derived Dimensions
    YEAR(hs.SALE_DATE) AS SALE_YEAR,
    MONTH(hs.SALE_DATE) AS SALE_MONTH,
    QUARTER(hs.SALE_DATE) AS SALE_QUARTER,
    MONTHNAME(hs.SALE_DATE) AS SALE_MONTH_NAME,
    
    CASE 
        WHEN hs.DAYS_ON_MARKET <= 14 THEN 'Very Fast (≤2 weeks)'
        WHEN hs.DAYS_ON_MARKET <= 30 THEN 'Fast (2-4 weeks)'
        WHEN hs.DAYS_ON_MARKET <= 60 THEN 'Normal (1-2 months)'
        ELSE 'Slow (2+ months)' 
    END AS MARKET_TIMING,
    
    -- Calculated Measures
    ROUND(hs.SALE_PRICE / hc.SQUARE_FOOTAGE, 2) AS PRICE_PER_SQFT,
    ROUND((hs.LISTING_PRICE - hs.SALE_PRICE) / hs.LISTING_PRICE * 100, 2) AS PRICE_REDUCTION_PERCENTAGE,
    ROUND(hs.DOWN_PAYMENT_AMOUNT / hs.SALE_PRICE * 100, 2) AS DOWN_PAYMENT_PERCENTAGE,
    ROUND(hs.COMMISSION_AMOUNT / hs.SALE_PRICE * 100, 4) AS COMMISSION_PERCENTAGE,
    
    -- Financial Analysis Fields
    CASE WHEN hs.FINANCING_TYPE = 'Cash' THEN 'Cash' ELSE 'Financed' END AS PAYMENT_METHOD,
    CASE 
        WHEN hs.SALE_PRICE < 250000 THEN 'Under $250K'
        WHEN hs.SALE_PRICE < 400000 THEN '$250K-$400K'
        WHEN hs.SALE_PRICE < 600000 THEN '$400K-$600K'
        ELSE '$600K+' 
    END AS SALE_PRICE_RANGE,
    
    -- Location Insights
    CONCAT(hc.CITY, ', ', hc.STATE) AS FULL_LOCATION,
    CASE 
        WHEN hc.CITY = 'Austin' THEN 'Austin Metro'
        WHEN hc.CITY IN ('Round Rock', 'Pflugerville', 'Cedar Park', 'Leander', 'Georgetown') THEN 'Austin Suburbs'
        ELSE 'Other Areas'
    END AS METRO_AREA

FROM HOUSE_SALES hs
JOIN HOUSE_CHARACTERISTICS hc ON hs.HOUSE_ID = hc.HOUSE_ID
JOIN CUSTOMERS c ON hs.CUSTOMER_ID = c.CUSTOMER_ID;

-- ================================================================
-- CREATE SEMANTIC VIEW WITH YAML DEFINITION
-- ================================================================
-- This creates the semantic view that Cortex Analyst will use
-- The YAML file path should be accessible to Snowflake

CREATE OR REPLACE SEMANTIC VIEW HOUSING_INTELLIGENCE_SEMANTIC AS (
    SELECT * FROM HOUSING_SALES_SEMANTIC_VIEW
) SEMANTIC MODEL = '@HOUSING_INTELLIGENCE.CORE.SEMANTIC_MODELS/housing_sales_model.yaml';

-- Note: The above assumes you have uploaded the YAML file to a stage
-- Alternative approach using inline semantic model definition:

-- ================================================================
-- GRANT PERMISSIONS FOR SEMANTIC VIEW
-- ================================================================
GRANT SELECT ON VIEW HOUSING_SALES_SEMANTIC_VIEW TO ROLE SYSADMIN;
GRANT ALL ON SEMANTIC VIEW HOUSING_INTELLIGENCE_SEMANTIC TO ROLE SYSADMIN;

-- ================================================================
-- TEST QUERIES FOR SEMANTIC VIEW
-- ================================================================

-- Test basic functionality
SELECT COUNT(*) AS TOTAL_RECORDS FROM HOUSING_SALES_SEMANTIC_VIEW;

-- Test derived dimensions
SELECT 
    CUSTOMER_AGE_GROUP,
    COUNT(*) AS CUSTOMER_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY CUSTOMER_AGE_GROUP
ORDER BY AVG_SALE_PRICE DESC;

-- Test property analysis
SELECT 
    PROPERTY_SIZE_CATEGORY,
    PROPERTY_TYPE,
    COUNT(*) AS SALES_COUNT,
    AVG(PRICE_PER_SQFT) AS AVG_PRICE_PER_SQFT
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY PROPERTY_SIZE_CATEGORY, PROPERTY_TYPE
ORDER BY AVG_PRICE_PER_SQFT DESC;

-- Test market timing analysis
SELECT 
    MARKET_TIMING,
    COUNT(*) AS SALES_COUNT,
    AVG(PRICE_REDUCTION_PERCENTAGE) AS AVG_PRICE_REDUCTION
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY MARKET_TIMING
ORDER BY AVG_PRICE_REDUCTION;

COMMENT ON VIEW HOUSING_SALES_SEMANTIC_VIEW IS 'Comprehensive view combining customer, property, and sales data with derived dimensions for Cortex Analyst';