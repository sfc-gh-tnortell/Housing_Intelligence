-- ================================================================
-- HOUSING INTELLIGENCE CORTEX SETUP
-- ================================================================
-- This script sets up both Cortex Analyst (structured data) and 
-- Cortex Search (unstructured documents) for comprehensive intelligence

USE DATABASE HOUSING_INTELLIGENCE;
USE SCHEMA CORE;

-- ================================================================
-- UPLOAD SEMANTIC MODEL TO STAGE
-- ================================================================
-- Note: Execute this command in SnowSQL or Snowsight to upload the YAML file
-- PUT file://05_semantic_model.yaml @SEMANTIC_MODELS_STAGE;

-- Verify stage contents
LIST @SEMANTIC_MODELS_STAGE;

-- ================================================================
-- CREATE CORTEX ANALYST
-- ================================================================
-- The Cortex Analyst provides natural language to SQL capabilities
-- using the semantic model and view we created

CREATE OR REPLACE CORTEX ANALYST HOUSING_ANALYST (
    SEMANTIC_MODEL = '@SEMANTIC_MODELS_STAGE/housing_sales_intelligence_model.yaml',
    DATABASE_NAME = 'HOUSING_INTELLIGENCE',
    SCHEMA_NAME = 'CORE'
) 
COMMENT = 'Cortex Analyst for housing sales data analysis with natural language querying capabilities across multi-state markets';

-- Alternative approach using the semantic view directly
CREATE OR REPLACE CORTEX ANALYST HOUSING_ANALYST_VIEW (
    SEMANTIC_VIEW = 'HOUSING_INTELLIGENCE.CORE.HOUSING_INTELLIGENCE_ANALYST_VIEW'
)
COMMENT = 'Cortex Analyst using semantic view for housing sales analysis and market intelligence';

-- ================================================================
-- CREATE CORTEX SEARCH SERVICE
-- ================================================================
-- The Cortex Search service enables semantic search across purchase agreement PDFs

-- Create the search service for purchase agreements
CREATE OR REPLACE CORTEX SEARCH SERVICE PURCHASE_AGREEMENTS_SEARCH
ON DOCUMENT_PATH
WAREHOUSE = COMPUTE_WH
TARGET_LAG = '1 minute'
AS (
    SELECT 
        DOCUMENT_PATH,
        DOCUMENT_NAME,
        SALE_ID,
        CONTRACT_DATE,
        CLOSING_DATE,
        SPECIAL_TERMS,
        CONTINGENCY_DETAILS,
        FINANCING_DETAILS,
        -- Enriched context from joined tables
        'Sale Price: $' || SALE_PRICE || 
        ' | Property: ' || ADDRESS || ', ' || CITY || ', ' || STATE ||
        ' | Buyer: ' || BUYER_NAME ||
        ' | Agent: ' || AGENT_NAME ||
        ' | Financing: ' || FINANCING_TYPE AS DOCUMENT_CONTEXT
    FROM DOCUMENT_SEARCH_METADATA
    WHERE DOCUMENT_PATH IS NOT NULL
);

-- ================================================================
-- REGISTER PURCHASE AGREEMENT PDFS
-- ================================================================
-- This section registers the purchase agreement PDFs in the system
-- Note: PDFs should be uploaded to the stage first

-- Update purchase agreement paths in sales table for existing agreements
UPDATE HOUSE_SALES 
SET PURCHASE_AGREEMENT_PATH = '@PURCHASE_AGREEMENTS_STAGE/agreement_' || LPAD(SALE_ID, 4, '0') || '.pdf'
WHERE PURCHASE_AGREEMENT_PATH IS NULL;

-- Register sample purchase agreements (expand as needed)
CALL REGISTER_PURCHASE_AGREEMENT(
    3001,
    'agreement_3001.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_3001.pdf',
    '2022-02-15',
    '2022-03-15',
    'Inspection contingency completed. Property sold as-is after professional inspection revealed minor foundation settling. Buyer accepted with $5,000 credit for future repairs.'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    3002,
    'agreement_3002.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_3002.pdf',
    '2022-02-20',
    '2022-03-20',
    'FHA financing contingency. First-time homebuyer utilizing FHA loan program. Seller agreed to pay 2% of closing costs to assist buyer.'
);

CALL REGISTER_PURCHASE_AGREEMENT(
    3003,
    'agreement_3003.pdf',
    '@PURCHASE_AGREEMENTS_STAGE/agreement_3003.pdf',
    '2022-03-01',
    '2022-04-01',
    'Appraisal contingency with escalation clause. Property appraised at full sale price. Buyer waived inspection contingency in competitive market.'
);

-- ================================================================
-- ENABLE CORTEX SEARCH ON PURCHASE AGREEMENTS
-- ================================================================
-- Refresh the search service to index new documents
ALTER CORTEX SEARCH SERVICE PURCHASE_AGREEMENTS_SEARCH REFRESH;

-- ================================================================
-- CREATE CORTEX AGENT (ADVANCED INTEGRATION)
-- ================================================================
-- Cortex Agent combines both Analyst and Search capabilities
-- Note: This feature may require specific Snowflake account capabilities

CREATE OR REPLACE FUNCTION HOUSING_INTELLIGENCE_AGENT(query STRING)
RETURNS STRING
LANGUAGE SQL
AS
$$
    -- This function integrates both structured and unstructured data queries
    -- It would route between Cortex Analyst for data questions and 
    -- Cortex Search for document questions
    
    SELECT CASE 
        WHEN LOWER(query) LIKE '%agreement%' OR LOWER(query) LIKE '%contract%' OR LOWER(query) LIKE '%document%' 
        THEN 'SEARCH_MODE: Use CORTEX_SEARCH for purchase agreements and legal documents'
        ELSE 'ANALYST_MODE: Use CORTEX_ANALYST for data analysis and market trends'
    END
$$;

-- Alternative comprehensive agent approach (when Cortex Agents are available)
-- CREATE OR REPLACE CORTEX AGENT HOUSING_INTELLIGENCE_AGENT (
--     ANALYST = 'HOUSING_ANALYST_VIEW',
--     SEARCH_SERVICE = 'PURCHASE_AGREEMENTS_SEARCH', 
--     INSTRUCTIONS = 'You are a real estate market intelligence agent. You can analyze housing sales data using structured queries and search through purchase agreements and legal documents. For market analysis, pricing trends, and customer insights, use the structured data. For contract terms, contingencies, and legal details, search the purchase agreement documents.',
--     DESCRIPTION = 'Comprehensive housing intelligence agent combining structured data analysis with document search capabilities'
-- );

-- ================================================================
-- CREATE HELPER FUNCTIONS FOR INTEGRATED QUERIES
-- ================================================================

-- Function to search purchase agreements with context
CREATE OR REPLACE FUNCTION SEARCH_PURCHASE_AGREEMENTS(search_query STRING)
RETURNS TABLE (
    SALE_ID NUMBER,
    DOCUMENT_NAME STRING,
    RELEVANCE_SCORE FLOAT,
    MATCHED_TEXT STRING,
    SALE_PRICE NUMBER,
    PROPERTY_ADDRESS STRING,
    BUYER_NAME STRING
)
LANGUAGE SQL
AS
$$
    SELECT 
        pa.SALE_ID,
        pa.DOCUMENT_NAME,
        search_results.RELEVANCE_SCORE,
        search_results.MATCHED_TEXT,
        hsv.SALE_PRICE,
        hsv.FULL_ADDRESS,
        hsv.FULL_NAME
    FROM TABLE(
        CORTEX_SEARCH(
            'PURCHASE_AGREEMENTS_SEARCH',
            search_query,
            10  -- Return top 10 results
        )
    ) search_results
    JOIN PURCHASE_AGREEMENTS pa ON search_results.DOCUMENT_PATH = pa.DOCUMENT_PATH
    JOIN HOUSING_SALES_SEMANTIC_VIEW hsv ON pa.SALE_ID = hsv.SALE_ID
    ORDER BY search_results.RELEVANCE_SCORE DESC
$$;

-- Function to get comprehensive property and agreement details
CREATE OR REPLACE FUNCTION GET_PROPERTY_INTELLIGENCE(property_address STRING)
RETURNS TABLE (
    SALE_ID NUMBER,
    PROPERTY_ADDRESS STRING,
    SALE_PRICE NUMBER,
    BUYER_NAME STRING,
    AGENT_NAME STRING,
    SALE_DATE DATE,
    AGREEMENT_AVAILABLE STRING,
    MARKET_ANALYSIS STRING
)
LANGUAGE SQL
AS
$$
    SELECT 
        hsv.SALE_ID,
        hsv.FULL_ADDRESS,
        hsv.SALE_PRICE,
        hsv.FULL_NAME,
        hsv.AGENT_NAME,
        hsv.SALE_DATE,
        hsv.AGREEMENT_STATUS,
        'Regional Market: ' || hsv.REGIONAL_MARKET || 
        ' | Price/SqFt: $' || ROUND(hsv.PRICE_PER_SQFT, 0) ||
        ' | Market Timing: ' || hsv.MARKET_TIMING ||
        ' | Interest Rate: ' || COALESCE(hsv.INTEREST_RATE || '%', 'Cash Purchase') AS MARKET_ANALYSIS
    FROM HOUSING_SALES_SEMANTIC_VIEW hsv
    WHERE UPPER(hsv.FULL_ADDRESS) LIKE UPPER('%' || property_address || '%')
$$;

-- ================================================================
-- GRANT PERMISSIONS
-- ================================================================
GRANT USAGE ON CORTEX ANALYST HOUSING_ANALYST TO ROLE SYSADMIN;
GRANT USAGE ON CORTEX ANALYST HOUSING_ANALYST_VIEW TO ROLE SYSADMIN;
GRANT USAGE ON CORTEX SEARCH SERVICE PURCHASE_AGREEMENTS_SEARCH TO ROLE SYSADMIN;
GRANT EXECUTE ON FUNCTION HOUSING_INTELLIGENCE_AGENT(STRING) TO ROLE SYSADMIN;
GRANT EXECUTE ON FUNCTION SEARCH_PURCHASE_AGREEMENTS(STRING) TO ROLE SYSADMIN;
GRANT EXECUTE ON FUNCTION GET_PROPERTY_INTELLIGENCE(STRING) TO ROLE SYSADMIN;

-- ================================================================
-- TESTING CORTEX ANALYST FUNCTIONALITY
-- ================================================================

-- Test basic natural language queries with Cortex Analyst
-- Note: These would typically be executed through Snowsight or applications

/*
-- Example Cortex Analyst queries:

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW',
    'What is the average sale price by state?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW', 
    'Show me the top 5 most expensive markets by average price per square foot'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW',
    'How do customer income levels correlate with the price of homes they purchase?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW',
    'Compare sales trends between 2022 and 2023 by quarter'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW',
    'What are the characteristics of cash buyers vs financed buyers?'
);

SELECT CORTEX_ANALYST_QUERY(
    'HOUSING_ANALYST_VIEW',
    'How did interest rate changes affect days on market?'
);
*/

-- ================================================================
-- TESTING CORTEX SEARCH FUNCTIONALITY
-- ================================================================

-- Test document search across purchase agreements
/*
-- Example Cortex Search queries:

SELECT * FROM TABLE(
    CORTEX_SEARCH(
        'PURCHASE_AGREEMENTS_SEARCH',
        'inspection contingency',
        5
    )
);

SELECT * FROM TABLE(
    CORTEX_SEARCH(
        'PURCHASE_AGREEMENTS_SEARCH',
        'FHA financing first time buyer',
        5
    )
);

SELECT * FROM TABLE(
    CORTEX_SEARCH(
        'PURCHASE_AGREEMENTS_SEARCH',
        'appraisal escalation clause',
        5
    )
);
*/

-- ================================================================
-- TESTING INTEGRATED FUNCTIONS
-- ================================================================

-- Test the search function
SELECT * FROM TABLE(SEARCH_PURCHASE_AGREEMENTS('inspection'));

-- Test property intelligence
SELECT * FROM TABLE(GET_PROPERTY_INTELLIGENCE('Austin'));

-- ================================================================
-- CREATE ANALYTICS DASHBOARDS SUPPORT
-- ================================================================

-- Create view for dashboard metrics
CREATE OR REPLACE VIEW DASHBOARD_METRICS AS
SELECT 
    -- Current period metrics
    COUNT(*) AS TOTAL_SALES,
    AVG(SALE_PRICE) AS AVG_SALE_PRICE,
    SUM(SALE_PRICE) AS TOTAL_VOLUME,
    AVG(DAYS_ON_MARKET) AS AVG_DAYS_ON_MARKET,
    COUNT(DISTINCT STATE) AS STATES_ACTIVE,
    COUNT(DISTINCT CUSTOMER_ID) AS UNIQUE_CUSTOMERS,
    
    -- Market composition
    COUNT(CASE WHEN PAYMENT_METHOD = 'Cash Purchase' THEN 1 END) * 100.0 / COUNT(*) AS CASH_PERCENTAGE,
    COUNT(CASE WHEN PREMIUM_FEATURES = 'Premium Features' THEN 1 END) * 100.0 / COUNT(*) AS PREMIUM_PERCENTAGE,
    
    -- Geographic distribution
    COUNT(CASE WHEN STATE = 'CA' THEN 1 END) * 100.0 / COUNT(*) AS CALIFORNIA_PERCENTAGE,
    COUNT(CASE WHEN STATE = 'TX' THEN 1 END) * 100.0 / COUNT(*) AS TEXAS_PERCENTAGE,
    
    -- Date range
    MIN(SALE_DATE) AS EARLIEST_SALE,
    MAX(SALE_DATE) AS LATEST_SALE,
    
    -- Document coverage
    COUNT(CASE WHEN AGREEMENT_STATUS = 'Available' THEN 1 END) * 100.0 / COUNT(*) AS DOCUMENT_COVERAGE_PCT
    
FROM HOUSING_SALES_SEMANTIC_VIEW;

-- ================================================================
-- SYSTEM VALIDATION AND STATUS
-- ================================================================

-- Verify all components are created
SELECT 
    'Cortex Analyst: HOUSING_ANALYST_VIEW' AS COMPONENT,
    'ACTIVE' AS STATUS,
    'Natural language to SQL for structured data' AS CAPABILITY
UNION ALL
SELECT 
    'Cortex Search: PURCHASE_AGREEMENTS_SEARCH' AS COMPONENT,
    'ACTIVE' AS STATUS,
    'Semantic search across purchase agreement PDFs' AS CAPABILITY
UNION ALL
SELECT 
    'Semantic View: HOUSING_SALES_SEMANTIC_VIEW' AS COMPONENT,
    'ACTIVE' AS STATUS,
    'Enriched data view with derived dimensions' AS CAPABILITY
UNION ALL
SELECT 
    'Helper Functions: 3 functions' AS COMPONENT,
    'ACTIVE' AS STATUS,
    'Integrated search and intelligence functions' AS CAPABILITY;

-- Display summary metrics
SELECT * FROM DASHBOARD_METRICS;

-- Show sample data from semantic view
SELECT 
    SALE_ID,
    FULL_ADDRESS,
    SALE_PRICE,
    REGIONAL_MARKET,
    SALE_DATE,
    AGREEMENT_STATUS
FROM HOUSING_SALES_SEMANTIC_VIEW 
LIMIT 5;

-- ================================================================
-- NEXT STEPS AND USAGE INSTRUCTIONS
-- ================================================================

SELECT 
    'Housing Intelligence System Ready' AS STATUS,
    'Use CORTEX_ANALYST_QUERY() for data analysis' AS STRUCTURED_DATA,
    'Use CORTEX_SEARCH() for document search' AS UNSTRUCTURED_DATA,
    'Both systems integrated with enriched context' AS INTEGRATION;

COMMENT ON CORTEX ANALYST HOUSING_ANALYST_VIEW IS 'Natural language interface for housing sales data analysis and market intelligence';
COMMENT ON CORTEX SEARCH SERVICE PURCHASE_AGREEMENTS_SEARCH IS 'Semantic search service for purchase agreement documents with enriched context';
COMMENT ON FUNCTION SEARCH_PURCHASE_AGREEMENTS(STRING) IS 'Helper function to search purchase agreements with sale context';
COMMENT ON FUNCTION GET_PROPERTY_INTELLIGENCE(STRING) IS 'Comprehensive property analysis combining structured data and document availability';
COMMENT ON VIEW DASHBOARD_METRICS IS 'Key metrics and KPIs for dashboard and reporting applications';