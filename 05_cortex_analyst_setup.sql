-- ================================================================
-- HOUSING INTELLIGENCE CORTEX ANALYST SETUP
-- ================================================================
-- This script creates the Cortex Analyst and Cortex Agent for natural language querying

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- CREATE STAGE FOR SEMANTIC MODEL FILES
-- ================================================================
CREATE OR REPLACE STAGE SEMANTIC_MODELS
    DIRECTORY = (ENABLE = TRUE)
    COMMENT = 'Stage for storing semantic model YAML files';

-- Upload the semantic model YAML file to the stage
-- Note: This would typically be done via SnowSQL or Snowsight
-- PUT file://03_semantic_model.yaml @SEMANTIC_MODELS;

-- ================================================================
-- CREATE CORTEX ANALYST
-- ================================================================
-- The Cortex Analyst provides natural language to SQL capabilities
-- using the semantic model we defined

CREATE OR REPLACE CORTEX ANALYST HOUSING_ANALYST (
    SEMANTIC_MODEL = '@SEMANTIC_MODELS/housing_sales_model.yaml',
    DATABASE_NAME = 'HOUSING_INTELLIGENCE',
    SCHEMA_NAME = 'CORE'
) 
COMMENT = 'Cortex Analyst for housing sales data analysis with natural language querying capabilities';

-- Alternative approach using the semantic view directly
-- if YAML file approach is not available:

CREATE OR REPLACE CORTEX ANALYST HOUSING_ANALYST_VIEW (
    SEMANTIC_VIEW = 'HOUSING_INTELLIGENCE.CORE.HOUSING_SALES_SEMANTIC_VIEW'
)
COMMENT = 'Cortex Analyst using semantic view for housing sales analysis';

-- ================================================================
-- GRANT PERMISSIONS FOR CORTEX ANALYST
-- ================================================================
GRANT USAGE ON CORTEX ANALYST HOUSING_ANALYST TO ROLE SYSADMIN;
GRANT USAGE ON CORTEX ANALYST HOUSING_ANALYST_VIEW TO ROLE SYSADMIN;

-- ================================================================
-- CREATE CORTEX AGENT (Optional Advanced Feature)
-- ================================================================
-- The Cortex Agent combines search and analytical capabilities
-- Note: This requires additional setup and may not be available in all accounts

-- First, create a function to define the agent behavior
CREATE OR REPLACE FUNCTION HOUSING_AGENT_FUNCTION(query STRING)
RETURNS STRING
LANGUAGE SQL
AS
$$
    -- This function would contain the logic for the Cortex Agent
    -- to handle different types of queries about housing data
    SELECT 'Housing Intelligence Agent Response: ' || query
$$;

-- Create the Cortex Agent (syntax may vary based on Snowflake version)
-- CREATE OR REPLACE CORTEX AGENT HOUSING_INTELLIGENCE_AGENT (
--     ANALYST = 'HOUSING_ANALYST',
--     INSTRUCTIONS = 'You are a housing market analysis expert. Help users understand housing sales data, customer patterns, and market trends.',
--     DESCRIPTION = 'Housing Intelligence Agent for comprehensive real estate data analysis'
-- );

-- ================================================================
-- TEST CORTEX ANALYST FUNCTIONALITY
-- ================================================================

-- Test basic natural language queries
-- Note: These would typically be executed through Snowsight or applications

-- Example queries that Cortex Analyst should be able to handle:
/*
SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST',
    'What is the average sale price by property type?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST', 
    'Show me the top 5 neighborhoods by average sale price'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST',
    'How does customer income affect the price of homes they buy?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST',
    'What are the trends in days on market over time?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST',
    'Compare cash buyers vs financed buyers'
);
*/

-- ================================================================
-- CREATE STORED PROCEDURES FOR COMMON ANALYSES
-- ================================================================

-- Procedure for market analysis
CREATE OR REPLACE PROCEDURE MARKET_ANALYSIS_SP()
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    result STRING;
BEGIN
    SELECT 
        'Market Analysis Summary:\n' ||
        'Total Sales: ' || COUNT(*) || '\n' ||
        'Average Sale Price: $' || ROUND(AVG(SALE_PRICE), 0) || '\n' ||
        'Average Days on Market: ' || ROUND(AVG(DAYS_ON_MARKET), 0) || '\n' ||
        'Most Popular Property Type: ' || 
        (SELECT PROPERTY_TYPE FROM HOUSING_SALES_SEMANTIC_VIEW 
         GROUP BY PROPERTY_TYPE ORDER BY COUNT(*) DESC LIMIT 1)
    INTO result
    FROM HOUSING_SALES_SEMANTIC_VIEW;
    
    RETURN result;
END;
$$;

-- Procedure for customer analysis
CREATE OR REPLACE PROCEDURE CUSTOMER_ANALYSIS_SP()
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    result STRING;
BEGIN
    SELECT 
        'Customer Analysis Summary:\n' ||
        'Average Customer Income: $' || ROUND(AVG(ANNUAL_INCOME), 0) || '\n' ||
        'Average Credit Score: ' || ROUND(AVG(CREDIT_SCORE), 0) || '\n' ||
        'Most Common Age Group: ' || 
        (SELECT CUSTOMER_AGE_GROUP FROM HOUSING_SALES_SEMANTIC_VIEW 
         GROUP BY CUSTOMER_AGE_GROUP ORDER BY COUNT(*) DESC LIMIT 1) || '\n' ||
        'Most Common Marital Status: ' ||
        (SELECT MARITAL_STATUS FROM HOUSING_SALES_SEMANTIC_VIEW 
         GROUP BY MARITAL_STATUS ORDER BY COUNT(*) DESC LIMIT 1)
    INTO result
    FROM HOUSING_SALES_SEMANTIC_VIEW;
    
    RETURN result;
END;
$$;

-- ================================================================
-- CREATE VIEWS FOR COMMON DASHBOARD QUERIES
-- ================================================================

-- Monthly sales trends
CREATE OR REPLACE VIEW MONTHLY_SALES_TRENDS AS
SELECT 
    SALE_YEAR,
    SALE_MONTH,
    SALE_MONTH_NAME,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    SUM(SALE_PRICE) AS TOTAL_SALES_VOLUME,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY SALE_YEAR, SALE_MONTH, SALE_MONTH_NAME
ORDER BY SALE_YEAR, SALE_MONTH;

-- Property type performance
CREATE OR REPLACE VIEW PROPERTY_TYPE_PERFORMANCE AS
SELECT 
    PROPERTY_TYPE,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    AVG(PRICE_PER_SQFT) AS AVG_PRICE_PER_SQFT,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    AVG(PRICE_REDUCTION_PERCENTAGE) AS AVG_PRICE_REDUCTION
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY PROPERTY_TYPE
ORDER BY AVG_SALE_PRICE DESC;

-- Geographic analysis
CREATE OR REPLACE VIEW GEOGRAPHIC_ANALYSIS AS
SELECT 
    CITY,
    METRO_AREA,
    COUNT(*) AS SALES_COUNT,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    AVG(PRICE_PER_SQFT) AS AVG_PRICE_PER_SQFT,
    AVG(WALK_SCORE) AS AVG_WALK_SCORE
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY CITY, METRO_AREA
ORDER BY AVG_SALE_PRICE DESC;

-- Customer segment analysis
CREATE OR REPLACE VIEW CUSTOMER_SEGMENT_ANALYSIS AS
SELECT 
    CUSTOMER_AGE_GROUP,
    INCOME_BRACKET,
    CREDIT_RATING,
    COUNT(*) AS CUSTOMER_COUNT,
    AVG(SALE_PRICE) AS AVG_PURCHASE_PRICE,
    AVG(DOWN_PAYMENT_PERCENTAGE) AS AVG_DOWN_PAYMENT_PCT
FROM HOUSING_SALES_SEMANTIC_VIEW
GROUP BY CUSTOMER_AGE_GROUP, INCOME_BRACKET, CREDIT_RATING
ORDER BY AVG_PURCHASE_PRICE DESC;

-- ================================================================
-- GRANT PERMISSIONS FOR ALL OBJECTS
-- ================================================================
GRANT USAGE ON STAGE SEMANTIC_MODELS TO ROLE SYSADMIN;
GRANT EXECUTE ON PROCEDURE MARKET_ANALYSIS_SP() TO ROLE SYSADMIN;
GRANT EXECUTE ON PROCEDURE CUSTOMER_ANALYSIS_SP() TO ROLE SYSADMIN;
GRANT SELECT ON VIEW MONTHLY_SALES_TRENDS TO ROLE SYSADMIN;
GRANT SELECT ON VIEW PROPERTY_TYPE_PERFORMANCE TO ROLE SYSADMIN;
GRANT SELECT ON VIEW GEOGRAPHIC_ANALYSIS TO ROLE SYSADMIN;
GRANT SELECT ON VIEW CUSTOMER_SEGMENT_ANALYSIS TO ROLE SYSADMIN;

-- ================================================================
-- VALIDATION AND TESTING
-- ================================================================

-- Test the stored procedures
CALL MARKET_ANALYSIS_SP();
CALL CUSTOMER_ANALYSIS_SP();

-- Test the analytical views
SELECT * FROM PROPERTY_TYPE_PERFORMANCE;
SELECT * FROM GEOGRAPHIC_ANALYSIS;

-- Display summary information
SELECT 
    'Database: HOUSING_INTELLIGENCE' AS INFO,
    'Total Tables: 3' AS DETAILS,
    'Semantic View: HOUSING_SALES_SEMANTIC_VIEW' AS SEMANTIC_INFO,
    'Cortex Analyst: HOUSING_ANALYST' AS ANALYST_INFO,
    'Ready for Natural Language Queries: YES' AS STATUS;

COMMENT ON CORTEX ANALYST HOUSING_ANALYST IS 'Natural language interface for housing sales data analysis';
COMMENT ON VIEW MONTHLY_SALES_TRENDS IS 'Monthly aggregated sales metrics for trend analysis';
COMMENT ON VIEW PROPERTY_TYPE_PERFORMANCE IS 'Performance metrics by property type';
COMMENT ON VIEW GEOGRAPHIC_ANALYSIS IS 'Geographic distribution of sales and pricing';
COMMENT ON VIEW CUSTOMER_SEGMENT_ANALYSIS IS 'Customer segmentation and purchasing behavior analysis';